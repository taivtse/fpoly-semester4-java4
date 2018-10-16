/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.dao;

import java.util.List;
import poly.core.data.dao.GenericDao;
import poly.core.persistence.entity.Invoice;
import poly.core.persistence.entity.User;

/**
 *
 * @author vothanhtai
 */
public interface InvoiceDao  extends GenericDao<Integer, Invoice>{
    public List<Invoice> getInvoicesByUser(User user);
}
