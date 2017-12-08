/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Cart;
import example.Bean.Good;
import example.Bean.Orderinfo;
import example.HibernateUtil;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class OrderDaoImpl implements OrderDao{
    public void deleteOrder(Orderinfo order) {
        HibernateUtil.delete(order);
    }

    public void saveOrder(Orderinfo order) {
        HibernateUtil.add(order);
    }

    public List search() {
        String hql = "select o from Orderinfo o";
        return HibernateUtil.search(hql);
    }
    
    public void salenumberUpdate(Good good){
        HibernateUtil.update(good);
    }
    
    public void cleancart(Cart cart){
        HibernateUtil.update(cart);
    }
}
