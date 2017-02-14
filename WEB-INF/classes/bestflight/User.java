package bestflight;

public class User implements java.io.Serializable{
    private String ID;
    private String passwd;
    private String type;

    public User(String i, String p, String t){
        this.ID=i;
        this.passwd=p;
        this.type=t;
    }

    public User() {
    }
    public String getID(){
        return ID;
    }
    public void setID(String i){
        ID=i;
    }
    public  String getPasswd(){
        return passwd;
    }
    public void setPasswd(String p){
        passwd=p;
    }
    public String getType(){
        return type;
    }
    public void setType(String t){
        type=t;
    }

}
