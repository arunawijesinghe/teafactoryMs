/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.dao;

import com.fims.model.DailyCollection;
import com.fims.utillity.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Aruna Csw
 */
public class DailyCollectionDao {

    static Connection conn = null;
    static PreparedStatement pst = null;
    static Statement stm=null;
    static ResultSet rst = null;

    public static DailyCollection addDailyCollection(DailyCollection dailyCollection) throws SQLException {

        String sql ="INSERT INTO daily_collection(system_id,date,collection_id,total_weight,deduct_weight,net_weight)VALUES (?,?,?,?,?,?)";
    
    
    conn =DatabaseConnection.getConnection();
    pst=conn.prepareStatement(sql);
    pst.setString(1, dailyCollection.getSystemId());
        java.sql.Date date = new java.sql.Date(dailyCollection.getDate().getTime());

    pst.setDate(2, date);
    pst.setString(3, dailyCollection.getCollectionId());
    pst.setDouble(4, dailyCollection.getTotTea());
    pst.setDouble(5, dailyCollection.getDeductTea());
    pst.setDouble(6, dailyCollection.getNetTea());
    
    pst.executeUpdate();
    return dailyCollection;
    }

    public static List<DailyCollection> viewDailyCollection() throws SQLException {

        List <DailyCollection> dcollst = new ArrayList<>();


        String sql = "select * from daily_collection";
        stm = DatabaseConnection.getConnection().createStatement();
        rst = stm.executeQuery(sql);

        while (rst.next()) {

            DailyCollection dailycollection = new DailyCollection();

             dailycollection.setSystemId(rst.getString(1));
             dailycollection.setDate(rst.getDate(2));
             dailycollection.setCollectionId(rst.getString(3));
             dailycollection.setTotTea(rst.getDouble(4));
             dailycollection.setDeductTea(rst.getDouble(5));
             dailycollection.setNetTea(rst.getDouble(6));
            
             dcollst.add(dailycollection);
        }
       
       return dcollst;

    }
    public static DailyCollection getDailyCollection(DailyCollection dc){
    
    
    dc.setSystemId(dc.getSystemId());
    
    
    return dc;
    
    }

}
