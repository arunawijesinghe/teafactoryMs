/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.utillity;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Aruna Csw
 */
public class DatabaseConnection {
  public static  Connection conn;
  
  public static Connection getConnection()
{

  
      try {
          
          
          Class.forName("com.mysql.jdbc.Driver");
          try {
              conn=DriverManager.getConnection("jdbc:mysql://localhost/tea_info","root","admin");
       System.out.print("con ok");
              return conn;
          } catch (SQLException ex) {
              Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
          }
          
          
          
          
      } catch (ClassNotFoundException ex) {
          Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
      }
  
  return null;
  
}
   /* public static void main(String[] args) {
        getConnection();
    }*/
  
  }
    
    
    
    

