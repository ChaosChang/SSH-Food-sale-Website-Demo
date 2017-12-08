/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Chef;
import example.Dao.ChefDao;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class ChefServiceImpl implements ChefService{
    private ChefDao chefDao;

    public ChefDao getChefDao() {
        return chefDao;
    }
    
    public void setChefDao(ChefDao chefDao){
        this.chefDao=chefDao;
    }

    public void save(Chef chef)
    {
        chefDao.saveChef(chef);
    }

    public void delete(Chef chef){
        chefDao.deleteChef(chef);
    }

    public void update(Chef chef){
        chefDao.updateChef(chef);
    }

    public List search(){
        List l=chefDao.search();
        if(l!=null)
            {
                return l;
            }
            return null;
    }
}
