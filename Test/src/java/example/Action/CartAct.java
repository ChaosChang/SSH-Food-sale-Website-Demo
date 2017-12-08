/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import example.Bean.Cart;
import example.Bean.Good;
import example.Bean.Userinfo;
import example.Service.CartService;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class CartAct extends ActionSupport implements Action {

    private int cartId;
    private int number;
    private int userId;
    private int goodId;
    private Integer orderId;
    private String image;
    private BigDecimal money;
    private CartService ca;

    public int getCartId() {
        return this.cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getUserId() {
        return this.userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getGoodId() {
        return this.goodId;
    }

    public void setGoodId(int goodId) {
        this.goodId = goodId;
    }

    public int getNumber() {
        return this.number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getImage() {
        return this.image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public BigDecimal getMoney() {
        return this.money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }
    
    public Integer getOrderId() {
        return this.orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public void setCartService(CartService ca) {
        this.ca = ca;
    }

    public CartAct() {
    }

    public String execute() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //查
    public String search() throws Exception {
        List cartlist = ca.search();
        List realcartlist = new ArrayList();
        Userinfo u = (Userinfo) (ActionContext.getContext().getApplication().get("user"));//取当前用户
        if(u==null)
            return ERROR;
        if (cartlist != null) {
            for (int i = 0; i < cartlist.size(); i++) {
                if (u.getUserId() == ((Cart) (cartlist.get(i))).getUserId()&& ((Cart) (cartlist.get(i))).getOrderId()==null) {//购物车里的和当前用户的id可以对上且未下单的
                    realcartlist.add(((Cart) (cartlist.get(i))));
                }
            }
        }
        //ServletActionContext.getRequest().setAttribute("userlist", userlist);
        List goodlist = (List) ActionContext.getContext().getApplication().get("goodlist");//获取商品列表，将商品信息存入购物车中
        for (int i = 0; i < realcartlist.size(); i++) {
            for (int j = 0; j < goodlist.size(); j++) {
                if (((Good) (goodlist.get(j))).getGoodId() == ((Cart) (realcartlist.get(i))).getGoodId()) {
                    ((Cart) (realcartlist.get(i))).setImage(((Good) (goodlist.get(j))).getGoodimage());
                    ((Cart) (realcartlist.get(i))).setMoney(((Good) (goodlist.get(j))).getSaleprice());
                    break;
                }
            }
        }
        ActionContext.getContext().getApplication().put("allcartlist", cartlist);
        ActionContext.getContext().getApplication().put("realcartlist", realcartlist);
        return SUCCESS;
    }

    //增
    public String cartAdd() throws Exception {
        List cartlist=(List)ActionContext.getContext().getApplication().get("allcartlist");
        //常规信息注入
        Cart cartadd = new Cart();
        Userinfo u = (Userinfo) (ActionContext.getContext().getApplication().get("user"));//从application中取
        if (u != null) {
            cartadd.setUserId(u.getUserId());
        }
        else
            return ERROR;
        cartadd.setNumber(getNumber());
        cartadd.setGoodId(getGoodId());

        //ID信息
        if (cartlist != null&&cartlist.size()>0) {
            int max = ((Cart) (cartlist.get(0))).getCartId();
            for (int i = 0; i < cartlist.size(); i++) {
                if (max < ((Cart) (cartlist.get(i))).getCartId()) {
                    max = ((Cart) (cartlist.get(i))).getCartId();
                }
            }
            cartadd.setCartId(++max);
        } else {
            cartadd.setCartId(0);
        }

        ca.save(cartadd);
        cartlist.add(cartadd);
        ActionContext.getContext().getApplication().put("allcartlist", cartlist);
        return SUCCESS;
    }

    //删
    public String cartRemove() throws Exception {
        Cart cartdel = new Cart();
        //依照id查找数据库中对应的用户表
        List realcartlist = (List) ActionContext.getContext().getApplication().get("realcartlist");
        for (int i = 0; i < realcartlist.size(); i++) {
            if (cartId == (((Cart) (realcartlist.get(i))).getCartId())) {
                cartdel = (Cart) (realcartlist.get(i));
                break;
            }
        }
        ca.delete(cartdel);
        realcartlist.remove(cartdel);
        return SUCCESS;
    }
}
