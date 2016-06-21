/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.dao;

import com.fims.model.MonthlyRate;
import com.fims.utillity.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Aruna Csw
 */
public class MonthlyRateDao {
    Connection conn=null;
    PreparedStatement pst=null;
    
    public MonthlyRate addMonthlyRate(MonthlyRate monthlyRate) throws SQLException{
    
    String sql="INSERT INTO monthly_rate(year,month,rate_id,tea_leaves_rate,tea_rate,fert_rate,transport_rate) values(?,?,?,?,?,?,?)";
    conn=DatabaseConnection.getConnection();
    pst=conn.prepareStatement(sql);
    
    pst.setString(1, monthlyRate.getYear());
    pst.setInt(2, monthlyRate.getMonth());
    pst.setString(3, monthlyRate.getRateId());
    pst.setDouble(4, monthlyRate.getTeaLeavRate());
    pst.setDouble(5, monthlyRate.getTeaRate());
    pst.setDouble(6, monthlyRate.getFertilizerRate());
    pst.setDouble(7, monthlyRate.getTransportRate());
    
    pst.executeUpdate();
    return monthlyRate;
    }
    
    
}
