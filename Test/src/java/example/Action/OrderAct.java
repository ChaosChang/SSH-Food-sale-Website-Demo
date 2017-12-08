/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Action;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionContext;
import example.Bean.Adminster;
import example.Bean.Cart;
import example.Bean.Good;
import example.Bean.Orderinfo;
import example.Bean.Userinfo;
import example.Service.CartService;
import example.Service.OrderService;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class OrderAct {

    private int orderId;
    private String orderdate;
    private int totalmoney;
    private int userId;
    private OrderService os;
    private CartService ca;

    public int getOrderId() {
        return this.orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getOrderdate() {
        return this.orderdate;
    }

    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate;
    }

    public int getTotalmoney() {
        return this.totalmoney;
    }

    public void setTotalmoney(int totalmoney) {
        this.totalmoney = totalmoney;
    }

    public int getUserId() {
        return this.userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setOrderService(OrderService os) {
        this.os = os;
    }
    
    public void setCartService(CartService ca) {
        this.ca = ca;
    }

    public OrderAct() {
    }

    public String execute() throws Exception {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //查
    public String search() throws Exception {
        List orderlist = os.search();
        //ServletActionContext.getRequest().setAttribute("userlist", userlist);
        ActionContext.getContext().getApplication().put("orderlist", orderlist);
        return SUCCESS;
    }

    //增
    public String orderAdd() throws Exception {
        List orderlist = (List) ActionContext.getContext().getApplication().get("orderlist");

        //常规信息注入
        Orderinfo orderadd = new Orderinfo();
        orderadd.setOrderdate(getOrderdate());
        orderadd.setTotalmoney(getTotalmoney());//外键，核对有没有该商店

        //ID信息
        if (orderlist != null) {
            int max = ((Orderinfo) (orderlist.get(0))).getOrderId();
            for (int i = 0; i < orderlist.size(); i++) {
                if (max < ((Orderinfo) (orderlist.get(i))).getOrderId()) {
                    max = ((Orderinfo) (orderlist.get(i))).getOrderId();
                }
            }
            orderadd.setOrderId(++max);
        } else {
            orderadd.setOrderId(0);
        }
        //两个需要从application中取的信息
        Adminster a = (Adminster) (ActionContext.getContext().getApplication().get("admin"));//从application中取管理员信息
        if (a != null) {
            orderadd.setAdId(a.getAdId());
        } else {
            orderadd.setAdId(0);
        }
        Userinfo u = (Userinfo) (ActionContext.getContext().getApplication().get("user"));//从application中取用户信息
        if (u != null) {
            orderadd.setUserId(u.getUserId());
        }

        os.save(orderadd);
        //购买数量写入数据库
        List clearcartlist = (List) ActionContext.getContext().getApplication().get("realcartlist");
        Good goodupdate = new Good();
        List salelist = (List) ActionContext.getContext().getApplication().get("goodlist");
        for (int i = 0; i < clearcartlist.size(); i++) {
            for (int j = 0; j < salelist.size(); j++) {
                if (((Good) salelist.get(j)).getGoodId() == ((Cart) clearcartlist.get(i)).getGoodId()) {
                    goodupdate=((Good) salelist.get(j));
                    int num=goodupdate.getSalenumber();
                    goodupdate.setSalenumber(num+((Cart) clearcartlist.get(i)).getNumber());
                    os.salenumberUpdate(goodupdate);
                }
            }
        }
        //清理购物车
        Cart cartclean=new Cart();
        for (int i = 0; i < clearcartlist.size(); i++) {
            for (int j = 0; j < salelist.size(); j++) {
                cartclean=((Cart) clearcartlist.get(i));//获取到用户的购物车信息
                cartclean.setOrderId(orderadd.getOrderId());//给购物车加上订单号
                os.cleancart(cartclean);//更新购物车数据
            }
        }
        clearcartlist.clear();
        return SUCCESS;
    }

    //删
    public String orderRemove() throws Exception {
        Orderinfo orderdel = new Orderinfo();
        //依照id查找数据库中对应的用户表
        List orderlist = (List) ActionContext.getContext().getApplication().get("orderlist");
        List cartlist = (List) ActionContext.getContext().getApplication().get("allcartlist");
        for (int i = 0; i < cartlist.size(); i++) {
            if (orderId == (((Cart) (cartlist.get(i))).getOrderId())) {
                //cartlist.remove(i);
                ca.delete(((Cart) (cartlist.get(i))));//移除该数据
                break;
            }
        }
        for (int i = 0; i < orderlist.size(); i++) {
            if (orderId == (((Orderinfo) (orderlist.get(i))).getOrderId())) {
                orderdel = (Orderinfo) (orderlist.get(i));
                break;
            }
        }
        os.delete(orderdel);
        orderlist.remove(orderdel);
        return SUCCESS;
    }
    //详情查看
    public String orderDetail() throws Exception{
        List cartlist=ca.search();//获取购物车
        int id=getOrderId();//获取当前order的id
        List orderdetail=new ArrayList();//订单详情
        orderdetail.clear();
        for (int i = 0; i < cartlist.size(); i++) {
            if(((Cart) (cartlist.get(i))).getOrderId()!=null)
                if (id == ((Cart) (cartlist.get(i))).getOrderId()) {//订单号相同取出
                    orderdetail.add(cartlist.get(i));
                }
            }
        ActionContext.getContext().getApplication().put("allcartlist", cartlist);
        ActionContext.getContext().getApplication().put("orderdetail", orderdetail);
        return SUCCESS;
    }
}
