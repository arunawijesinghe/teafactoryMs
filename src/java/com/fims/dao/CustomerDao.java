/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.dao;

import com.fims.model.Customer;
import com.fims.utillity.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Aruna Csw
 */
public class CustomerDao {

    Connection conn = null;
    PreparedStatement pst = null;

    public Customer addCustomer(Customer customer) {
 {

        String sql = "insert into registration(customer_type,system_id,nic,fullname,name_with_initials,gender,home_no_name,street,city1,city2,residency_phone,mobile_phone,landname,lstreet,lcity1,lcity2,lsize,brand1,reg1,brand2,reg2,brand3,reg3,brand4,reg4) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            conn = DatabaseConnection.getConnection();
            pst = conn.prepareStatement(sql);
            pst.setString(1, customer.getCustomerType());
            pst.setString(2, customer.getSystemId());
            pst.setString(3, customer.getNic());
            pst.setString(4, customer.getFullname());
            pst.setString(5, customer.getNameWithInitials());
            pst.setString(6, customer.getGender());
            pst.setString(7, customer.getHomeNo());
            pst.setString(8, customer.getStreet());
            pst.setString(9, customer.getCity1());
            pst.setString(10, customer.getCity2());
            pst.setString(11, customer.getResPhone());
            pst.setString(12, customer.getMobPhone());
            pst.setString(13, customer.getlNo());
            pst.setString(14, customer.getLstreet());
            pst.setString(15, customer.getLcity1());
            pst.setString(16, customer.getLcity2());
            pst.setString(17, customer.getLsize());
            pst.setString(18, customer.getBrand1());
            pst.setString(19, customer.getReg1());
            pst.setString(20, customer.getBrand2());
            pst.setString(21, customer.getReg2());
            pst.setString(22, customer.getBrand3());
            pst.setString(23, customer.getReg3());
            pst.setString(24, customer.getBrand4());
            pst.setString(25, customer.getReg4());

            pst.executeUpdate();
            return customer;
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

        
}
    
}