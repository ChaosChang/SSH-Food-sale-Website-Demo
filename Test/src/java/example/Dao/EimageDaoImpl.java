/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Eimage;
import example.HibernateUtil;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class EimageDaoImpl implements EimageDao{
    public void deleteEimage(Eimage eimage) {
        HibernateUtil.delete(eimage);
    }

    public void saveEimage(Eimage eimage) {
        HibernateUtil.add(eimage);
    }

    public void updateEimage(Eimage eimage) {
        HibernateUtil.update(eimage);
    }

    public List search() {
        String hql = "select e from Eimage e";
        return HibernateUtil.search(hql);
    }
}
