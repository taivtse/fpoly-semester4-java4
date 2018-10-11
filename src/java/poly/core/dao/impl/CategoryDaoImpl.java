package poly.core.dao.impl;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import poly.core.dao.CategoryDao;
import poly.core.data.dao.impl.AbstractDao;
import poly.core.persistence.entity.Category;

public class CategoryDaoImpl extends AbstractDao<Integer, Category> implements CategoryDao{

    @Override
    public List<Category> getRootCategory() {
        List<Category> list;
        Session session = this.getSession();
        try {
            Criteria cr = session.createCriteria(this.getPersistenceClass());
            cr.add(Restrictions.isNull("parentCategory"));
            list = cr.list();
        }catch (HibernateException ex){
            throw ex;
        }finally{
            session.close();
        }
        return list;
    }

    @Override
    public List<Category> getChildCategory() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}