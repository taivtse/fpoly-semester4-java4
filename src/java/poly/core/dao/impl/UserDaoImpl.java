package poly.core.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import poly.core.dao.UserDao;
import poly.core.data.dao.impl.AbstractDao;
import poly.core.persistence.entity.User;

public class UserDaoImpl extends AbstractDao<Integer, User> implements UserDao{

    @Override
    public User getUserByUsernameAndPassword(String username, String password){
        User entity = null;
        Session session = this.getSession();
        try {
            Criteria cr = session.createCriteria(this.getPersistenceClass());
            cr.add(Restrictions.eq("username", username));
            cr.add(Restrictions.eq("password", password));
            entity = (User) cr.uniqueResult();
        } catch (HibernateException ex) {
            throw ex;
        }finally{
            session.close();
        }
        return entity;
    }
    
}