/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.dao;

import com.fims.model.DailyCollection;
import com.fims.model.Transport;
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
public class TransportDao {
    
    
     static Connection conn = null;
    static PreparedStatement pst = null;
    static Statement stm=null;
    static ResultSet rst = null;

    public static Transport addTransport(Transport transport ) throws SQLException {

        String sql ="INSERT INTO transport(system_id,date,transport_id,tot_tea_weight,mon_trans_rate,tot_payment)VALUES (?,?,?,?,?,?)";
    
    
    conn =DatabaseConnection.getConnection();
    pst=conn.prepareStatement(sql);
    pst.setString(1, transport.getSystemId());
        java.sql.Date date = new java.sql.Date(transport.getTdate().getTime());

    pst.setDate(2, date);
    pst.setString(3, transport.getTransId());
    pst.setDouble(4, transport.getTotWeight());
    pst.setDouble(5, transport.getMonthRate());
    pst.setDouble(6, transport.getTotPay());
    
    pst.executeUpdate();
    return transport;
    }

    
}
