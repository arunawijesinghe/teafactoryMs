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
public class Transport {
    
    
    private String systemId;
    private Date tdate;
    private String transId;
    private double totWeight;
    private double monthRate;
    private double totPay;

    public String getSystemId() {
        return systemId;
    }

    public void setSystemId(String systemId) {
        this.systemId = systemId;
    }

    public Date getTdate() {
        return tdate;
    }

    public void setTdate(Date tdate) {
        this.tdate = tdate;
    }

    public String getTransId() {
        return transId;
    }

    public void setTransId(String transId) {
        this.transId = transId;
    }

    public double getTotWeight() {
        return totWeight;
    }

    public void setTotWeight(double totWeight) {
        this.totWeight = totWeight;
    }

    public double getMonthRate() {
        return monthRate;
    }

    public void setMonthRate(double monthRate) {
        this.monthRate = monthRate;
    }

    public double getTotPay() {
        return totPay;
    }

    public void setTotPay(double totPay) {
        this.totPay = totPay;
    }
    
    
    
}
