package test;

import connection.Connect;
import mpanampy.MiDao;
import test.Fonenana;

public class Test {
    public static void main(String[] args) {
        try {
            Fonenana fonenana = new Fonenana();
            fonenana.setIdFonenana("FO2");
            fonenana.setName("Fatrakala");
            MiDao myDao = new MiDao(null);
            System.out.println(myDao.findAllWithCriteria(fonenana, Fonenana.class));
            myDao.closeConnection();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
