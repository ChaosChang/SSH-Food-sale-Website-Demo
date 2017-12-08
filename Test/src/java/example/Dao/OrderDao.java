/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Cart;
import example.Bean.Good;
import example.Bean.Orderinfo;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface OrderDao {
    public void saveOrder(Orderinfo order);

    public void deleteOrder(Orderinfo order);

    public List search();
    
    public void salenumberUpdate(Good good);
    
    public void cleancart(Cart cart);
}
