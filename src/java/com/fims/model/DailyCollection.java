/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.model;

import java.util.Date;

/**
 *
 * @author Aruna Csw
 */
public class DailyCollection {
    
    private String systemId;
    private Date  date;
    private String collectionId;
    private double totTea;
    private double deductTea;
    private double  netTea;

    public String getSystemId() {
        return systemId;
    }

    public void setSystemId(String systemId) {
        this.systemId = systemId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    
 

   

    

    public String getCollectionId() {
        return collectionId;
    }

    public void setCollectionId(String collectionId) {
        this.collectionId = collectionId;
    }

    public double getTotTea() {
        return totTea;
    }

    public void setTotTea(double totTea) {
        this.totTea = totTea;
    }

    public double getDeductTea() {
        return deductTea;
    }

    public void setDeductTea(double deductTea) {
        this.deductTea = deductTea;
    }

    public double getNetTea() {
        return netTea;
    }

    public void setNetTea(double netTea) {
        this.netTea = netTea;
    }
    
}
