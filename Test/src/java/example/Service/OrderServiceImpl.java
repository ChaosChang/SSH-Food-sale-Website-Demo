/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Cart;
import example.Bean.Good;
import example.Bean.Orderinfo;
import example.Dao.OrderDao;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class OrderServiceImpl implements OrderService{
    private OrderDao orderDao;

    public OrderDao getOrderDao() {
        return orderDao;
    }
    
    public void setOrderDao(OrderDao orderDao){
        this.orderDao=orderDao;
    }

    public void save(Orderinfo order)
    {
        orderDao.saveOrder(order);
    }

    public void delete(Orderinfo order){
        orderDao.deleteOrder(order);
    }

    public List search(){
        List l=orderDao.search();
        if(l!=null)
            {
                return l;
            }
            return null;
    }
    
    public void salenumberUpdate(Good good){
        orderDao.salenumberUpdate(good);
    }
    
    public void cleancart(Cart cart){
        orderDao.cleancart(cart);
    }
}
