package example.Bean;
// Generated 2017-4-9 20:37:54 by Hibernate Tools 4.3.1



/**
 * Userinfo generated by hbm2java
 */
public class Userinfo  implements java.io.Serializable {


     private int userId;
     private String username;
     private String userpw;
     private String userphone;
     private String useradd;
     private int adId;

    public Userinfo() {
    }

    public Userinfo(int userId, String username, String userpw, String userphone, String useradd, int adId) {
       this.userId = userId;
       this.username = username;
       this.userpw = userpw;
       this.userphone = userphone;
       this.useradd = useradd;
       this.adId = adId;
    }
   
    public int getUserId() {
        return this.userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getUserpw() {
        return this.userpw;
    }
    
    public void setUserpw(String userpw) {
        this.userpw = userpw;
    }
    public String getUserphone() {
        return this.userphone;
    }
    
    public void setUserphone(String userphone) {
        this.userphone = userphone;
    }
    public String getUseradd() {
        return this.useradd;
    }
    
    public void setUseradd(String useradd) {
        this.useradd = useradd;
    }
    public int getAdId() {
        return this.adId;
    }
    
    public void setAdId(int adId) {
        this.adId = adId;
    }




}

