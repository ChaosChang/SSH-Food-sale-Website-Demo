/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Cart;
import example.HibernateUtil;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class CartDaoImpl implements CartDao{
    public void deleteCart(Cart cart) {
        HibernateUtil.delete(cart);
    }

    public void saveCart(Cart cart) {
        HibernateUtil.add(cart);
    }

    public List search() {
        String hql = "select c from Cart c";
        return HibernateUtil.search(hql);
    }
}
