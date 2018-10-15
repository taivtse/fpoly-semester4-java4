package poly.core.dao.impl;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
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

}
