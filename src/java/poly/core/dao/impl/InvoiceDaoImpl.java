package poly.core.dao.impl;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import poly.core.dao.InvoiceDao;
import poly.core.data.dao.impl.AbstractDao;
import poly.core.persistence.entity.Invoice;
import poly.core.persistence.entity.User;

public class InvoiceDaoImpl extends AbstractDao<Integer, Invoice> implements InvoiceDao{

    @Override
    public List<Invoice> getInvoicesByUser(User user) {
        List<Invoice> list = null;
        Session session = this.getSession();
        try {
            Criteria cr = session.createCriteria(this.getPersistenceClass());
            cr.add(Restrictions.eq("user", user));
            list = cr.list();
        } catch (HibernateException ex) {
            throw ex;
        } finally {
            session.close();
        }

        return list;
    }

}