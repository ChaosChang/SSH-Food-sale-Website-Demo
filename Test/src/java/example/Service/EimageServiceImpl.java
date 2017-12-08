/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Eimage;
import example.Dao.EimageDao;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class EimageServiceImpl implements EimageService{
    private EimageDao eimageDao;

    public EimageDao getEimageDao() {
        return eimageDao;
    }
    
    public void setEimageDao(EimageDao eimageDao){
        this.eimageDao=eimageDao;
    }

    public void save(Eimage eimage)
    {
        eimageDao.saveEimage(eimage);
    }

    public void delete(Eimage eimage){
        eimageDao.deleteEimage(eimage);
    }

    public void update(Eimage eimage){
        eimageDao.updateEimage(eimage);
    }

    public List search(){
        List l=eimageDao.search();
        if(l!=null)
            {
                return l;
            }
            return null;
    }
}
