/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.service;

import com.fims.dao.DeductionDao;
import com.fims.model.AdvancementPayment;
import com.fims.model.FertilizerDedution;
import com.fims.model.TeaDeduct;
import java.sql.SQLException;

/**
 *
 * @author Aruna Csw
 */
public class DeductionService {
    
    public static TeaDeduct teaDeductService(TeaDeduct teaDeduct) throws SQLException{
    
    teaDeduct = new DeductionDao().setTeaDeduct(teaDeduct);
    
    
    return teaDeduct;
    }
    public static FertilizerDedution fertiDeductService(FertilizerDedution fertilizerDedution) throws SQLException{
    
    fertilizerDedution = new DeductionDao().setFertilizerDeduct(fertilizerDedution);
    
    
    return fertilizerDedution;
    }
    public static AdvancementPayment advancementPayService(AdvancementPayment advancementPayment) throws SQLException{
    
    advancementPayment = new DeductionDao().setAdvancementPayment(advancementPayment);
    
    
    return advancementPayment;
    }
}
