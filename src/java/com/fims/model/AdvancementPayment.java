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
public class AdvancementPayment {
    
    private String systemid;
    private Date date;
    private String apId;
    private double total_payment;
    private String status;

    public String getSystemid() {
        return systemid;
    }

    public void setSystemid(String systemid) {
        this.systemid = systemid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getApId() {
        return apId;
    }

    public void setApId(String apId) {
        this.apId = apId;
    }

    public double getTotal_payment() {
        return total_payment;
    }

    public void setTotal_payment(double total_payment) {
        this.total_payment = total_payment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
