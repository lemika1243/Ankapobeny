package test;
import annotation.*;
public class Categorie {
    @Primary
    @Column(name = "idcategorie")
    String id;

    @Column(name = "categorie")
    String categorie;



    public String getId() {
        return id;
    }



    public void setId(String id) {
        this.id = id;
    }



    public String getCategorie() {
        return categorie;
    }



    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }



    public String toString(){
        return getId()+""+getCategorie();
    }
}
