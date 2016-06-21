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
public class TeaDeduct {
    private String systemId;
    private Date date;
    private String teaIssuedId;
    private double totTeaWeight;
    private double monthlyRate;
    private double price;

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

    public String getTeaIssuedId() {
        return teaIssuedId;
    }

    public void setTeaIssuedId(String teaIssuedId) {
        this.teaIssuedId = teaIssuedId;
    }

    public double getTotTeaWeight() {
        return totTeaWeight;
    }

    public void setTotTeaWeight(double totTeaWeight) {
        this.totTeaWeight = totTeaWeight;
    }

    public double getMonthlyRate() {
        return monthlyRate;
    }

    public void setMonthlyRate(double monthlyRate) {
        this.monthlyRate = monthlyRate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
    
}
