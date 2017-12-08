/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Shop;
import example.Dao.ShopDao;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class ShopServiceImpl implements ShopService {

    private ShopDao shopDao;

    public ShopDao getShopDao() {
        return shopDao;
    }
    
    public void setShopDao(ShopDao shopDao){
        this.shopDao=shopDao;
    }

    public void save(Shop shop)
    {
        shopDao.saveShop(shop);
    }

    public void delete(Shop shop){
        shopDao.deleteShop(shop);
    }

    public void update(Shop shop){
        shopDao.updateShop(shop);
    }

    public List search(){
        List l=shopDao.search();
        if(l!=null)
            {
                return l;
            }
            return null;
    }
}
