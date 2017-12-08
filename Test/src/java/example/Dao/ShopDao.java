/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Shop;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface ShopDao {
    public void saveShop(Shop shop);

    public void deleteShop(Shop shop);

    public void updateShop(Shop shop);

    public List search();
}
