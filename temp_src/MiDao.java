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
     * @param connection is a connection that if null it search in the
     *                   "settings/connection.prop"
     */

    public MiDao(String connection) throws Exception {
        this.connection = Connect.connection(connection);
        if (connection == null || connection.equals("")) {
            throw new Exception("You must use a connection path");
        }
    }

    <T> T setFieldColumn(ResultSet res, Class<T> temp) throws Exception {
        List<Field> fields = MiAuto.getFieldsAnnoted(temp, Column.class);
        T temporar = temp.newInstance();
        for (Field field : fields) {
            HashMap<Class, Method> map = parsing(res);
            Method set = temp.getMethod("set" + MiAuto.toRenisoratra(field.getName(), 0), field.getType());
            Object object = getBasicParseSql(res, field.getType(), field.getAnnotation(Column.class).name());
            set.invoke(temporar, object);
        }
        setForeignFieldColumn(res, temporar);
        return temporar;
    }

    <T> void setForeignFieldColumn(ResultSet res, T temporar) throws Exception {
        List<Field> fields = MiAuto.getFieldsAnnoted(temporar.getClass(), Foreign.class);
        String id;
        for (Field field : fields) {
            id = res.getString(field.getAnnotation(Foreign.class).name());
            Method set = temporar.getClass().getMethod("set" + MiAuto.toRenisoratra(field.getName(), 0),
                    field.getType());
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
        valiny.put("oracle", "" + seqName + ".nextval from dual");
        valiny.put("postgres", "nextval('" + seqName + "')");
        return valiny;
    }

    <T> Object getBasicParseSql(ResultSet res, Class<T> value, String col) throws Exception {
        if (value.getName().equals(String.class.getName())) {
            return res.getString(col);
        } else if (value.getName().equals(double.class.getName())) {
            return res.getDouble(col);
        } else if (value.getName().equals(int.class.getName())) {
            return res.getInt(col);
        } else if (value.getName().equals(float.class.getName())) {
            return res.getFloat(col);
        } else if (value.getName().equals(Timestamp.class.getName())) {
            return res.getTimestamp(col);
        } else if (value.getName().equals(LocalDate.class.getName())) {
            return LocalDate.parse(res.getString(col));
        }
        throw new Exception("we do not have a parsing for " + value);
    }

    <T> String getQueryConditions(T temporar, Field field, boolean printNull) throws Exception {
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
            Object o = getForeign.invoke(fk);
            if (printNull)
                query += " " + field.getAnnotation(Foreign.class).name() + "="
                        + getParseInsert(o).get(primary.getType());
            else {
                if (o != null || !o.equals("null"))
                    query += " " + field.getAnnotation(Foreign.class).name() + "="
                            + getParseInsert(o).get(primary.getType());
            }
        } catch (Exception e) {
            try {
                column = field.getAnnotation(Column.class).name();
                get = temp.getMethod("get" + MiAuto.toRenisoratra(field.getName(), 0));
                Object geto = get.invoke(temporar);
                if (printNull)
                    query += " " + field.getAnnotation(Column.class).name() + "="
                            + getParseInsert(geto).get(field.getType());
                else {
                    if (geto != null || !geto.equals("null")) {
                        query += " " + field.getAnnotation(Column.class).name() + "="
                                + getParseInsert(geto).get(field.getType());
                    }
                }
            } catch (Exception ex) {
                if (printNull)
                    query += "null";
            }
        }
        return query;
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

    /// SELECTING

    public <T> List<T> getAll(Class<T> temp) throws Exception {
        List<T> valiny = getAll(temp, null, 10, 2);
        return valiny;
    }

    public <T> List<T> getAll(Class<T> temp, List<T> objects, int begin, int max) throws Exception {
        List<T> valiny = new ArrayList<T>();
        if (objects == null) {
            Statement stmt = connection.createStatement();
            String query = "select * from " + temp.getSimpleName().toLowerCase();
            ResultSet res = stmt.executeQuery(query);
            T temporar = temp.newInstance();
            while (res.next()) {
                temporar = setFieldColumn(res, temp);
                setForeignFieldColumn(res, temporar);
                valiny.add(temporar);
            }
        } else {
            valiny = objects.subList(begin, begin + max);
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

    /**
     * returns all the object in the database that correspond to the condition and
     * the query
     * <p>
     * <strong>
     * DANGER !!!!!
     * </strong>
     * : This method must have a condition.
     * </p>
     * 
     * @param <T>       type of the objects to return
     * @param condition condition in String
     * @return the list of the object associated to the base
     * @throws Exception
     */
    public <T> List<T> find(Class<T> temp, String condition) throws Exception {
        if (condition == null || condition.equals(""))
            throw new Exception("Must have a condition");
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

    /**
     * @return all the possibilities values in condition of T(The object to verify)
     */
    public <T> List<T> findAllWithCriteria(T temporar, Class<T> clazz) throws Exception {
        String conditions = "";
        List<T> valiny = new ArrayList<>();
        Statement stmt = connection.createStatement();
        String temp = "";
        int mpanisa = 0;
        for (Field field : clazz.getDeclaredFields()) {
            String mety = getQueryConditions(temporar, field, false);
            if (mpanisa > 0 && !mety.equals(""))
                temp += " and";
            temp += mety;
            mpanisa++;
        }
        if (!temp.equals(""))
            conditions += " where" + temp;
        String query = "select * from " + clazz.getSimpleName().toLowerCase() + conditions;
        ResultSet res = stmt.executeQuery(query);
        T mety = (T) clazz.newInstance();
        while (res.next()) {
            mety = setFieldColumn(res, clazz);
            valiny.add(mety);
        }
        System.out.println(query);
        return valiny;
    }

    /**
     * like find() but does not necessarily need a condition
     */
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
    /// END
    
    /// INSERT
    public <T> void insert(T object) throws Exception {
        Class<?> clazz = object.getClass();
        StringBuilder sql = new StringBuilder("INSERT INTO " + clazz.getSimpleName() + " (");
        StringBuilder values = new StringBuilder(" VALUES (");

        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            field.setAccessible(true);

            // Check for @Column annotation
            if (field.isAnnotationPresent(Column.class)) {
                Column column = field.getAnnotation(Column.class);
                sql.append(column.name()).append(", ");
                values.append("?, "); // Placeholder for PreparedStatement
            }

            // Check for @Foreign annotation
            if (field.isAnnotationPresent(Foreign.class)) {
                Foreign foreign = field.getAnnotation(Foreign.class);
                Object foreignObject = field.get(object);
                if (foreignObject != null) {
                    // Assuming foreign object has a method to get the ID
                    Method getIdMethod = foreignObject.getClass().getMethod("getId");
                    Object foreignId = getIdMethod.invoke(foreignObject);
                    sql.append(foreign.name()).append(", ");
                    values.append(foreignId).append(", "); // Directly add foreign ID to values
                }
            }
        }

        // Remove trailing comma and space
        sql.setLength(sql.length() - 2);
        values.setLength(values.length() - 2);

        sql.append(")").append(values).append(")");

        try (PreparedStatement preparedStatement = connection.prepareStatement(sql.toString())) {
            int index = 1;
            for (Field field : fields) {
                field.setAccessible(true);

                if (field.isAnnotationPresent(Column.class)) {
                    preparedStatement.setObject(index++, field.get(object));
                }
            }
            preparedStatement.executeUpdate();
        }
    }
    /// END 

    /// UPDATING

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
            connection.commit();
        } catch (Exception e) {
        }
    }
    /// END

    /// DELETING
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
    /// END

    /// SEQUENCE
    /**
     * get the next value of a sequence
     * 
     * @return the value in String of the sequence next value
     * @throws Exception
     */
    public String nextVal(String sequenceName) throws Exception {
        String valiny = new String();
        Statement stmt = connection.createStatement();
        HashMap<String, String> map = getDbSequenceMethod(sequenceName);
        ResultSet res = stmt.executeQuery("select " + map.get(Connect.getDbType()));
        if (res.next())
            valiny = res.getString("nextval");
        return valiny;
    }
    /// END

    public void closeConnection() throws Exception {
        if (connection != null)
            connection.close();
    }

    public void setAutoCommit(boolean t) throws Exception{
        connection.setAutoCommit(t);
    }

}
