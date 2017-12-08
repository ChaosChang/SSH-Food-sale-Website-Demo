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
import example.Bean.Chef;
import example.Bean.Eimage;
import example.Bean.Gimage;
import example.Bean.Good;
import example.Bean.Shop;
import example.Service.ShopService;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class ShopAct extends ActionSupport implements Action {

    private int shopId;
    private String shopname;
    private String city;
    private String shopdescribe;
    private String shopimage;
    private ShopService ss;

    public int getShopId() {
        return this.shopId;
    }

    public void setShopId(int shopId) {
        this.shopId = shopId;
    }

    public String getShopname() {
        return this.shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getShopdescribe() {
        return this.shopdescribe;
    }

    public void setShopdescribe(String shopdescribe) {
        this.shopdescribe = shopdescribe;
    }

    public String getShopimage() {
        return this.shopimage;
    }

    public void setShopimage(String shopimage) {
        this.shopimage = shopimage;
    }

    public void setShopService(ShopService ss) {
        this.ss = ss;
    }

    public ShopAct() {
    }

    public String execute() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //查
    public String search() throws Exception {
        List shoplist = ss.search();
        //ServletActionContext.getRequest().setAttribute("userlist", userlist);
        ActionContext.getContext().getApplication().put("shoplist", shoplist);
        return SUCCESS;
    }

    //增
    public String shopAdd() throws Exception {
        List shoplist = (List) ActionContext.getContext().getApplication().get("shoplist");

        //常规信息注入
        Shop shopadd = new Shop();
        shopadd.setShopname(getShopname());
        shopadd.setShopdescribe(getShopdescribe());
        shopadd.setCity(getCity());
        shopadd.setShopimage(getShopimage());
        //管理员ID信息
        Adminster a = (Adminster) (ActionContext.getContext().getApplication().get("admin"));//从application中取管理员信息
        if (a != null) {
            shopadd.setAdId(a.getAdId());
        } else {
            shopadd.setAdId(0);
        }

        //ID信息
        if (shoplist != null) {
            int max = ((Shop) (shoplist.get(0))).getShopId();
            for (int i = 0; i < shoplist.size(); i++) {
                if (max < ((Shop) (shoplist.get(i))).getShopId()) {
                    max = ((Shop) (shoplist.get(i))).getShopId();
                }
            }
            shopadd.setShopId(++max);
        } else {
            shopadd.setShopId(0);
        }

        ss.save(shopadd);
        return SUCCESS;
    }

    //删
    public String shopRemove() throws Exception {
        Shop shopdel = new Shop();
        //依照id查找数据库中对应的用户表
        List shoplist = (List) ActionContext.getContext().getApplication().get("shoplist");
        for (int i = 0; i < shoplist.size(); i++) {
            if (shopId == (((Shop) (shoplist.get(i))).getShopId())) {
                shopdel = (Shop) (shoplist.get(i));
                break;
            }
        }
        ss.delete(shopdel);
        return SUCCESS;
    }

    //改
    public String shopEdit() throws Exception {
        Shop shopEdi = new Shop();
        List userlist = (List) ActionContext.getContext().getApplication().get("shoplist");
        for (int i = 0; i < userlist.size(); i++) {
            if (shopId == (((Shop) (userlist.get(i))).getShopId())) {
                shopEdi = (Shop) (userlist.get(i));
                break;
            }
        }
        ActionContext.getContext().put("shopEdi", shopEdi);//request请求，一次
        return SUCCESS;
    }

    public String shopUpdate() throws Exception {
        //按ID找到数据库对应的信息
        Shop shopEdi = new Shop();
        List shoplist = (List) ActionContext.getContext().getApplication().get("shoplist");
        for (int i = 0; i < shoplist.size(); i++) {
            if (shopId == (((Shop) (shoplist.get(i))).getShopId())) {
                shopEdi = (Shop) (shoplist.get(i));
                break;
            }
        }
        shopEdi.setShopId(shopId);
        shopEdi.setShopname(shopname);
        shopEdi.setCity(city);
        shopEdi.setShopdescribe(shopdescribe);
        shopEdi.setShopimage(shopimage);
        Adminster a = (Adminster) (ActionContext.getContext().getApplication().get("admin"));
        shopEdi.setAdId(a.getAdId());
        ss.update(shopEdi);
        return SUCCESS;
    }

    public String searchShop() throws Exception {
        Shop currentShop = new Shop();

        //当前商店查找
        List shoplist = (List) ActionContext.getContext().getApplication().get("shoplist");
        for (int i = 0; i < shoplist.size(); i++) {
            if (city.equals(((Shop) (shoplist.get(i))).getCity()) && shopname.equals(((Shop) (shoplist.get(i))).getShopname())) {
                currentShop = (Shop) (shoplist.get(i));
                break;
            }
        }
        ActionContext.getContext().getApplication().put("currentShop", currentShop);

        //当前厨师查找
        List cheflist = (List) ActionContext.getContext().getApplication().get("cheflist");
        List currentchef = new ArrayList();
        for (int i = 0; i < cheflist.size(); i++) {
            if (currentShop.getShopId() == ((Chef) (cheflist.get(i))).getShopId()) {
                currentchef.add((Chef) (cheflist.get(i)));
            }
        }
        ActionContext.getContext().getApplication().put("currentchef", currentchef);
        //当前环境查找
        List eimagelist = (List) ActionContext.getContext().getApplication().get("eimagelist");
        List currenteimage = new ArrayList();
        for (int i = 0; i < eimagelist.size(); i++) {
            if (currentShop.getShopId() == ((Eimage) (eimagelist.get(i))).getShopId()) {
                currenteimage.add((Eimage) (eimagelist.get(i)));
            }
        }
        ActionContext.getContext().getApplication().put("currenteimage", currenteimage);
        //当前食物查找
        List gimagelist = (List) ActionContext.getContext().getApplication().get("gimagelist");
        List currentgimage = new ArrayList();
        for (int i = 0; i < gimagelist.size(); i++) {
            if (currentShop.getShopId() == ((Gimage) (gimagelist.get(i))).getShopId()) {
                currentgimage.add((Gimage) (gimagelist.get(i)));
            }
        }
        ActionContext.getContext().getApplication().put("currentgimage", currentgimage);
        //当前商品查找
        List goodlist = (List) ActionContext.getContext().getApplication().get("goodlist");
        List currentgood = new ArrayList();
        for (int i = 0; i < goodlist.size(); i++) {
            if (currentShop.getShopId() == ((Good) (goodlist.get(i))).getShopId()) {
                currentgood.add((Good) (goodlist.get(i)));
            }
        }
        ActionContext.getContext().getApplication().put("currentgood", currentgood);
        return SUCCESS;
    }
}
