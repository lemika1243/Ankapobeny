package connection;

import java.io.*;
import java.sql.*;
import java.util.*;
import mpanampy.*;

public class Connect {

    static String properties = "";
    static ArrayList<String> prop = new ArrayList<>();
    static String absolutePath = Connect.class.getProtectionDomain().getCodeSource().getLocation().getPath();

    // GET THE CONNECTION
    public static Connection connection(String proper) throws Exception {
        if (proper == null) {
            properties = absolutePath + "settings/connection.prop";
        } else
            properties = proper;
        prop = Auto.getAllIn(properties);
        String dtb = getDbType(), dtbName = getDbName(), user = getUser(), pass = getPassword();
        String url = getUrl(dtb, dtbName);
        Connection con = DriverManager.getConnection(url, user, pass);
        return con;
    }
    // END

    // SET THE URL DEPENDING ON THE DATABASE
    static String getUrl(String dtb, String dtbName) throws Exception {
        if (dtb.toLowerCase().equals("postgres")) {
            return "jdbc:postgresql://localhost:5432/" + dtbName;
        } else if (dtb.toLowerCase().equals("oracle")) {
            return "jdbc:oracle:thin:@localhost:1521/orcl";
        } else if (dtb.toLowerCase().equals("mysql")) {
            return "jdbc:mysql://localhost:3306/" + dtbName;
        } else {
            throw new Exception(dtb + " is not yet a database type that exist in this framework");
        }
    }
    // END

    public static String getDbType() throws Exception {
        String valiny = new String();
        try {
            String[] dbtype = Auto.getIn(prop, "dbtype").get(0).split(":");
            valiny = dbtype[1];
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return valiny;
    }

    static String getDbName() throws Exception {
        String valiny = new String();
        try {
            String[] dbtype = Auto.getIn(prop, "database").get(0).split(":");
            valiny = dbtype[1];
        } catch (Exception e) {
            throw new Exception("There must be a database name");
        }
        return valiny;
    }

    static String getUser() throws Exception {
        String valiny = new String();
        try {
            String[] dbtype = Auto.getIn(prop, "user").get(0).split(":");
            valiny = dbtype[1];
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return valiny;
    }

    static String getPassword() throws Exception {
        String valiny = new String();
        try {
            String[] dbtype = Auto.getIn(prop, "password").get(0).split(":");
            valiny = dbtype[1];
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return valiny;
    }
}
