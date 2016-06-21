/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.service;

import com.fims.dao.MonthlyRateDao;
import com.fims.model.MonthlyRate;
import java.sql.SQLException;

/**
 *
 * @author Aruna Csw
 */
public class MonthlyRateService {
     public MonthlyRate setMonthlyRate(MonthlyRate monthlyRate) throws SQLException{
    
         monthlyRate = new MonthlyRateDao().addMonthlyRate(monthlyRate);
     
           
        return monthlyRate;
    }  
    
}
