/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import example.Bean.Eimage;
import example.Service.EimageService;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class EimageAct extends ActionSupport implements Action{

    private int eid;
    private String eplace;
    private int shopId;
    private EimageService es;

    public int getEid() {
        return this.eid;
    }

    public void setEid(int eid) {
        this.eid = eid;
    }

    public String getEplace() {
        return this.eplace;
    }

    public void setEplace(String eplace) {
        this.eplace = eplace;
    }

    public int getShopId() {
        return this.shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }
    public void setEimageService(EimageService es) {
        this.es = es;
    }

    public EimageAct() {
    }

    public String execute() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    //查
    public String search() throws Exception {
        List eimagelist = es.search();
        //ServletActionContext.getRequest().setAttribute("userlist", userlist);
        ActionContext.getContext().getApplication().put("eimagelist", eimagelist);
        return SUCCESS;
    }
    
    //增
    public String eimageAdd() throws Exception {
        List eimagelist = (List) ActionContext.getContext().getApplication().get("eimagelist");

        //常规信息注入
        Eimage eimageadd = new Eimage();
        eimageadd.setEplace(getEplace());
        eimageadd.setShopId(getShopId());//外键，核对有没有该商店

        //ID信息
        if (eimagelist != null) {
            int max = ((Eimage) (eimagelist.get(0))).getEid();
            for (int i = 0; i < eimagelist.size(); i++) {
                if (max < ((Eimage) (eimagelist.get(i))).getEid()) {
                    max = ((Eimage) (eimagelist.get(i))).getEid();
                }
            }
            eimageadd.setEid(++max);
        } else {
            eimageadd.setEid(0);
        }
        
        es.save(eimageadd);
        return SUCCESS;
    }
    
    //删
    public String eimageRemove() throws Exception {
        Eimage eimagedel = new Eimage();
        //依照id查找数据库中对应的用户表
        List eimagelist = (List) ActionContext.getContext().getApplication().get("eimagelist");
        for (int i = 0; i < eimagelist.size(); i++) {
            if (eid == (((Eimage) (eimagelist.get(i))).getEid())) {
                eimagedel = (Eimage) (eimagelist.get(i));
                break;
            }
        }
        es.delete(eimagedel);
        return SUCCESS;
    }

    //改
    public String eimageEdit() throws Exception {
        Eimage eimageEdi = new Eimage();
        List eimagelist = (List) ActionContext.getContext().getApplication().get("eimagelist");
        for (int i = 0; i < eimagelist.size(); i++) {
            if (eid == (((Eimage) (eimagelist.get(i))).getEid())) {
                eimageEdi = (Eimage) (eimagelist.get(i));
                break;
            }
        }
        ActionContext.getContext().put("eimageEdi", eimageEdi);//request请求，一次
        return SUCCESS;
    }
    
    public String eimageUpdate() throws Exception {
        //按ID找到数据库对应的信息
        Eimage eimageEdi = new Eimage();
        List eimagelist = (List) ActionContext.getContext().getApplication().get("eimagelist");
        for (int i = 0; i < eimagelist.size(); i++) {
            if (eid == (((Eimage) (eimagelist.get(i))).getEid())) {
                eimageEdi = (Eimage) (eimagelist.get(i));
                break;
            }
        }
        eimageEdi.setShopId(shopId);
        eimageEdi.setEplace(eplace);
        es.update(eimageEdi);
        return SUCCESS;
    }
}
