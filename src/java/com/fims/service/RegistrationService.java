/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.service;


import com.fims.dao.CustomerDao;
import com.fims.model.Customer;
import java.sql.SQLException;

/**
 *
 * @author Aruna Csw
 */
public class RegistrationService {
     public Customer getCustomerService(Customer customer) throws SQLException{
    
         customer = new CustomerDao().addCustomer(customer);
     
           
        return customer;
    }  
    
}
