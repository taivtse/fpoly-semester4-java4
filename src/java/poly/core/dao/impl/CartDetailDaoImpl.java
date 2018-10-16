package poly.core.dao.impl;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import poly.core.dao.CartDetailDao;
import poly.core.data.dao.impl.AbstractDao;
import poly.core.persistence.entity.Cart;
import poly.core.persistence.entity.CartDetail;
import poly.core.persistence.entity.Product;

public class CartDetailDaoImpl extends AbstractDao<Integer, CartDetail> implements CartDetailDao {

    @Override
    public List<CartDetail> getCartDetailItems(Cart cart) {
        List<CartDetail> cartItems;
        Session session = this.getSession();
        try {
            Criteria cr = session.createCriteria(this.getPersistenceClass());
            cr.add(Restrictions.eq("cart", cart));
            cr.addOrder(Order.asc("id"));
            cartItems = cr.list();
        } catch (HibernateException ex) {
            throw ex;
        } finally {
            session.close();
        }
        return cartItems;
    }

    @Override
    public CartDetail getByCartAndProduct(Cart cart, Product product) {
        CartDetail cartDetail;
        Session session = this.getSession();
        try {
            Criteria cr = session.createCriteria(this.getPersistenceClass());
            cr.add(Restrictions.eq("cart", cart));
            cr.add(Restrictions.eq("product", product));
            cartDetail = (CartDetail) cr.uniqueResult();
        } catch (HibernateException ex) {
            throw ex;
        } finally {
            session.close();
        }
        return cartDetail;
    }

}
