/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.dao;

import java.util.List;
import poly.core.data.dao.GenericDao;
import poly.core.persistence.entity.Category;

/**
 *
 * @author vothanhtai
 */
public interface CategoryDao  extends GenericDao<Integer, Category>{
    public List<Category> getRootCategory();
    public List<Category> getChildCategory(Category parentCategory);
    public List<Category> getAllChildCategory();
}
