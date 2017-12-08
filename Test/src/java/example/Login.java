/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import example.Bean.Adminster;
import example.Bean.Userinfo;
import example.Service.CartService;
import example.Service.LoginService;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class Login extends ActionSupport implements Action {

    private LoginService ls;
    private String adname;
    private String adpw;
    private String username;
    private String userpw;
    private CartService ca;

    public String getAdname() {
        return adname;
    }

    public String getAdpw() {
        return adpw;
    }

    public String getUsername() {
        return username;
    }

    public String getUserpw() {
        return userpw;
    }

    public void setAdname(String adname) {
        this.adname = adname;
    }

    public void setAdpw(String adpw) {
        this.adpw = adpw;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setUserpw(String userpw) {
        this.userpw = userpw;
    }

    public void setLoginService(LoginService ls) {
        this.ls = ls;
    }
    
    public void setCartService(CartService ca) {
        this.ca = ca;
    }

    public Login() {
    }

    public String execute() throws Exception {
        Adminster login = new Adminster();
        Adminster log = null;
        login.setAdname(getAdname());
        login.setAdpw(getAdpw());
        log = ls.find(login);
        if (log != null) {
            ActionContext.getContext().getApplication().put("admin", log);//向application中写入对象，application作用在整个web应用程序的生命周期中
            return SUCCESS;
        }
        return ERROR;
    }

    public String userLogin() throws Exception {
        Userinfo login = new Userinfo();
        Userinfo log = null;
        login.setUsername(getUsername());
        login.setUserpw(getUserpw());
        log = ls.find(login);
        if (log != null) {
            List cartlist=ca.search();
            ActionContext.getContext().getApplication().put("user", log);
            ActionContext.getContext().getApplication().put("allcartlist", cartlist);
            return SUCCESS;
        }
        return ERROR;
    }
    
    public String userLogout() throws Exception{
        ActionContext.getContext().getApplication().remove("user");
        return SUCCESS;
    }

}
