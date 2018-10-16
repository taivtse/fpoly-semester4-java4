/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.dao;

import java.util.List;
import poly.core.data.dao.GenericDao;
import poly.core.persistence.entity.Cart;
import poly.core.persistence.entity.CartDetail;
import poly.core.persistence.entity.Product;

/**
 *
 * @author vothanhtai
 */
public interface CartDetailDao extends GenericDao<Integer, CartDetail>{
    public List<CartDetail> getCartDetailItems(Cart cart);
    public CartDetail getByCartAndProduct(Cart cart, Product product);
}
