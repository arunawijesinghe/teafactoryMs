/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.dao;

import com.fims.model.MonthlyPayment;
import com.fims.utillity.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Aruna Csw
 */
public class MonthlyPaymentDao {

    Connection conn = null;
    PreparedStatement pst = null;

    public MonthlyPayment addMonthlyPayment(MonthlyPayment monthlyPayment) throws SQLException {

        String sql = "INSERT INTO monthly_payment (system_id,date,payment_id,Tot_weight_teaLeaves,tot_value_tea_leaves,total_tea_value,tot_ferti_value,"
                + "ad_pay,tot_deduct,tot_transport,net_payment,status) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        conn = DatabaseConnection.getConnection();
        pst = conn.prepareStatement(sql);

        pst.setString(1, monthlyPayment.getSystem_id());
        java.sql.Date date = new java.sql.Date(monthlyPayment.getMp_Date().getTime());
        pst.setDate(2, date);
        pst.setString(3, monthlyPayment.getMp_id());
        pst.setDouble(4, monthlyPayment.getTot_tl_weight());
        pst.setDouble(5, monthlyPayment.getTot_tl_val());
        pst.setDouble(6, monthlyPayment.getTot_tv());
        pst.setDouble(7, monthlyPayment.getTot_fv());
        pst.setDouble(8, monthlyPayment.getAd_pay());
        pst.setDouble(9, monthlyPayment.getTot_deduct());
        pst.setDouble(10, monthlyPayment.getTot_trans());
        pst.setDouble(11, monthlyPayment.getNet_pay());
        pst.setString(12, monthlyPayment.getStatus());
        
        pst.executeUpdate();
        
        return monthlyPayment;
        
        
    }

}
