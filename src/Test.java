package test;

import connection.Connect;
import mpanampy.MiDao;
import test.Fonenana;

public class Test {
    public static void main(String[] args) {
        try {
            MiDao myDao = new MiDao(null);
            for (int i = 0; i < 100; i++) {
                System.out.println(myDao.getAll(Categorie.class));
            }
            myDao.closeConnection();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
