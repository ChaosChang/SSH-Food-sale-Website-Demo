/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Shop;
import example.HibernateUtil;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class ShopDaoImpl implements ShopDao{

    public void deleteShop(Shop shop) {
        HibernateUtil.delete(shop);
    }

    public void saveShop(Shop shop) {
        HibernateUtil.add(shop);
    }

    public void updateShop(Shop shop) {
        HibernateUtil.update(shop);
    }

    public List search() {
        String hql = "select s from Shop s";
        return HibernateUtil.search(hql);
    }
}
