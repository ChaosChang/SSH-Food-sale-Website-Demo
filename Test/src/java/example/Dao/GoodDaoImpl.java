/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Good;
import example.HibernateUtil;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class GoodDaoImpl implements GoodDao{
    public void deleteGood(Good good) {
        HibernateUtil.delete(good);
    }

    public void saveGood(Good good) {
        HibernateUtil.add(good);
    }

    public void updateGood(Good good) {
        HibernateUtil.update(good);
    }

    public List search() {
        String hql = "select g from Good g";
        return HibernateUtil.search(hql);
    }
}
