/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Action;

import com.opensymphony.xwork2.Action;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import example.Bean.Adminster;
import example.Bean.Userinfo;
import example.Service.LoginService;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class User extends ActionSupport implements Action {
    
    private int userId;
    private String username;
    private String userpw;
    private String userphone;
    private String useradd;
    private LoginService ls;
    
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
    
    public void setLoginService(LoginService ls) {
        this.ls = ls;
    }
    
    public User() {
    }
    
    public String execute() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //查
    public String search() throws Exception {
        List userlist = ls.search();
        //ServletActionContext.getRequest().setAttribute("userlist", userlist);
        ActionContext.getContext().getApplication().put("userlist", userlist);
        return SUCCESS;
    }

    //增
    public String userAdd() throws Exception {
        List userlist = (List) ActionContext.getContext().getApplication().get("userlist");
        String nameValication = getUsername();
        for (int i = 0; i < userlist.size(); i++) {
            if (nameValication.equals(((Userinfo) (userlist.get(i))).getUsername())) {
                ActionContext.getContext().put("tip", "该用户名已经被使用");
                return ERROR;
            }
        }

        //常规信息注入
        Userinfo useradd = new Userinfo();
        useradd.setUsername(getUsername());
        useradd.setUserpw(getUserpw());
        useradd.setUserphone(getUserphone());
        useradd.setUseradd(getUseradd());
        Adminster a = (Adminster) (ActionContext.getContext().getApplication().get("admin"));//从application中取管理员信息
        if (a != null) {
            useradd.setAdId(a.getAdId());
        } else {
            useradd.setAdId(0);
        }

        //ID信息
        if (userlist != null) {
            int max = ((Userinfo) (userlist.get(0))).getUserId();
            for (int i = 0; i < userlist.size(); i++) {
                if (max < ((Userinfo) (userlist.get(i))).getUserId()) {
                    max = ((Userinfo) (userlist.get(i))).getUserId();
                }
            }
            useradd.setUserId(++max);
        } else {
            useradd.setUserId(100);
        }
        
        String c = useradd.getClass().getName();//获取类型名，但是这个包括路径
        ls.save(useradd);
        userlist.add(useradd);
        return SUCCESS;
    }

    //删
    public String userRemove() throws Exception {
        Userinfo userdel = new Userinfo();
        //依照id查找数据库中对应的用户表
        List userlist = (List) ActionContext.getContext().getApplication().get("userlist");
        for (int i = 0; i < userlist.size(); i++) {
            if (userId == (((Userinfo) (userlist.get(i))).getUserId())) {
                userdel = (Userinfo) (userlist.get(i));
                break;
            }
        }
        ls.delete(userdel);
        userlist.remove(userdel);
        return SUCCESS;
    }

    //改
    public String userEdit() throws Exception {
        Userinfo userEdi = new Userinfo();
        List userlist = (List) ActionContext.getContext().getApplication().get("userlist");
        for (int i = 0; i < userlist.size(); i++) {
            if (userId == (((Userinfo) (userlist.get(i))).getUserId())) {
                userEdi = (Userinfo) (userlist.get(i));
                break;
            }
        }
        ActionContext.getContext().put("userEdi", userEdi);//request请求，一次
        return SUCCESS;
    }
    
    public String userUpdate() throws Exception {
        //按ID找到数据库对应的信息
        Userinfo userEdi = new Userinfo();
        List userlist = (List) ActionContext.getContext().getApplication().get("userlist");
        for (int i = 0; i < userlist.size(); i++) {
            if (userId == (((Userinfo) (userlist.get(i))).getUserId())) {
                userEdi = (Userinfo) (userlist.get(i));
                break;
            }
        }
        userEdi.setUserId(userId);
        userEdi.setUsername(username);
        userEdi.setUserpw(userpw);
        userEdi.setUserphone(userphone);
        userEdi.setUseradd(useradd);
        Adminster a = (Adminster) (ActionContext.getContext().getApplication().get("admin"));
        userEdi.setAdId(a.getAdId());
        ls.update(userEdi);
        return SUCCESS;
    }
}
