/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Chef;
import example.HibernateUtil;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class ChefDaoImpl implements ChefDao{
    public void deleteChef(Chef chef) {
        HibernateUtil.delete(chef);
    }

    public void saveChef(Chef chef) {
        HibernateUtil.add(chef);
    }

    public void updateChef(Chef chef) {
        HibernateUtil.update(chef);
    }

    public List search() {
        String hql = "select c from Chef c";
        return HibernateUtil.search(hql);
    }
}
