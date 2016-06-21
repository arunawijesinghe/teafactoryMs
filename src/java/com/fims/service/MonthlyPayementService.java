/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.service;

import com.fims.dao.MonthlyPaymentDao;
import com.fims.model.MonthlyPayment;
import java.sql.SQLException;

/**
 *
 * @author Aruna Csw
 */
public class MonthlyPayementService {
    public static MonthlyPayment addMonthlyPayment(MonthlyPayment monthlyPayment) throws SQLException{
    
    monthlyPayment=new MonthlyPaymentDao().addMonthlyPayment(monthlyPayment);
    
    
    
    return monthlyPayment;
    }
    
}
