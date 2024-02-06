package mpanampy;
import java.io.*;
import java.lang.reflect.*;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;
import javax.swing.*;

import annotation.Column;
public class Auto {
    Object object;
    String[] objectForm;
    public Auto(){}
    public Auto(Object v)throws Exception{
        object=v; objectForm = new String[toFunction(object).length];
        for(int i = 0; i < objectForm.length; i++){objectForm[i]="";}
    }

    //SET AND GET FUNCTIONS
    public Object getObject(){return object;}
    public void setObject(Object v){object=v;}
    public String getObjectForm(int ind){return objectForm[ind%objectForm.length];}
    public String[] getObjectForm(){return objectForm;}
    public void setObjectForm(int ind, String a){objectForm[ind%objectForm.length]=a;}
    //END


    /**
     * TRANSFORM A DATE INTO A SIMPLE DATE FORMAT
     * @param d date you want to transform into a String
     * @return String from the date d
     * */
    public static String transformDate(Date d){
        String valiny=new String();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        valiny = dateFormat.format(d);
        return valiny;
    }
    public static String transformDate(Date d,boolean detailed){
        String valiny=new String();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if(detailed){dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");}
        valiny = dateFormat.format(d);
        return valiny;
    }
    //END

    //TRANSFORM A STRING INTO A DATE
    public static Date transformDateString(String a)throws Exception{
        SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
        return s.parse(a);
    }
    public static Date transformDateString(String a,boolean detailed)throws Exception{
        SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
        if(!detailed)s=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return s.parse(a);
    }
    //END

    //SAVE INFORMATIONS IN A FILE
    public void saveData(String fileName, String... files){
        try {
            BufferedWriter w = new BufferedWriter(new FileWriter(fileName));
            for (int i = 0; i < files.length; i++) {
                w.write(files[i]+"\n");
            }w.close();
        } catch (Exception e) {}
    }
    //END

    //GENERATE THE BEGINING OF THE DOCTYPE
    public static String beginDoctype(String title, String... style){
        String valiny="";
        valiny="<!DOCTYPE html><html><head><meta charset='utf-8'><meta name='viewport' content='width=device-width, initial-scale=1'><title>"+title+"</title>";
        for(String val:style){
            valiny+="<link rel='stylesheet' href='"+val+"'>\n";
        }
        valiny+="</head><body>";
        return valiny;
    }
    //END

    //GENERATE THE END OF THE DOCTYPE
    public static String endDoctype(){
        String valiny="</body></html>";
        return valiny;
    }
    //END

    //HIDE A SPECIFIC INPUT IN A FORM BY A GIVEN FIELD
    public void hideHtmlInput(String field, String value)throws Exception{
        setHtmlForm();
        Field[] f = object.getClass().getDeclaredFields();
        String ad = toRenisoratra(field, 0);
        String valiny = "<input type='hidden' name='"+ad+"' value='"+value+"'>";
        for (int i = 0; i < f.length; i++) {
            if(f[i].getName().equals(field)){setObjectForm(i, valiny);}
        }
    }
    //END

    //SET THE TYPE OF A GIVEN FIELD IN THE HTML FORM
    public void setType(String field, String type)throws Exception{
        setHtmlForm();
        Field[] f = object.getClass().getDeclaredFields();
        String ad = toRenisoratra(field, 0);
        String valiny = "<p>"+ad+":</p><input type='"+type+"' name='"+ad+"'>";
        for (int i = 0; i < f.length; i++) {
            if(f[i].getName().equals(field)){setObjectForm(i, valiny);}
        }
    }
    //END

    //RETURN A STRING OF A LINK IN HTML CODE
    public static String makeLink(String path, String inside){
        String query="<a href='"+path+"'>"+inside+"</a>";
        return query;
    }
    //END

    //SET DEFAULT VALUE OF AN INPUT
    public void setDefaultValueInput(String f, Object value)throws Exception{
        setHtmlForm();
        String[] func = toFunction(object);
        for (int i = 0; i < func.length; i++) {
            if(f.equals(func[i])){
                String o = objectForm[i].substring(0, objectForm[i].length()-2);
                String rep = value.toString();
                if(value instanceof Date){rep=transformDate((Date) value);}
                o+=" value='"+rep+"'>";
                setObjectForm(i, o);
                break;
            }
        }
    }
    //END

    //CHANGE TO A LIST AN INPUT IN THE FORM USING A NAME OF THE FIELD
    public void listThisInput(String f, String... values)throws Exception{
        setHtmlForm();
        String[] func = toFunction(object);
        for (int i = 0; i < func.length; i++) {
            if(toRenisoratra(f, 0).equals(func[i])){
                objectForm[i] = "<p>"+func[i]+" :</p><select name='"+func[i]+"'>\n";
                for (int x = 0; x < values.length; x++) {
                    objectForm[i]+="<option value='"+values[x]+"'>"+values[x]+"</option>\n";
                }
                objectForm[i] += "</select>";
            }
        }
    }
    //END

    //GET IN STRING THE TYPE OF AN INPUT FROM A GIVEN FIELD
    String getType(Field c){
        if(c.getType().getSimpleName()=="double"||c.getType().getSimpleName()=="Double"||c.getType().getSimpleName()=="int"||
        c.getType().getSimpleName()=="Integer"||c.getType().getSimpleName().equals("float")){return "number";}
        else if(c.getType().getSimpleName().equals("Date")){return "date";}
        else if(c.getType().getSimpleName().equals("String")||c.getType().getSimpleName().equals("char")){return "text";}
        return null;
    }
    //END


    //GET IN STRING THE TYPE OF ALL INPUT TO A GIVEN OBJECT
    String[] getTypeForm(Object o){
        Field[] f = o.getClass().getDeclaredFields();
        Vector temp = new Vector();
        for (int i = 0; i < f.length; i++) {
            String name = getType(f[i]);
            if(name!=null){temp.add(name);}
        }
        String[] valiny = new String[temp.size()];
        for (int x = 0; x < temp.size(); x++) {
            valiny[x]=(String)temp.elementAt(x);
        }
        return valiny;
    }
    //END

    //SET ALL THE OBJECTFORM FIELD OF THIS CLASS TO AN HTML CODE
    void setHtmlForm()throws Exception{
        String[] func = toFunction(object);
        String[] type = getTypeForm(object);
        for (int i = 0; i < type.length; i++){
            if(getObjectForm(i)==""){
                setObjectForm(i, "<p>"+func[i]+" : </p>"+"<input type='"+type[i]+
                "' placeholder='your "+func[i]+"' name='"+func[i]+"'>\n");
            }
        }
    }
    //END

    //GET IN STRING THE ALL FORM TO A GIVEN OBJECT
    String[] getForm(Object o)throws Exception{
        String[] func = toFunction(o);
        String[] type = getTypeForm(o);
        String[] valiny = new String[func.length];
        for (int i = 0; i < func.length; i++) {
            valiny[i]+="<p>"+func[i]+" : </p>"+"<input type='"+type[i]+"' name='"+func[i]+"'>\n";
        }
        return valiny;
    }
    //END

    //AUTOMATICALLY GENERATE AN HTML FORM OF THE OBJECT OF THIS CLASS
    public String htmlForm()throws Exception{
        setHtmlForm();
        String valiny = "";
        String[] type = getTypeForm(object);
        for (int i = 0; i < type.length; i++) {
            valiny+=objectForm[i];
        }
        valiny+="<input type='hidden' name='class' value='"+object.getClass().getName()+"'>";
        valiny+="<br><br><input type='submit' value='Send'>\n";
        return valiny;
    }
    //END

    //MAKE UPPERCASE IN AN EXACT INDEX OF A STRING
    public static String toRenisoratra(String a, int ind){
        String upper = a.substring(ind, ind+1).toUpperCase();
        String q = "";
        for (int i = 0; i < a.length(); i++) {
            if(i==ind){q = q.concat(upper); i++;}
            try{q = q.concat(a.substring(i, i+1));}
            catch(Exception e){}
        }
        return q;
    }
    //END

    //INVOKING A FUNCTION AUTOMATICALLY
    public void autoFunction(Object o, String name, Object... args)throws Exception{
        Class[] argType = new Class[args.length];
        for (int i = 0; i < argType.length; i++) {argType[i]=args[i].getClass();}
        Method m = o.getClass().getDeclaredMethod(name, argType);
        m.invoke(o, args);
    }
    //END

    //CONTROLLING THE VALUE AND MAKE EXCEPTIONS
    public void controlling(Object o, String n)throws Exception{
        if(n==""){throw new Exception("Aza adino ny manisy valeur azafady");}
        else if(Integer.parseInt(n)<0){throw new Exception("Tsy mahazo atao ny mametraka vola ambanin'ny 0");}
        try {
            BufferedWriter w = new BufferedWriter(new FileWriter("/home/itu/apache-tomcat-10.1.7/webapps/HTML/"+o.getClass().getSimpleName(), true));
            w.write(n+"\n");
            w.close();
        } catch (IOException e){}
    }
    //END

    //GET THE CLASS OF AN OBJECTS
    public Class[] getClassObjects(Object[] args)throws Exception{
        Class[] valiny = new Class[args.length];
        for (int i = 0; i < args.length; i++) {
            valiny[i] = args.getClass();
        }return valiny;
    }
    //END

    //CALL A CONSTRUCTOR AUTOMATICCALY
    public Object callConstructor(Class c, Object... args)throws Exception{
        Class[] classes = getClassObjects(args);
        Constructor cs = c.getDeclaredConstructor(classes);
        return cs.newInstance(args);
    }
    //END

    //CONTROL TO THROW ERRORS
    public void control(Class c, String sa, String sa1, String daty)throws Exception{
        Constructor[] cs = c.getDeclaredConstructors();
        Object o = c.newInstance();
        if(sa==""){sa="0";}
        if(sa1==""){sa1="0";}
        double d = Double.parseDouble(sa);
        int d1 = Integer.parseInt(sa1);
        Object j = cs[1].newInstance(d,d1);
        try {
            BufferedWriter w = new BufferedWriter(new FileWriter("/home/itu/apache-tomcat-10.1.7/webapps/HTML/"+o.getClass().getSimpleName(), true));
            w.write(sa+"\n"+sa1+"\n"+daty);
            w.close();
        } catch (IOException e){}
    }
    //END

    // //CONTROL THE MONTANT
    // public void setMontantRetrait(Olona o, double m)throws Exception{
    //     if(m>(90*o.getVola())/100){throw new Exception("Tsy mahazo maka mihoatra ny "+String.valueOf((90*o.getVola())/100)+" ianao");}
    //     o.setVola((o.getVola())-m);
    // }
    // //END
    private static String makeFunction(String[]... fields){
        String query="";
        for(int i=0;i<fields[1].length;i++){
            query+="\n    public "+fields[0][i]+" get"+toRenisoratra(fields[1][i],0)+"(){return "+
            fields[1][i]+";"+"}\n";
            query+="    public void set"+toRenisoratra(fields[1][i],0)+"("+fields[0][i]+" temp)throws Exception{\n        "+fields[1][i]+"=temp"+
            ";"+"\n    }\n";
        }
        return query;
    }

    public static void createClass(String name, String pack, String[]... fields){
        String query="";
        name=toRenisoratra(name.toLowerCase(),0);
        if(!pack.equals(""))
            query="package "+pack+";\n"+"import java.util.*;\nimport java.sql.*;\n";
        try{
            BufferedWriter writer=new BufferedWriter(new FileWriter(name+".java"));
            query+="public class "+name+"{\n";
            for(int i=0;i<fields[1].length;i++){
                query+="    "+fields[0][i]+" "+fields[1][i]+";\n";
            }
            query+=makeFunction(fields);
            query+="}";
            writer.write(query);
            writer.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }

    public static String[] toFunction(Object o)throws Exception{
        Field[] f = o.getClass().getDeclaredFields();
        String[] valiny = new String[f.length];
        for (int i = 0; i < f.length; i++) {
            if (f[i].getType().getSimpleName().equals("double")||f[i].getType().getSimpleName().equals("int")||f[i].getType().getSimpleName().equals("String")||
            f[i].getType().getSimpleName().equals("float")||f[i].getType().getSimpleName().equals("Date")) {
                String name = f[i].getName();
                name = toRenisoratra(name, 0);
                valiny[i] = name;
            }
        }
        return valiny;
    }

    public String[] toFunctionGet(Object o)throws Exception{
        String[] s = toFunction(o);
        String[] get = new String[s.length];
        for (int i = 0; i < s.length; i++) {
            get[i]="get";
            get[i]+=s[i];
        }
        return get;
    }

    public String[] toFunctionSet(Object o)throws Exception{
        String[] s = toFunction(o);
        String[] set = new String[s.length];
        for (int i = 0; i < s.length; i++) {
            set[i]="set";
            set[i]+=s[i];
        }
        return set;
    }

    //GET IN STRING AN HTML TABLE FROM THE VALUES OF AN OBJECT
    public String tabHtml(Object o)throws Exception{
        String[] func = toFunction(o);
        String[] get = toFunctionGet(o);
        String valiny = "<table border=1>\n";
        for (int i = 0; i < func.length; i++) {
            valiny+="<th>"+func[i]+"</th>";
        }
        for (int i = 0; i < get.length; i++) {
            Method m = o.getClass().getMethod(get[i]);
            valiny+="<td>"+m.invoke(o)+"</td>";
        }
        valiny+="</table>";
        return valiny;
    }
    //END

    // public String htmlAutoForm(Object o)throws Exception{
    //     String[] type = getTypeForm(o);
    //     String[] form = getForm(o);
    //     String valiny = "<form action='traitement.jsp' method='get'>\n";
    //     for (int i = 0; i < form.length; i++) {
    //         valiny+=form[i];
    //     }
    //     valiny+="<input type='hidden' name='class' value='"+o.getClass().getName()+"'>";
    //     valiny+="<input type='submit' value='Alefa'>\n</form>\n";
    //     return valiny;
    // }

    // //GENERATES A PANEL FORM FROM an OBJECT
    // public JPanel panelAuto(Object o)throws Exception{
    //     try {
    //         BufferedWriter w = new BufferedWriter(new FileWriter(o.getClass().getSimpleName()));
    //     } catch (IOException e) {}
    //     JPanel p = new JPanel();
    //     p.setVisible(true); p.setSize(1200, 800);
    //     p.setLayout(new GridLayout());
    //     JLabel[] lla = new JLabel[o.getClass().getDeclaredFields().length];
    //     JTextField[] lt = new JTextField[o.getClass().getDeclaredFields().length];
    //     String[] s = toFunction(o);
    //     String[] get = toFunctionGet(o);
    //     for (int i = 0; i < lt.length; i++) {
    //         lla[i] = new JLabel(s[i]);
    //         lt[i] = new JTextField();
    //         Method m = o.getClass().getMethod(get[i]);
    //         lt[i].setText(String.valueOf(m.invoke(o)));
    //         p.add(lla[i]); p.add(lt[i]);
    //     }
    //     JButton ok=new JButton("OK");
    //     ok.addActionListener(new MpihenoBokotra(o.getClass().getSimpleName(), p));
    //     p.add(ok);
    //     return p;
    // }

    // public JPanel[] panelAuto(Object[] lo)throws Exception{
    //     JPanel[] p = new JPanel[lo.length];
    //     double som = sum(lo, "Vola");
    //     JLabel sum = new JLabel(String.valueOf(som));
    //     for (int i = 0; i < p.length; i++) {
    //         p[i]=panelAuto(lo[i]);
    //     }
    //     p[p.length-1].add(sum);
    //     return p;
    // }
    // //END

    //SUM VALUES FROM OBJECTS
    public static double sum(Object[] lo, String met)throws Exception{
        double valiny = 0;
        Method m = lo[0].getClass().getMethod("get"+toRenisoratra(met, 0));
        for (int i = 0; i < lo.length; i++) {
            valiny+=(double) m.invoke(lo[i]);
        }return valiny;
    }
    //END

    //SUM VALUES FROM OBJECTS
    public static double sum(Vector lo, String met)throws Exception{
        double valiny = 0;
        Method m = lo.elementAt(0).getClass().getMethod("get"+toRenisoratra(met, 0));
        for (int i = 0; i < lo.size(); i++) {
            valiny+=(double) m.invoke(lo.elementAt(i));
        }return valiny;
    }
    public static double sum(List lo, String met)throws Exception{
        double valiny = 0;
        Method m = lo.get(0).getClass().getMethod(met);
        for (int i = 0; i < lo.size(); i++) {
            valiny+=(double) m.invoke(lo.get(i));
        }return valiny;
    }
    //END


    public static double[] sum(Object[] lo, String[] met)throws Exception{
        double[] valiny = new double[met.length];
        for (int i = 0; i < met.length; i++) {
            valiny[i] = sum(lo, met[i]);
        }
        return valiny;
    }

    public static JPanel makeTable(String lohateny, String[] col, Object[]... rows){
        JLabel title=new JLabel(lohateny.toUpperCase());
        JPanel valiny=new JPanel();
        JTable table = new JTable(rows, col);
        JScrollPane scroll=new JScrollPane(table);
        valiny.setLayout(new BoxLayout(valiny, BoxLayout.Y_AXIS));
        valiny.setSize(1000, 600); valiny.add(title); valiny.add(scroll);
        return valiny;
    }
    
    public static void emptyErrors(String... col)throws Exception{
        for(String val:col){
            if(val.equals("")||val==null)
                throw new Exception("Complete all the form before continuing");
        }
    }
    public static void emptyErrors(Vector<String> col)throws Exception{
        for(String val:col){
            if(val.equals("")||val==null)
                throw new Exception("Complete all the form before continuing");
        }
    }

    //GET THE DATE FOR NOW IN STRING
    public static String getNow(){
        return new Date().toString();
    }
    //END

    //GET THE ERROR DATE
    public static void getDateError(String date, boolean mineur) throws Exception{
        Date now =new Date();
        Date daty=transformDateString(date);
        if(mineur&&now.getYear()-daty.getYear()<18){throw new Exception("Impossible si mineur");}
    }
    public static void getDateError(String date1, String date2) throws Exception{
        Date before = transformDateString(date1);
        Date after=transformDateString(date2);
        if(before.after(after)){throw new Exception("le premier date doit etre avant la deuxieme");}
    }
    public static void getDateError(Date date1, Date date2) throws Exception{
        if(date1.after(date2)){throw new Exception("le premier date doit etre avant la deuxieme");}
    }
    //END

    public static ArrayList<String> getAllIn(String file){
        ArrayList<String> valiny=new ArrayList<String>();
        String a=new String();
        try {
            BufferedReader reader=new BufferedReader(new FileReader(file));
            while ((a=reader.readLine())!=null) {
                valiny.add(a);
            }
            reader.close();
        } catch (Exception e) {
        }
        return valiny;
    }

    public static String isIn(String container,String value)throws Exception{
        int count=container.length();
        String valiny=new String("");
        String element;
        for (int i = 0; i < count; i++) {
            try {
                element=container.substring(i, i+value.length());
                if(element.equals(value)) {return container;}
            } catch (Exception e) {
                break;
            }
        }
        return valiny;
    }

    public static String getIn(ArrayList<String> container,String value){
        String in=new String("");
        for (String string : container) {
            try {
                in=isIn(string, value);
                if(!in.equals("")) return in;
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        return in;
    }

    public static <T> List<Field> getFieldsAnnoted(Class<T> classname,Class value)throws Exception{
        List<Field> valiny=new ArrayList<>();
        Field[] fields=classname.getDeclaredFields();
        for (Field field : fields) {
            if(field.isAnnotationPresent(value)) {valiny.add(field);}
        }
        return valiny;
    }
}
