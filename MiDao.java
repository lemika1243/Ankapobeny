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

    public static Connection connection;

    static <T> T setFieldColumn(ResultSet res, Class<T> temp) throws Exception {
        List<Field> fields = Auto.getFieldsAnnoted(temp, Column.class);
        T temporar = temp.newInstance();
        for (Field field : fields) {
            HashMap<Class, Method> map = parsing(res);
            Method set = temp.getMethod("set" + Auto.toRenisoratra(field.getName(), 0), field.getType());
            set.invoke(temporar, getBasicParseSql(res, field.getType(), field.getAnnotation(Column.class).name()));
        }
        setForeignFieldColumn(res, temporar);
        return temporar;
    }

    static <T> void setForeignFieldColumn(ResultSet res, T temporar) throws Exception {
        List<Field> fields = Auto.getFieldsAnnoted(temporar.getClass(), Foreign.class);
        String id;
        for (Field field : fields) {
            id = res.getString(field.getAnnotation(Foreign.class).name());
            Method set = temporar.getClass().getMethod("set" + Auto.toRenisoratra(field.getName(), 0), field.getType());
            set.invoke(temporar, getById(id, field.getType()));
        }
    }

    static HashMap<Class, Method> parsing(ResultSet res) throws Exception {
        HashMap<Class, Method> valiny = new HashMap<Class, Method>();
        valiny.put(double.class, res.getClass().getMethod("getDouble", String.class));
        valiny.put(String.class, res.getClass().getMethod("getString", String.class));
        valiny.put(int.class, res.getClass().getMethod("getInt", String.class));
        valiny.put(LocalDate.class, res.getClass().getMethod("getString", String.class));
        return valiny;
    }

    static HashMap<Class, String> getParseInsert(Object obj) {
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

    static HashMap<String, String> getDbSequenceMethod(String seqName) {
        HashMap<String, String> valiny = new HashMap<String, String>();
        valiny.put("oracle", "" + seqName + ".nextval");
        valiny.put("postgres", "nextval('" + seqName + "')");
        return valiny;
    }

    static <T> T getBasicParseSql(ResultSet res, Class<T> value, String col) throws Exception {
        Method get = parsing(res).get(value);
        Object valiny = get.invoke(res, col);
        if (value.getSimpleName().equals("LocalDate"))
            return (T) LocalDate.parse((String) valiny);
        return (T) valiny;
    }

    static <T> String getQuery(T temporar, Field field, boolean printNull) throws Exception {
        String query = "";
        Class temp = temporar.getClass();
        String column = new String(), foreign = new String();
        Method get;
        Object fk;
        try {
            foreign = field.getAnnotation(Foreign.class).name();
            get = temp.getMethod("get" + Auto.toRenisoratra(field.getName(), 0));
            fk = get.invoke(temporar);
            Field primary = Auto.getFieldsAnnoted(fk.getClass(), Primary.class).get(0);
            Method getForeign = fk.getClass().getMethod("get" + Auto.toRenisoratra(primary.getName(), 0));
            if (printNull)
                query += getParseInsert(getForeign.invoke(fk)).get(primary.getType());
            else
                query += " " + field.getAnnotation(Foreign.class).name() + "="
                        + getParseInsert(getForeign.invoke(fk)).get(primary.getType());
        } catch (Exception e) {
            try {
                column = field.getAnnotation(Column.class).name();
                get = temp.getMethod("get" + Auto.toRenisoratra(field.getName(), 0));
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

    static String getQueryForInsertColumn(Field[] fields) {
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

    public static <T> List<T> getAll(Class<T> temp) throws Exception {
        List<T> valiny = new ArrayList<T>();
        connection = Connect.connection();
        Statement stmt = connection.createStatement();
        String query = "select * from " + temp.getSimpleName().toLowerCase();
        ResultSet res = stmt.executeQuery(query);
        T temporar = temp.newInstance();
        connection.close();
        while (res.next()) {
            temporar = setFieldColumn(res, temp);
            setForeignFieldColumn(res, temporar);
            valiny.add(temporar);
        }
        return valiny;
    }

    public static <T, K> T getById(K id, Class<T> temp) throws Exception {
        connection = Connect.connection();
        Statement stmt = connection.createStatement();
        Field primary = Auto.getFieldsAnnoted(temp, Primary.class).get(0);
        String query = "select * from " + temp.getSimpleName().toLowerCase() + " where "
                + primary.getAnnotation(Column.class).name() + "='" + id + "'";
        ResultSet res = stmt.executeQuery(query);
        connection.close();
        while (res.next()) {
            return setFieldColumn(res, temp);
        }
        return null;
    }

    public static <T> List<T> find(Class<T> temp, String condition) throws Exception {
        List<T> valiny = new ArrayList<T>();
        connection = Connect.connection();
        Statement stmt = connection.createStatement();
        String query = "select * from " + temp.getSimpleName().toLowerCase() + " where " + condition;
        ResultSet res = stmt.executeQuery(query);
        List<Field> fields = Auto.getFieldsAnnoted(temp, Column.class);
        T temporar = temp.newInstance();
        connection.close();
        while (res.next()) {
            temporar = setFieldColumn(res, temp);
            valiny.add(temporar);
        }
        return valiny;
    }

    public static <T> List<T> findIn(Class<T> temp, String condition) throws Exception {
        List<T> valiny = new ArrayList<T>();
        connection = Connect.connection();
        Statement stmt = connection.createStatement();
        String query = "select * from " + temp.getSimpleName().toLowerCase() + " " + condition;
        ResultSet res = stmt.executeQuery(query);
        List<Field> fields = Auto.getFieldsAnnoted(temp, Column.class);
        T temporar = temp.newInstance();
        connection.close();
        while (res.next()) {
            temporar = setFieldColumn(res, temp);
            setForeignFieldColumn(res, temporar);
            valiny.add(temporar);
        }
        return valiny;
    }

    public static <T> String insert(T temporar) throws Exception {
        Class temp = temporar.getClass();
        connection = Connect.connection();
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
        connection.close();
        return query;
    }

    public static <T> void update(T temporar, String condition) throws Exception {
        Class temp = temporar.getClass();
        connection = Connect.connection();
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
        connection.close();
    }

    public static <T> void update(T temporar) throws Exception {
        Class temp = temporar.getClass();
        connection = Connect.connection();
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
        List<Field> primaries = Auto.getFieldsAnnoted(temp, Primary.class);
        primary = primaries.get(0);
        get = temp.getMethod("get" + Auto.toRenisoratra(primary.getName(), 0));
        query += " where " + primary.getAnnotation(Column.class).name() + "="
                + getParseInsert(get.invoke(temporar)).get(primary.getType());
        stmt.executeUpdate(query);
        try {
            connection.close();
            connection.commit();
        } catch (Exception e) {
        }
    }

    public static String nextVal(String sequenceName) throws Exception {
        String valiny = new String();
        connection = Connect.connection();
        Statement stmt = connection.createStatement();
        HashMap<String, String> map = getDbSequenceMethod(sequenceName);
        ResultSet res = stmt.executeQuery("select " + map.get(Connect.getDbType()));
        if (res.next())
            valiny = res.getString("nextval");
        connection.close();
        return valiny;
    }

    public static List<String[]> getValues(String query, String... col) throws Exception {
        List<String[]> valiny = new ArrayList<String[]>();
        ResultSet res = Connect.connection().createStatement().executeQuery(query);
        while (res.next()) {
            String[] val = new String[col.length];
            for (int i = 0; i < val.length; i++) {
                val[i] = res.getString(col[i]);
            }
            valiny.add(val);
        }
        connection.close();
        return valiny;
    }

    public static <T> void delete(T temporar) throws Exception {
        String valiny = new String();
        connection = Connect.connection();
        Class temp = temporar.getClass();
        Statement stmt = connection.createStatement();
        Field prim = (Field) Auto.getFieldsAnnoted(temp, Primary.class).get(0);
        Method get = temp.getMethod("get" + Auto.toRenisoratra(prim.getName(), 0));
        String primary = prim.getAnnotation(Column.class).name();
        String query = "delete from " + temp.getSimpleName() + " where " + primary + "="
                + getParseInsert(get.invoke(temporar)).get(prim.getType()) + "";
        stmt.executeUpdate(query);
        try {
            connection.commit();
        } catch (Exception e) {
        }
        connection.close();
    }

    public static <T> void delete(List<T> objs) throws Exception {
        for (T t : objs) {
            delete(t);
        }
    }

}