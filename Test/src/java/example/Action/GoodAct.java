/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import example.Bean.Adminster;
import example.Bean.Good;
import example.Service.GoodService;
import java.math.BigDecimal;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class GoodAct extends ActionSupport implements Action{

    private int goodId;
    private String goodname;
    private String goodimage;
    private BigDecimal inprice;
    private BigDecimal saleprice;
    private String pdate;
    private int shopId;
    private Integer salenumber;
    private GoodService gs;
    
    //getter&setter
    public int getGoodId() {
        return this.goodId;
    }
    
    public void setGoodId(int goodId) {
        this.goodId = goodId;
    }
    public String getGoodname() {
        return this.goodname;
    }
    
    public void setGoodname(String goodname) {
        this.goodname = goodname;
    }
    public String getGoodimage() {
        return this.goodimage;
    }
    
    public void setGoodimage(String goodimage) {
        this.goodimage = goodimage;
    }
    public BigDecimal getInprice() {
        return this.inprice;
    }
    
    public void setInprice(BigDecimal inprice) {
        this.inprice = inprice;
    }
    public BigDecimal getSaleprice() {
        return this.saleprice;
    }
    
    public void setSaleprice(BigDecimal saleprice) {
        this.saleprice = saleprice;
    }
    public String getPdate() {
        return this.pdate;
    }
    
    public void setPdate(String pdate) {
        this.pdate = pdate;
    }

    public int getShopId() {
        return this.shopId;
    }
    
    public void setShopId(int shopId) {
        this.shopId = shopId;
    }
    public Integer getSalenumber() {
        return this.salenumber;
    }
    
    public void setSalenumber(Integer salenumber) {
        this.salenumber = salenumber;
    }
    
    public void setGoodService(GoodService gs) {
        this.gs = gs;
    }
    
    public GoodAct() {
    }

    public String execute() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    //查
    public String search() throws Exception {
        List goodlist = gs.search();
        //ServletActionContext.getRequest().setAttribute("userlist", userlist);
        ActionContext.getContext().getApplication().put("goodlist", goodlist);
        return SUCCESS;
    }
    
    //增
    public String goodAdd() throws Exception {
        List goodlist = (List) ActionContext.getContext().getApplication().get("goodlist");

        //常规信息注入
        Good goodadd = new Good();
        goodadd.setGoodname(getGoodname());
        goodadd.setGoodimage(getGoodimage());
        goodadd.setInprice(getInprice());
        goodadd.setSaleprice(getSaleprice());
        goodadd.setPdate(getPdate());
        goodadd.setSalenumber(getSalenumber());
        goodadd.setShopId(getShopId());//外键，核对有没有该商店
        //管理员ID信息
        Adminster a = (Adminster) (ActionContext.getContext().getApplication().get("admin"));//从application中取管理员信息
        if (a != null) {
            goodadd.setAdId(a.getAdId());
        } else {
            goodadd.setAdId(0);
        }

        //ID信息
        if (goodlist != null) {
            int max = ((Good) (goodlist.get(0))).getGoodId();
            for (int i = 0; i < goodlist.size(); i++) {
                if (max < ((Good) (goodlist.get(i))).getGoodId()) {
                    max = ((Good) (goodlist.get(i))).getGoodId();
                }
            }
            goodadd.setGoodId(++max);
        } else {
            goodadd.setGoodId(0);
        }
        
        gs.save(goodadd);
        return SUCCESS;
    }
    
    //删
    public String goodRemove() throws Exception {
        Good gooddel = new Good();
        //依照id查找数据库中对应的用户表
        List goodlist = (List) ActionContext.getContext().getApplication().get("goodlist");
        for (int i = 0; i < goodlist.size(); i++) {
            if (goodId == (((Good) (goodlist.get(i))).getGoodId())) {
                gooddel = (Good) (goodlist.get(i));
                break;
            }
        }
        gs.delete(gooddel);
        return SUCCESS;
    }

    //改
    public String goodEdit() throws Exception {
        Good goodEdi = new Good();
        List goodlist = (List) ActionContext.getContext().getApplication().get("goodlist");
        for (int i = 0; i < goodlist.size(); i++) {
            if (goodId == (((Good) (goodlist.get(i))).getGoodId())) {
                goodEdi = (Good) (goodlist.get(i));
                break;
            }
        }
        ActionContext.getContext().put("goodEdi", goodEdi);//request请求，一次
        return SUCCESS;
    }
    
    public String goodUpdate() throws Exception {
        //按ID找到数据库对应的信息
        Good goodEdi = new Good();
        List goodlist = (List) ActionContext.getContext().getApplication().get("goodlist");
        for (int i = 0; i < goodlist.size(); i++) {
            if (goodId == (((Good) (goodlist.get(i))).getGoodId())) {
                goodEdi = (Good) (goodlist.get(i));
                break;
            }
        }
        goodEdi.setShopId(shopId);
        goodEdi.setGoodId(goodId);
        goodEdi.setGoodimage(goodimage);
        goodEdi.setGoodname(goodname);
        goodEdi.setInprice(inprice);
        goodEdi.setSaleprice(saleprice);
        goodEdi.setPdate(pdate);
        goodEdi.setSalenumber(salenumber);
        Adminster a = (Adminster) (ActionContext.getContext().getApplication().get("admin"));
        goodEdi.setAdId(a.getAdId());
        gs.update(goodEdi);
        return SUCCESS;
    }
}
