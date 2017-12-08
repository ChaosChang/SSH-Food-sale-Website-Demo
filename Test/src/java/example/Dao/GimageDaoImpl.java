/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Gimage;
import example.HibernateUtil;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class GimageDaoImpl implements GimageDao{
    public void deleteGimage(Gimage gimage) {
        HibernateUtil.delete(gimage);
    }

    public void saveGimage(Gimage gimage) {
        HibernateUtil.add(gimage);
    }

    public void updateGimage(Gimage gimage) {
        HibernateUtil.update(gimage);
    }

    public List search() {
        String hql = "select g from Gimage g";
        return HibernateUtil.search(hql);
    }
}
