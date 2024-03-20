package mpanampy;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import annotation.Column;
import annotation.Foreign;
import annotation.Primary;
import connection.*;

public class MiDao {

    public Connection connection;


    /**
     * 
     * @param connection is a connection that if null it search in the "settings/connection.prop"
     */
    public MiDao(Connection connection) throws Exception{
        if(connection==null){
            this.connection = Connect.connection(null);
        }
        else this.connection=connection;
    }



    <T> T setFieldColumn(ResultSet res, Class<T> temp) throws Exception {
        List<Field> fields = MiAuto.getFieldsAnnoted(temp, Column.class);
        T temporar = temp.newInstance();
        for (Field field : fields) {
            HashMap<Class, Method> map = parsing(res);
            Method set = temp.getMethod("set" + MiAuto.toRenisoratra(field.getName(), 0), field.getType());
            set.invoke(temporar, getBasicParseSql(res, field.getType(), field.getAnnotation(Column.class).name()));
        }
        setForeignFieldColumn(res, temporar);
        return temporar;
    }

    <T> void setForeignFieldColumn(ResultSet res, T temporar) throws Exception {
        List<Field> fields = MiAuto.getFieldsAnnoted(temporar.getClass(), Foreign.class);
        String id;
        for (Field field : fields) {
            id = res.getString(field.getAnnotation(Foreign.class).name());
            Method set = temporar.getClass().getMethod("set" + MiAuto.toRenisoratra(field.getName(), 0), field.getType());
            set.invoke(temporar, getById(id, field.getType()));
        }
    }

    HashMap<Class, Method> parsing(ResultSet res) throws Exception {
        HashMap<Class, Method> valiny = new HashMap<Class, Method>();
        valiny.put(double.class, res.getClass().getMethod("getDouble", String.class));
        valiny.put(String.class, res.getClass().getMethod("getString", String.class));
        valiny.put(int.class, res.getClass().getMethod("getInt", String.class));
        valiny.put(LocalDate.class, res.getClass().getMethod("getString", String.class));
        return valiny;
    }

    HashMap<Class, String> getParseInsert(Object obj) {
        HashMap<Class, String> valiny = new HashMap<Class, String>();
        valiny.put(LocalDate.class, "to_date('" + obj + "','yyyy-mm-dd')");
        valiny.put(Date.class, "to_date('" + obj + "','yyyy-mm-dd')");
        valiny.put(java.util.Date.class, "to_date('" + obj + "','yyyy-mm-dd')");
        valiny.put(String.class, "'" + obj + "'");
        valiny.put(Double.class, obj + "");
        valiny.put(Integer.class, obj + "");
        valiny.put(double.class, obj + "");
        valiny.put(int.class, obj + "");
        valiny.put(Float.class, obj + "");
        valiny.put(float.class, obj + "");
        return valiny;
    }

    HashMap<String, String> getDbSequenceMethod(String seqName) {
        HashMap<String, String> valiny = new HashMap<String, String>();
        valiny.put("oracle", "" + seqName + ".nextval");
        valiny.put("postgres", "nextval('" + seqName + "')");
        return valiny;
    }

    <T> T getBasicParseSql(ResultSet res, Class<T> value, String col) throws Exception {
        Method get = parsing(res).get(value);
        Object valiny = get.invoke(res, col);
        if (value.getSimpleName().equals("LocalDate"))
            return (T) LocalDate.parse((String) valiny);
        return (T) valiny;
    }

    <T> String getQuery(T temporar, Field field, boolean printNull) throws Exception {
        String query = "";
        Class temp = temporar.getClass();
        String column = new String(), foreign = new String();
        Method get;
        Object fk;
        try {
            foreign = field.getAnnotation(Foreign.class).name();
            get = temp.getMethod("get" + MiAuto.toRenisoratra(field.getName(), 0));
            fk = get.invoke(temporar);
            Field primary = MiAuto.getFieldsAnnoted(fk.getClass(), Primary.class).get(0);
            Method getForeign = fk.getClass().getMethod("get" + MiAuto.toRenisoratra(primary.getName(), 0));
            if (printNull)
                query += getParseInsert(getForeign.invoke(fk)).get(primary.getType());
            else
                query += " " + field.getAnnotation(Foreign.class).name() + "="
                        + getParseInsert(getForeign.invoke(fk)).get(primary.getType());
        } catch (Exception e) {
            try {
                column = field.getAnnotation(Column.class).name();
                get = temp.getMethod("get" + MiAuto.toRenisoratra(field.getName(), 0));
                if (printNull)
                    query += getParseInsert(get.invoke(temporar)).get(field.getType());
                else
                    query += " " + field.getAnnotation(Column.class).name() + "="
                            + getParseInsert(get.invoke(temporar)).get(field.getType());
            } catch (Exception ex) {
                if (printNull)
                    query += "null";
            }
        }
        return query;
    }

    String getQueryForInsertColumn(Field[] fields) {
        String query = "(";
        String appending = "";
        int i = 0;
        for (Field f : fields) {
            try {
                appending = f.getAnnotation(Foreign.class).name();
            } catch (Exception e) {
                try {
                    appending = f.getAnnotation(Column.class).name();
                } catch (Exception ex) {
                }
            }
            query += appending;
            if (i < fields.length - 1)
                query += ",";
            i++;
        }
        query += ")";
        return query;
    }

    public <T> List<T> getAll(Class<T> temp) throws Exception {
        List<T> valiny = new ArrayList<T>();
        Statement stmt = connection.createStatement();
        String query = "select * from " + temp.getSimpleName().toLowerCase();
        ResultSet res = stmt.executeQuery(query);
        T temporar = temp.newInstance();
        while (res.next()) {
            temporar = setFieldColumn(res, temp);
            setForeignFieldColumn(res, temporar);
            valiny.add(temporar);
        }
        return valiny;
    }

    public <T, K> T getById(K id, Class<T> temp) throws Exception {
        Statement stmt = connection.createStatement();
        Field primary = MiAuto.getFieldsAnnoted(temp, Primary.class).get(0);
        String query = "select * from " + temp.getSimpleName().toLowerCase() + " where "
                + primary.getAnnotation(Column.class).name() + "='" + id + "'";
        ResultSet res = stmt.executeQuery(query);
        while (res.next()) {
            return setFieldColumn(res, temp);
        }
        return null;
    }

    public <T> List<T> find(Class<T> temp, String condition) throws Exception {
        List<T> valiny = new ArrayList<T>();
        Statement stmt = connection.createStatement();
        String query = "select * from " + temp.getSimpleName().toLowerCase() + " where " + condition;
        ResultSet res = stmt.executeQuery(query);
        List<Field> fields = MiAuto.getFieldsAnnoted(temp, Column.class);
        T temporar = temp.newInstance();
        while (res.next()) {
            temporar = setFieldColumn(res, temp);
            valiny.add(temporar);
        }
        return valiny;
    }

    public <T> List<T> findIn(Class<T> temp, String condition) throws Exception {
        List<T> valiny = new ArrayList<T>();
        Statement stmt = connection.createStatement();
        String query = "select * from " + temp.getSimpleName().toLowerCase() + " " + condition;
        ResultSet res = stmt.executeQuery(query);
        List<Field> fields = MiAuto.getFieldsAnnoted(temp, Column.class);
        T temporar = temp.newInstance();
        while (res.next()) {
            temporar = setFieldColumn(res, temp);
            setForeignFieldColumn(res, temporar);
            valiny.add(temporar);
        }
        return valiny;
    }

    public <T> String insert(T temporar) throws Exception {
        Class temp = temporar.getClass();
        Statement stmt = connection.createStatement();
        Field[] fields = temporar.getClass().getDeclaredFields();
        String query = "insert into " + temp.getSimpleName() + " " + getQueryForInsertColumn(fields) + " values(";
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            query += getQuery(temporar, field, true);
            if (i < fields.length - 1)
                query += ",";
        }
        query += ")";
        stmt.executeUpdate(query);
        try {
            connection.commit();
        } catch (Exception e) {
        }
        return query;
    }

    public <T> void update(T temporar, String condition) throws Exception {
        Class temp = temporar.getClass();
        Statement stmt = connection.createStatement();
        String query = "update " + temp.getSimpleName() + " set";
        Field[] fields = temporar.getClass().getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            query += getQuery(temporar, field, false);
            if (i < fields.length - 1)
                query += ",";
        }
        if (!condition.equals(""))
            query += " where " + condition;
        stmt.executeUpdate(query);
        try {
            connection.commit();
        } catch (Exception e) {
        }
    }

    public <T> void update(T temporar) throws Exception {
        Class temp = temporar.getClass();
        Statement stmt = connection.createStatement();
        String query = "update " + temp.getSimpleName() + " set ";
        Field[] fields = temporar.getClass().getDeclaredFields();
        String column = new String(), foreign = new String();
        Method get;
        Object fk;
        Field primary;
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            query += getQuery(temporar, field, false);
            if (i < fields.length - 1)
                query += ",";
        }
        List<Field> primaries = MiAuto.getFieldsAnnoted(temp, Primary.class);
        primary = primaries.get(0);
        get = temp.getMethod("get" + MiAuto.toRenisoratra(primary.getName(), 0));
        query += " where " + primary.getAnnotation(Column.class).name() + "="
                + getParseInsert(get.invoke(temporar)).get(primary.getType());
        stmt.executeUpdate(query);
        try {
            connection.close();
            connection.commit();
        } catch (Exception e) {
        }
    }

    public String nextVal(String sequenceName) throws Exception {
        String valiny = new String();
        Statement stmt = connection.createStatement();
        HashMap<String, String> map = getDbSequenceMethod(sequenceName);
        ResultSet res = stmt.executeQuery("select " + map.get(Connect.getDbType()));
        if (res.next())
            valiny = res.getString("nextval");
        return valiny;
    }

    public List<String[]> getValues(String query, String... col) throws Exception {
        List<String[]> valiny = new ArrayList<String[]>();
        ResultSet res = connection.createStatement().executeQuery(query);
        while (res.next()) {
            String[] val = new String[col.length];
            for (int i = 0; i < val.length; i++) {
                val[i] = res.getString(col[i]);
            }
            valiny.add(val);
        }
        return valiny;
    }

    public <T> void delete(T temporar) throws Exception {
        String valiny = new String();
        Class temp = temporar.getClass();
        Statement stmt = connection.createStatement();
        Field prim = (Field) MiAuto.getFieldsAnnoted(temp, Primary.class).get(0);
        Method get = temp.getMethod("get" + MiAuto.toRenisoratra(prim.getName(), 0));
        String primary = prim.getAnnotation(Column.class).name();
        String query = "delete from " + temp.getSimpleName() + " where " + primary + "="
                + getParseInsert(get.invoke(temporar)).get(prim.getType()) + "";
        stmt.executeUpdate(query);
        try {
            connection.commit();
        } catch (Exception e) {
        }
    }

    public <T> void delete(List<T> objs) throws Exception {
        for (T t : objs) {
            delete(t);
        }
    }

    public void closeConnection() throws Exception{
        if(connection == null) connection.close();
    }

}
