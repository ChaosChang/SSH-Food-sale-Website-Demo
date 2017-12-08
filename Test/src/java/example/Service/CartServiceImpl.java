/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package example.Service;

import example.Bean.Cart;
import example.Dao.CartDao;
import java.util.List;

/**
 *
 * @author T5-SKYLAKE
 */
public class CartServiceImpl implements CartService{
    private CartDao cartDao;

    public CartDao getCartDao() {
        return cartDao;
    }
    
    public void setCartDao(CartDao cartDao){
        this.cartDao=cartDao;
    }

    public void save(Cart cart)
    {
        cartDao.saveCart(cart);
    }

    public void delete(Cart cart){
        cartDao.deleteCart(cart);
    }

    public List search(){
        List l=cartDao.search();
        if(l!=null)
            {
                return l;
            }
            return null;
    }
}
