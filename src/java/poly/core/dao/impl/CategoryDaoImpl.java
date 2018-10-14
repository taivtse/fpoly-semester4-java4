package poly.core.dao.impl;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import poly.core.dao.CategoryDao;
import poly.core.data.dao.impl.AbstractDao;
import poly.core.persistence.entity.Category;

public class CategoryDaoImpl extends AbstractDao<Integer, Category> implements CategoryDao {

    @Override
    public List<Category> getRootCategory() {
        List<Category> list;
        Session session = this.getSession();
        try {
            Criteria cr = session.createCriteria(this.getPersistenceClass());
            cr.addOrder(Order.asc("sortOrder"));
            cr.add(Restrictions.isNull("parentCategory"));
            list = cr.list();
        } catch (HibernateException ex) {
            throw ex;
        } finally {
            session.close();
        }
        return list;
    }

    @Override
    public List<Category> getChildCategory(Category parentCategory) {
        List<Category> list;
        Session session = this.getSession();
        try {
            Criteria cr = session.createCriteria(this.getPersistenceClass());
            cr.addOrder(Order.asc("sortOrder"));
            cr.add(Restrictions.eq("parentCategory", parentCategory));
            list = cr.list();
        } catch (HibernateException ex) {
            throw ex;
        } finally {
            session.close();
        }
        return list;
    }

    @Override
    public List<Category> getAllChildCategory() {
        List<Category> list = new ArrayList<>();
        Session session = this.getSession();
        try {
            List<Category> rootList = this.getRootCategory();
            for (Category rootCategory : rootList) {
                Criteria cr = session.createCriteria(this.getPersistenceClass());
                cr.addOrder(Order.asc("sortOrder"));
                cr.add(Restrictions.eq("parentCategory", rootCategory));
                
                list.addAll(cr.list());
            }
        } catch (HibernateException ex) {
            throw ex;
        } finally {
            session.close();
        }
        return list;
    }
}
