/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.dao;

import java.util.List;
import poly.core.data.dao.GenericDao;
import poly.core.persistence.entity.Product;

/**
 *
 * @author vothanhtai
 */
public interface ProductDao  extends GenericDao<Integer, Product>{
    public List<Product> getRelated(Product product, int count);
}
