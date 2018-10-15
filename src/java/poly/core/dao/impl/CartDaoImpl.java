package poly.core.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import poly.core.dao.CartDao;
import poly.core.data.dao.impl.AbstractDao;
import poly.core.persistence.entity.Cart;
import poly.core.persistence.entity.User;

public class CartDaoImpl extends AbstractDao<Integer, Cart> implements CartDao{

    @Override
    public Cart getCurrentCartByUser(User user) {
        Cart cart;
        Session session = this.getSession();
        try {
            Criteria cr = session.createCriteria(this.getPersistenceClass());
            cr.add(Restrictions.eq("user", user));
            cr.add(Restrictions.eq("status", 0));
            
            cart = (Cart) cr.uniqueResult();
        } catch (HibernateException ex) {
            throw ex;
        }finally{
            session.close();
        }
        return cart;
    }
    
}