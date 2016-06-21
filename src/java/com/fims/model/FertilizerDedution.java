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
public class FertilizerDedution {
     private String systemId;
    private Date date;
    private String fertiIssuedId;
    private double totFertiWeight;
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

    public String getFertiIssuedId() {
        return fertiIssuedId;
    }

    public void setFertiIssuedId(String fertiIssuedId) {
        this.fertiIssuedId = fertiIssuedId;
    }

    public double getTotFertiWeight() {
        return totFertiWeight;
    }

    public void setTotFertiWeight(double totFertiWeight) {
        this.totFertiWeight = totFertiWeight;
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
