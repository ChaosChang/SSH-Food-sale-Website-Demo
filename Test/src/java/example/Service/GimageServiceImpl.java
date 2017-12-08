/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Gimage;
import example.Dao.GimageDao;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class GimageServiceImpl implements GimageService{
    private GimageDao gimageDao;

    public GimageDao getGimageDao() {
        return gimageDao;
    }
    
    public void setGimageDao(GimageDao gimageDao){
        this.gimageDao=gimageDao;
    }

    public void save(Gimage gimage)
    {
        gimageDao.saveGimage(gimage);
    }

    public void delete(Gimage gimage){
        gimageDao.deleteGimage(gimage);
    }

    public void update(Gimage gimage){
        gimageDao.updateGimage(gimage);
    }

    public List search(){
        List l=gimageDao.search();
        if(l!=null)
            {
                return l;
            }
            return null;
    }
}
