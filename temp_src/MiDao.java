package mpanampy;

import annotation.Column;
import annotation.Foreign;
import annotation.Primary;
import annotation.Relation;
import connection.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;



public class MiDao {

    Connection connection;

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

    public MiDao(Connection connection) throws Exception {
        this.connection = connection;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
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
            try {
                set.invoke(temporar, getById(Integer.parseInt(id), field.getType()));
            } catch (Exception e) {
                set.invoke(temporar, getById(id, field.getType()));
            }
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
        } else if (value.getName().equals(java.sql.Date.class.getName())) {
            return res.getDate(col);
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
        String tableName = temp.getSimpleName();
        if(temp.isAnnotationPresent(Relation.class)){
            tableName = temp.getAnnotation(Relation.class).name();
        }
        List<T> valiny = new ArrayList<T>();
        if (objects == null) {
            Statement stmt = connection.createStatement();
            String query = "select * from " + tableName;
            ResultSet res = stmt.executeQuery(query);
            T temporar = temp.newInstance();
            while (res.next()) {
                temporar = setFieldColumn(res, temp);
                setForeignFieldColumn(res, temporar);
                valiny.add(temporar);
            }
            stmt.close();
            res.close();
        } else {
            valiny = objects.subList(begin, begin + max);
        }
        return valiny;
    }

    public <T, K> T getById(K id, Class<T> temp) throws Exception {
        String tableName = temp.getSimpleName();
        if(temp.isAnnotationPresent(Relation.class)){
            tableName = temp.getAnnotation(Relation.class).name();
        }
        // Get the primary key field annotated with @Primary
        Field primary = MiAuto.getFieldsAnnoted(temp, Primary.class).get(0);
    
        // Construct the SQL query using placeholders
        String query = "SELECT * FROM " + tableName + 
                       " WHERE " + primary.getAnnotation(Column.class).name() + " = ?";
    
        // Prepare the statement and set the parameter
        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setObject(1, id);
    
        // Execute the query and fetch the result
        ResultSet res = pstmt.executeQuery();
        if (res.next()) {
            return setFieldColumn(res, temp);
        }
        pstmt.close();
        res.close();
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
    public <T> List<T> find(Class<T> temp, List<Condition> conditions) throws Exception {
        String tableName = temp.getSimpleName();
        if(temp.isAnnotationPresent(Relation.class)){
            tableName = temp.getAnnotation(Relation.class).name();
        }
        if (conditions == null || conditions.isEmpty()) {
            throw new Exception("Must have at least one condition");
        }
    
        List<T> valiny = new ArrayList<>();
    
        // Build the condition string with placeholders
        String conditionString = Condition.buildConditionString(conditions);
        String query = "SELECT * FROM " + tableName + " WHERE " + conditionString;
    
        PreparedStatement pstmt = connection.prepareStatement(query);
    
        // Set the parameters in the PreparedStatement
        for (int i = 0; i < conditions.size(); i++) {
            pstmt.setObject(i + 1, conditions.get(i).getValue());
        }
    
        ResultSet res = pstmt.executeQuery();
        List<Field> fields = MiAuto.getFieldsAnnoted(temp, Column.class);
        T temporar = temp.newInstance();
    
        while (res.next()) {
            temporar = setFieldColumn(res, temp);
            valiny.add(temporar);
        }
        pstmt.close();
        res.close();
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
        String tableName = clazz.getSimpleName();
        if(clazz.isAnnotationPresent(Relation.class)){
            tableName = clazz.getAnnotation(Relation.class).name();
        }
        String query = "select * from " + tableName + conditions;
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
    public <T> void insert(T object, boolean isIdGenerated) throws Exception {
        Class<?> clazz = object.getClass();
        String tableName = clazz.getSimpleName();
        if(clazz.isAnnotationPresent(Relation.class)){
            tableName = clazz.getAnnotation(Relation.class).name();
        }
        StringBuilder sql = new StringBuilder("INSERT INTO " + tableName + " (");
        StringBuilder values = new StringBuilder(" VALUES (");

        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            field.setAccessible(true);

            // Check for @Column annotation
            if (field.isAnnotationPresent(Column.class)) {
                if(isIdGenerated && !field.isAnnotationPresent(Primary.class)){
                    Column column = field.getAnnotation(Column.class);
                    sql.append(column.name()).append(", ");
                    values.append("?, ");
                }
                else if(!isIdGenerated){
                    Column column = field.getAnnotation(Column.class);
                    sql.append(column.name()).append(", ");
                    values.append("?, ");
                }
            }

            // Check for @Foreign annotation
            if (field.isAnnotationPresent(Foreign.class)) {
                Foreign foreign = field.getAnnotation(Foreign.class);
                sql.append(foreign.name()).append(", ");
                values.append("?, ");
            }
        }

        // Remove trailing comma and space
        sql.setLength(sql.length() - 2);
        values.setLength(values.length() - 2);

        sql.append(")").append(values).append(")");
        // throw new Exception(sql.toString());
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql.toString())) {
            int index = 1;
            for (Field field : fields) {
                field.setAccessible(true);

                if (field.isAnnotationPresent(Column.class)) {
                    preparedStatement.setObject(index++, field.get(object));
                }
                if (field.isAnnotationPresent(Foreign.class)) {
                    Object foreignObject = field.get(object);
                    if (foreignObject != null) {
                        List<Field> primaryFields = MiAuto.getFieldsAnnoted(foreignObject.getClass(), Primary.class);
                        if (primaryFields.isEmpty()) {
                            throw new Exception("No primary key found in class: " + foreignObject.getClass().getSimpleName());
                        }
                        Field primary = primaryFields.get(0);
                        Method getIdMethod = foreignObject.getClass()
                                .getMethod("get" + MiAuto.toRenisoratra(primary.getName(), 0));
                        Object foreignId = getIdMethod.invoke(foreignObject);
                        preparedStatement.setObject(index++, foreignId);
                    } else {
                        preparedStatement.setNull(index++, Types.INTEGER); // or another appropriate type
                    }
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
    }

    public <T> void update(T temporar, List<Condition> conditions) throws Exception {
        if (conditions == null || conditions.isEmpty()) {
            throw new Exception("Must have at least one condition");
        }
    
        Class<?> temp = temporar.getClass();
        Field[] fields = temp.getDeclaredFields();
    
        // Build the SQL query dynamically
        StringBuilder query = new StringBuilder("UPDATE " + temp.getSimpleName().toLowerCase() + " SET ");
        List<Object> values = new ArrayList<>();
    
        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            field.setAccessible(true); // Allow access to private fields
    
            Object value = field.get(temporar);
            if (value != null) { // Only update non-null fields
                if (i > 0) {
                    query.append(", ");
                }
                query.append(field.getAnnotation(Column.class).name()).append(" = ?");
                values.add(value);
            }
        }
    
        // Append the WHERE clause
        String conditionString = Condition.buildConditionString(conditions);
        query.append(" WHERE ").append(conditionString);
    
        // Prepare the statement
        PreparedStatement pstmt = connection.prepareStatement(query.toString());
    
        // Set the values for the SET clause
        int paramIndex = 1;
        for (Object value : values) {
            pstmt.setObject(paramIndex++, value);
        }
    
        // Set the values for the WHERE clause
        for (Condition condition : conditions) {
            pstmt.setObject(paramIndex++, condition.getValue());
        }
    
        // Execute the update
        pstmt.executeUpdate();
        pstmt.close();
    }
    

    public <T> void update(T temporar) throws Exception {
        Class<?> clazz = temporar.getClass();
        String tableName = clazz.getSimpleName();
        if(clazz.isAnnotationPresent(Relation.class)){
            tableName = clazz.getAnnotation(Relation.class).name();
        }        
        // Retrieve primary key field (assuming at least one exists)
        List<Field> primaries = MiAuto.getFieldsAnnoted(clazz, Primary.class);
        if (primaries.isEmpty()) {
            throw new Exception("No primary key defined for class " + clazz.getSimpleName());
        }
        Field primaryField = primaries.get(0);
        primaryField.setAccessible(true);
        Object primaryValue = primaryField.get(temporar);
        // If the primary value is a custom object, try to get its id
        if (!(primaryValue instanceof String) && !(primaryValue instanceof Number) && !(primaryValue instanceof Date)) {
            try {
                Method getId = primaryValue.getClass().getMethod("getId");
                primaryValue = getId.invoke(primaryValue);
            } catch (Exception e) {
                // leave primaryValue as is if getId not available
            }
        }
        
        // Start building the SQL update query
        StringBuilder query = new StringBuilder();
        query.append("UPDATE ").append(tableName).append(" SET ");
        
        // List to store the parameters for the PreparedStatement
        List<Object> parameters = new ArrayList<>();
        Field[] fields = clazz.getDeclaredFields();
        boolean first = true;
        
        for (Field field : fields) {
            field.setAccessible(true);
            // Skip the primary key field
            if (field.equals(primaryField)) {
                continue;
            }
            Object value = field.get(temporar);
            // If value is null or is a Collection, skip this field
            if (value == null || (value instanceof java.util.Collection)) {
                continue;
            }
            
            // If value is a custom object (not common types), try to get its id
            if (!(value instanceof String) && !(value instanceof Number) && !(value instanceof Date)) {
                try {
                    Method getId = value.getClass().getMethod("getId");
                    value = getId.invoke(value);
                } catch (Exception e) {
                    // Fallback: keep original value
                }
            }
            
            // Determine the column name (use annotation if available)
            String columnName = field.getName();
            if (field.isAnnotationPresent(Column.class)) {
                Column col = field.getAnnotation(Column.class);
                columnName = col.name();
            }
            else if (field.isAnnotationPresent(Foreign.class)) {
                Foreign col = field.getAnnotation(Foreign.class);
                columnName = col.name();
            }
            
            // Append comma if not the first field added
            if (!first) {
                query.append(", ");
            }
            first = false;
            query.append(columnName).append(" = ?");
            parameters.add(value);
        }
        
        if (parameters.isEmpty()) {
            throw new Exception("No fields to update for " + clazz.getSimpleName());
        }
        
        // Determine primary column name
        String primaryColumn = primaryField.getName();
        if (primaryField.isAnnotationPresent(Column.class)) {
            primaryColumn = primaryField.getAnnotation(Column.class).name();
        }
        query.append(" WHERE ").append(primaryColumn).append(" = ?");
        parameters.add(primaryValue);
        
        // Create the PreparedStatement and set all parameter values
        PreparedStatement ps = connection.prepareStatement(query.toString());
        for (int i = 0; i < parameters.size(); i++) {
            ps.setObject(i + 1, parameters.get(i));
        }
        
        ps.executeUpdate();
        ps.close();
    }
    

    public void executeUpdate(String query) throws Exception {
        Statement stm = connection.createStatement();
        stm.executeUpdate(query);
        stm.close();
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
    public String nextVal(String sequenceName, String dbType) throws Exception {
        String valiny = new String();
        Statement stmt = connection.createStatement();
        HashMap<String, String> map = getDbSequenceMethod(sequenceName);
        ResultSet res = stmt.executeQuery("select " + map.get(dbType));
        if (res.next())
            valiny = res.getString("nextval");
        return valiny;
    }
    /// END

    public void closeConnection() throws Exception {
        if (connection != null)
            connection.close();
    }

    public void setAutoCommit(boolean t) throws Exception {
        connection.setAutoCommit(t);
    }

    public void commit() throws Exception {
        connection.commit();
    }

    public void rollback() throws Exception {
        connection.rollback();
    }

}
