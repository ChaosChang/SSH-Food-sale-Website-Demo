/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Good;
import example.Dao.GoodDao;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class GoodServiceImpl implements GoodService{
    private GoodDao goodDao;

    public GoodDao getGoodDao() {
        return goodDao;
    }
    
    public void setGoodDao(GoodDao goodDao){
        this.goodDao=goodDao;
    }

    public void save(Good good)
    {
        goodDao.saveGood(good);
    }

    public void delete(Good good){
        goodDao.deleteGood(good);
    }

    public void update(Good good){
        goodDao.updateGood(good);
    }

    public List search(){
        List l=goodDao.search();
        if(l!=null)
            {
                return l;
            }
            return null;
    }
}
