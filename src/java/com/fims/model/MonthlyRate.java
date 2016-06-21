/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.model;

/**
 *
 * @author Aruna Csw
 */
public class MonthlyRate {
    
    private String year;
    private int month;
    private String rateId;
    private double teaLeavRate;
    private double teaRate;
    private double fertilizerRate;
    private double transportRate;

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

  

    public String getRateId() {
        return rateId;
    }

    public void setRateId(String rateId) {
        this.rateId = rateId;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public double getTeaLeavRate() {
        return teaLeavRate;
    }

    public void setTeaLeavRate(double teaLeavRate) {
        this.teaLeavRate = teaLeavRate;
    }

    public double getTeaRate() {
        return teaRate;
    }

    public void setTeaRate(double teaRate) {
        this.teaRate = teaRate;
    }

    public double getFertilizerRate() {
        return fertilizerRate;
    }

    public void setFertilizerRate(double fertilizerRate) {
        this.fertilizerRate = fertilizerRate;
    }

    public double getTransportRate() {
        return transportRate;
    }

    public void setTransportRate(double transportRate) {
        this.transportRate = transportRate;
    }
    
}
