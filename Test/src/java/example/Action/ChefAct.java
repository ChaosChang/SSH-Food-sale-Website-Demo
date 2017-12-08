/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import example.Bean.Chef;
import example.Service.ChefService;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class ChefAct extends ActionSupport implements Action{

    private int chefId;
    private String chefname;
    private int shopId;
    private String cplace;
    private ChefService cs;

    public int getChefId() {
        return this.chefId;
    }

    public void setChefId(int chefId) {
        this.chefId = chefId;
    }

    public String getChefname() {
        return this.chefname;
    }

    public void setChefname(String chefname) {
        this.chefname = chefname;
    }

    public int getShopId() {
        return this.shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public String getCplace() {
        return this.cplace;
    }

    public void setCplace(String cplace) {
        this.cplace = cplace;
    }
    
    public void setChefService(ChefService cs) {
        this.cs = cs;
    }

    public ChefAct() {
    }

    public String execute() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    //查
    public String search() throws Exception {
        List cheflist = cs.search();
        //ServletActionContext.getRequest().setAttribute("userlist", userlist);
        ActionContext.getContext().getApplication().put("cheflist", cheflist);
        return SUCCESS;
    }
    
    //增
    public String chefAdd() throws Exception {
        List cheflist = (List) ActionContext.getContext().getApplication().get("cheflist");

        //常规信息注入
        Chef chefadd = new Chef();
        chefadd.setCplace(getCplace());
        chefadd.setChefname(getChefname());
        chefadd.setShopId(getShopId());//外键，核对有没有该商店

        //ID信息
        if (cheflist != null) {
            int max = ((Chef) (cheflist.get(0))).getChefId();
            for (int i = 0; i < cheflist.size(); i++) {
                if (max < ((Chef) (cheflist.get(i))).getChefId()) {
                    max = ((Chef) (cheflist.get(i))).getChefId();
                }
            }
            chefadd.setChefId(++max);
        } else {
            chefadd.setChefId(0);
        }
        
        cs.save(chefadd);
        return SUCCESS;
    }
    
    //删
    public String chefRemove() throws Exception {
        Chef chefdel = new Chef();
        //依照id查找数据库中对应的用户表
        List cheflist = (List) ActionContext.getContext().getApplication().get("cheflist");
        for (int i = 0; i < cheflist.size(); i++) {
            if (chefId == (((Chef) (cheflist.get(i))).getChefId())) {
                chefdel = (Chef) (cheflist.get(i));
                break;
            }
        }
        cs.delete(chefdel);
        return SUCCESS;
    }

    //改
    public String chefEdit() throws Exception {
        Chef chefEdi = new Chef();
        List cheflist = (List) ActionContext.getContext().getApplication().get("cheflist");
        for (int i = 0; i < cheflist.size(); i++) {
            if (chefId == (((Chef) (cheflist.get(i))).getChefId())) {
                chefEdi = (Chef) (cheflist.get(i));
                break;
            }
        }
        ActionContext.getContext().put("chefEdi", chefEdi);//request请求，一次
        return SUCCESS;
    }
    
    public String chefUpdate() throws Exception {
        //按ID找到数据库对应的信息
        Chef chefEdi = new Chef();
        List cheflist = (List) ActionContext.getContext().getApplication().get("cheflist");
        for (int i = 0; i < cheflist.size(); i++) {
            if (chefId == (((Chef) (cheflist.get(i))).getChefId())) {
                chefEdi = (Chef) (cheflist.get(i));
                break;
            }
        }
        chefEdi.setShopId(shopId);
        chefEdi.setChefname(chefname);
        chefEdi.setCplace(cplace);
        cs.update(chefEdi);
        return SUCCESS;
    }
}
