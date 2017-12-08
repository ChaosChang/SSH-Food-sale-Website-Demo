/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Shop;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface ShopService {

    public void save(Shop shop);

    public void delete(Shop shop);

    public void update(Shop shop);

    public List search();
}
