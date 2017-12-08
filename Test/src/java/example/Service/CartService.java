/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Cart;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public interface CartService {
    public void save(Cart cart);

    public void delete(Cart cart);

    public List search();
}
