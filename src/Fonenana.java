package test;
import annotation.*;

public class Fonenana {
    @Primary
    @Column(name = "idfonenana")
    String idFonenana;

    @Column(name = "fonenana")
    String name;

    @Column(name = "sary")
    String sary;





    public String getIdFonenana() {
        return idFonenana;
    }

    public void setIdFonenana(String idFonenana) {
        this.idFonenana = idFonenana;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSary() {
        return sary;
    }

    public void setSary(String sary) {
        this.sary = sary;
    }



    public String toString(){
        return "'"+idFonenana+"'; '"+name+"'; '"+sary+"'";
    }

}
