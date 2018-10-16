package poly.core.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import poly.core.common.CoreConstant;
import poly.core.dao.ProductDao;
import poly.core.data.dao.impl.AbstractDao;
import poly.core.persistence.entity.Category;
import poly.core.persistence.entity.Product;

public class ProductDaoImpl extends AbstractDao<Integer, Product> implements ProductDao {

    @Override
    public List<Product> getRelated(Product product, int count) {
        List<Product> list;
        Session session = this.getSession();
        try {
            Criteria cr = session.createCriteria(this.getPersistenceClass());
            Category category = product.getCategory();
            cr.add(Restrictions.eq("category", category));
            cr.add(Restrictions.ne("id", product.getId()));
            cr.setMaxResults(count);
            list = cr.list();
        } catch (HibernateException ex) {
            throw ex;
        } finally {
            session.close();
        }
        return list;
    }
    
    public List<Product> getRelated(Product product) {
        return this.getRelated(product, 5);
    }

    @Override
    public List<Product> getBySearchName(String searchName, String sortExpression, String sortDirection, Integer offset, Integer limit) {
        List<Product> list;
        Session session = this.getSession();
        try {
            Criteria cr = session.createCriteria(this.getPersistenceClass());
            
            cr.add(Restrictions.like("name", searchName, MatchMode.ANYWHERE));

            if (sortExpression != null && sortDirection != null) {
                Order order = sortDirection.equalsIgnoreCase(CoreConstant.SORT_ASC)
                        ? Order.asc(sortExpression) : Order.desc(sortExpression);
                cr.addOrder(order);
            }

//            set start position offset
            if (offset != null && offset >= 0) {
                cr.setFirstResult(offset);
            }
//            set limit row
            if (limit != null && limit > 0) {
                cr.setMaxResults(limit);
            }

            list = cr.list();
        } catch (HibernateException ex) {
            throw ex;
        } finally {
            session.close();
        }
        return list;
    }
    
    public List<Product> getBySearchName(String searchName) {
        return this.getBySearchName(searchName, null, null, null, null);
    }
    
    @Override
    public List<Product> getByCategory(Category category, String sortExpression, String sortDirection, Integer offset, Integer limit) {
        HashMap<String, Object> condition = new HashMap<>();
        condition.put("category", category);
        return super.getByProperties(condition, sortExpression, sortDirection, offset, limit);
    }

    public List<Product> getByCategory(Category category) {
        return this.getByCategory(category, null, null, null, null);
    }

    @Override
    public List<Product> getBySearchNameAndCategory(String searchName, Category category, String sortExpression, String sortDirection, Integer offset, Integer limit) {
        List<Product> list;
        Session session = this.getSession();
        try {
            Criteria cr = session.createCriteria(this.getPersistenceClass());
            
            cr.add(Restrictions.eq("category", category));
            cr.add(Restrictions.like("name", searchName, MatchMode.ANYWHERE));

            if (sortExpression != null && sortDirection != null) {
                Order order = sortDirection.equalsIgnoreCase(CoreConstant.SORT_ASC)
                        ? Order.asc(sortExpression) : Order.desc(sortExpression);
                cr.addOrder(order);
            }

//            set start position offset
            if (offset != null && offset >= 0) {
                cr.setFirstResult(offset);
            }
//            set limit row
            if (limit != null && limit > 0) {
                cr.setMaxResults(limit);
            }

            list = cr.list();
        } catch (HibernateException ex) {
            throw ex;
        } finally {
            session.close();
        }
        return list;
    }

    public List<Product> getBySearchNameAndCategory(String searchName, Category category) {
        return this.getBySearchNameAndCategory(searchName, category, null, null, null, null);
    }
    

}
