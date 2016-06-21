/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.dao;

import com.fims.model.User;
import com.fims.utillity.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Aruna Csw
 */
public class UserDao {
    private static Connection conn = null;
    private static Statement stm = null;
    private static  ResultSet rst = null;
    private static PreparedStatement pst=null;
    
    
 User user = new User();
        
   
    
    public User getUser(String uname, String pword) throws SQLException {
        String sql="select * from user where username='"+uname+"' and password='"+pword+"' " ;

       
        conn=DatabaseConnection.getConnection();
        stm=conn.createStatement();
        rst=stm.executeQuery(sql);
        rst.first();
        
        user.setUsername(rst.getString(1));
        user.setPassword(rst.getString(2));
        user.setRole(rst.getString(3));
        user.setUserCall(rst.getString(4));
        
        
       
        
        return user;
    }
    
   
    
    
    public User addUser(User user) throws SQLException{
    
    String sql="INSERT INTO user (username,password,role,userCallingname,nic_no,full_name,e_mail) VALUES(?,?,?,?,?,?,?)";
    conn=DatabaseConnection.getConnection();
    pst=conn.prepareStatement(sql);
    pst.setString(1, user.getUsername());
    pst.setString(2, user.getPassword());
    pst.setString(3, user.getRole());
    pst.setString(4,user.getUserCall());
    pst.setString(5,user.getNic());
    pst.setString(6,user.getFullname());
    pst.setString(7, user.getEmail());
    
    pst.executeUpdate();
    
    
    
    
    
    return user;
    
    }
 public  User getUserQValidation(String uname) throws SQLException {
        String sql="select * from user where username='"+uname+"'" ;

        conn=DatabaseConnection.getConnection();
        stm=conn.createStatement();
        rst=stm.executeQuery(sql);
        rst.first();
        
        user.setUsername(rst.getString(1));
        user.setQ_no(rst.getInt(8));
        user.setAnswer(rst.getString(9));
        
        
       
        
        return user;
    }
 
 public String getLastIndex() throws SQLException{
 
 String last="a";
 
  String sql="select * registration user where date=" ;

        conn=DatabaseConnection.getConnection();
        stm=conn.createStatement();
        rst=stm.executeQuery(sql);
        rst.first();
 
 
 return last;
 }

   



}
