/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import example.Bean.Gimage;
import example.Service.GimageService;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class GimageAct extends ActionSupport implements Action{

    private int gid;
    private String gplace;
    private int shopId;
    private GimageService gs;

    public int getGid() {
        return this.gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getGplace() {
        return this.gplace;
    }

    public void setGplace(String gplace) {
        this.gplace = gplace;
    }

    public int getShopId() {
        return this.shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }
    
    public void setGimageService(GimageService gs) {
        this.gs = gs;
    }

    public GimageAct() {
    }

    public String execute() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    //查
    public String search() throws Exception {
        List gimagelist = gs.search();
        //ServletActionContext.getRequest().setAttribute("userlist", userlist);
        ActionContext.getContext().getApplication().put("gimagelist", gimagelist);
        return SUCCESS;
    }
    
    //增
    public String gimageAdd() throws Exception {
        List gimagelist = (List) ActionContext.getContext().getApplication().get("gimagelist");

        //常规信息注入
        Gimage gimageadd = new Gimage();
        gimageadd.setGplace(getGplace());
        gimageadd.setShopId(getShopId());//外键，核对有没有该商店

        //ID信息
        if (gimagelist != null) {
            int max = ((Gimage) (gimagelist.get(0))).getGid();
            for (int i = 0; i < gimagelist.size(); i++) {
                if (max < ((Gimage) (gimagelist.get(i))).getGid()) {
                    max = ((Gimage) (gimagelist.get(i))).getGid();
                }
            }
            gimageadd.setGid(++max);
        } else {
            gimageadd.setGid(0);
        }
        
        gs.save(gimageadd);
        return SUCCESS;
    }
    
    //删
    public String gimageRemove() throws Exception {
        Gimage gimagedel = new Gimage();
        //依照id查找数据库中对应的用户表
        List gimagelist = (List) ActionContext.getContext().getApplication().get("gimagelist");
        for (int i = 0; i < gimagelist.size(); i++) {
            if (gid == (((Gimage) (gimagelist.get(i))).getGid())) {
                gimagedel = (Gimage) (gimagelist.get(i));
                break;
            }
        }
        gs.delete(gimagedel);
        return SUCCESS;
    }

    //改
    public String gimageEdit() throws Exception {
        Gimage gimageEdi = new Gimage();
        List gimagelist = (List) ActionContext.getContext().getApplication().get("gimagelist");
        for (int i = 0; i < gimagelist.size(); i++) {
            if (gid == (((Gimage) (gimagelist.get(i))).getGid())) {
                gimageEdi = (Gimage) (gimagelist.get(i));
                break;
            }
        }
        ActionContext.getContext().put("gimageEdi", gimageEdi);//request请求，一次
        return SUCCESS;
    }
    
    public String gimageUpdate() throws Exception {
        //按ID找到数据库对应的信息
        Gimage gimageEdi = new Gimage();
        List gimagelist = (List) ActionContext.getContext().getApplication().get("gimagelist");
        for (int i = 0; i < gimagelist.size(); i++) {
            if (gid == (((Gimage) (gimagelist.get(i))).getGid())) {
                gimageEdi = (Gimage) (gimagelist.get(i));
                break;
            }
        }
        gimageEdi.setShopId(shopId);
        gimageEdi.setGplace(gplace);
        gs.update(gimageEdi);
        return SUCCESS;
    }
}
