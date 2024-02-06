package connection;

import java.io.*;
import java.sql.*;
import java.util.*;
import mpanampy.*;

public class Connect {

    public static String properties = "D:\\Fianarana\\Tetikasa Java\\Menu\\controller\\settings/connection.prop";
    public static ArrayList<String> prop = Auto.getAllIn(properties);

    // GET THE CONNECTION
    public static Connection connection() throws Exception {
        try {
            String dtb = getDbType(), dtbName = getDbName(), user = getUser(), pass = getPassword();
            String url = getUrl(dtb, dtbName);
            return DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            throw new Exception("File of connection settings not found : '" + properties + "'");
        }
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
            throw new Exception(dtb + " does not exist");
        }
    }
    // END

    public static String getDbType() {
        String valiny = new String();
        String[] dbtype = Auto.getIn(prop, "dbtype").split(":");
        valiny = dbtype[1];
        return valiny;
    }

    static String getDbName() {
        String valiny = new String();
        String[] dbtype = Auto.getIn(prop, "database").split(":");
        valiny = dbtype[1];
        return valiny;
    }

    static String getUser() {
        String valiny = new String();
        String[] dbtype = Auto.getIn(prop, "user").split(":");
        valiny = dbtype[1];
        return valiny;
    }

    static String getPassword() {
        String valiny = new String();
        String[] dbtype = Auto.getIn(prop, "password").split(":");
        valiny = dbtype[1];
        return valiny;
    }
}
