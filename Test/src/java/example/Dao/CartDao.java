/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Dao;

import example.Bean.Cart;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface CartDao {
    public void saveCart(Cart cart);

    public void deleteCart(Cart cart);

    public List search();
}
