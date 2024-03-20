package test;

import connection.Connect;
import mpanampy.MiDao;
import test.Fonenana;

public class Test {
    public static void main(String[] args) {
        try {
            MiDao myDao = new MiDao(null);
            System.out.println(myDao.getAll(Fonenana.class));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
