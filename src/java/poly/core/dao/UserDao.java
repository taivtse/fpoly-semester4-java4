/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.dao;

import poly.core.data.dao.GenericDao;
import poly.core.persistence.entity.User;

/**
 *
 * @author vothanhtai
 */
public interface UserDao  extends GenericDao<Integer, User>{
    public User getUserByUsernameAndPassword(String username, String password);
}
