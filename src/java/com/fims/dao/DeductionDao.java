/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.dao;

import com.fims.model.AdvancementPayment;
import com.fims.model.FertilizerDedution;
import com.fims.model.TeaDeduct;
import com.fims.utillity.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

/**
 *
 * @author Aruna Csw
 */
public class DeductionDao {

    private static Connection conn = null;
    private static PreparedStatement pst = null;
    private static ResultSet rst = null;
    private static Statement stm = null;

    public static String getMonthlyRateId() {
        Date date = new Date();
        int month = date.getMonth() + 1;
        int year = date.getYear() + 1900;

        String sm = Integer.toString(month);
        if (month < 10) {
            sm = "0" + sm;
        }
        String rateid = "R" + year + sm;

        return rateid;

    }

    public static Double getMonthTeaRate() throws SQLException {
        String rateid = getMonthlyRateId();

        String sql = "select tea_rate from monthly_rate where rate_id='" + rateid + "'";
        conn = DatabaseConnection.getConnection();
        stm = conn.createStatement();
        rst = stm.executeQuery(sql);
        double teaRate = 0.0;
        while (rst.next()) {
            teaRate = (rst.getDouble("tea_rate"));

        }
        return teaRate;

    }

    public static Double getMonthTeaLeavesRate() throws SQLException {
        String rateid = getMonthlyRateId();
        String sql = "select tea_leaves_rate from monthly_rate where rate_id='" + rateid + "'";
        conn = DatabaseConnection.getConnection();
        stm = conn.createStatement();
        rst = stm.executeQuery(sql);
        double teaLRate = 0.0;
        while (rst.next()) {
            teaLRate = (rst.getDouble("tea_leaves_rate"));

        }
        return teaLRate;

    }

    public static Double getMonthFertilizerRate() throws SQLException {
        String rateid = getMonthlyRateId();

        String sql = "select fert_rate from monthly_rate where rate_id='" + rateid + "'";
        conn = DatabaseConnection.getConnection();
        stm = conn.createStatement();
        rst = stm.executeQuery(sql);
        double teaLRate = 0.0;
        while (rst.next()) {
            teaLRate = (rst.getDouble("fert_rate"));

        }
        return teaLRate;

    }

    public static Double getMonthTransportRate() throws SQLException {
        String rateid = getMonthlyRateId();

        String sql = "select transport_rate from monthly_rate where rate_id='" + rateid + "'";
        conn = DatabaseConnection.getConnection();
        stm = conn.createStatement();
        rst = stm.executeQuery(sql);
        double teaLRate = 0.0;
        while (rst.next()) {
            teaLRate = (rst.getDouble("transport_rate"));

        }
        return teaLRate;

    }

    public static TeaDeduct setTeaDeduct(TeaDeduct teaDeduct) throws SQLException {

        String sql = "insert into tea_deduction(system_id,date,tea_issued_id,tot_tea_weight,monthly_rate,price)values(?,?,?,?,?,?)";
        conn = DatabaseConnection.getConnection();
        pst = conn.prepareStatement(sql);
        pst.setString(1, teaDeduct.getSystemId());
        java.sql.Date date = new java.sql.Date(teaDeduct.getDate().getTime());
        pst.setDate(2, date);
        pst.setString(3, teaDeduct.getTeaIssuedId());
        pst.setDouble(4, teaDeduct.getTotTeaWeight());
        pst.setDouble(5, teaDeduct.getMonthlyRate());
        pst.setDouble(6, teaDeduct.getPrice());
        pst.executeUpdate();

        return teaDeduct;
    }
    public static FertilizerDedution setFertilizerDeduct(FertilizerDedution fertilizerDedution) throws SQLException {

        String sql = "insert into fertilier_deduction(system_id,date,fsent_id,tot_f_weight,mon_f_rate,price)values(?,?,?,?,?,?)";
        conn = DatabaseConnection.getConnection();
        pst = conn.prepareStatement(sql);
        pst.setString(1, fertilizerDedution.getSystemId());
        java.sql.Date date = new java.sql.Date(fertilizerDedution.getDate().getTime());
        pst.setDate(2, date);
        pst.setString(3, fertilizerDedution.getFertiIssuedId());
        pst.setDouble(4, fertilizerDedution.getTotFertiWeight());
        pst.setDouble(5, fertilizerDedution.getMonthlyRate());
        pst.setDouble(6, fertilizerDedution.getPrice());

        pst.executeUpdate();

        return fertilizerDedution;
    }
        public static AdvancementPayment setAdvancementPayment(AdvancementPayment advancementPayment) throws SQLException {

        String sql = "insert into advancement_payment(system_id,date,ap_id,tot_pay,status)values(?,?,?,?,?)";
        conn = DatabaseConnection.getConnection();
        pst = conn.prepareStatement(sql);
        pst.setString(1, advancementPayment.getSystemid());
        java.sql.Date date = new java.sql.Date(advancementPayment.getDate().getTime());
        pst.setDate(2, date);
        pst.setString(3, advancementPayment.getApId());
        pst.setDouble(4, advancementPayment.getTotal_payment());
        String status="pending";
        pst.setString(5, advancementPayment.getStatus());

        pst.executeUpdate();

        return advancementPayment;
    }

}
