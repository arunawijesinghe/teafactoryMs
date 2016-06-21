/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.service;

import com.fims.dao.UserDao;
import com.fims.model.User;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Aruna Csw
 */
public class LoginService {
    
    
    public User getUserService(String uname,String pword) throws SQLException{
    
      User user = new UserDao().getUser(uname, pword);
      return user;
           
        
    }  

    public static User addUserService(User user) throws SQLException{
    
       user = new UserDao().addUser(user);
      return user;
           
        
    }  
    
   

    
    
}
