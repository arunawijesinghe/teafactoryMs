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
public class MonthlyPayment {

    private String system_id;
    private Date mp_Date;
    private String mp_id;
    private double tot_tl_weight;
    private double tot_tl_val;
    private double tot_tv;
    private double tot_fv;
    private double ad_pay;
    private double tot_deduct;
    private double tot_trans;
    private double net_pay;
    private String status;

    public double getTot_tl_val() {
        return tot_tl_val;
    }

    public void setTot_tl_val(double tot_tl_val) {
        this.tot_tl_val = tot_tl_val;
    }

    public String getSystem_id() {
        return system_id;
    }

    public void setSystem_id(String system_id) {
        this.system_id = system_id;
    }

    public Date getMp_Date() {
        return mp_Date;
    }

    public void setMp_Date(Date mp_Date) {
        this.mp_Date = mp_Date;
    }

    public String getMp_id() {
        return mp_id;
    }

    public void setMp_id(String mp_id) {
        this.mp_id = mp_id;
    }

    public double getTot_tl_weight() {
        return tot_tl_weight;
    }

    public void setTot_tl_weight(double tot_tl_weight) {
        this.tot_tl_weight = tot_tl_weight;
    }

    public double getTot_tv() {
        return tot_tv;
    }

    public void setTot_tv(double tot_tv) {
        this.tot_tv = tot_tv;
    }

    public double getTot_fv() {
        return tot_fv;
    }

    public void setTot_fv(double tot_fv) {
        this.tot_fv = tot_fv;
    }

    public double getAd_pay() {
        return ad_pay;
    }

    public void setAd_pay(double ad_pay) {
        this.ad_pay = ad_pay;
    }

    public double getTot_deduct() {
        return tot_deduct;
    }

    public void setTot_deduct(double tot_deduct) {
        this.tot_deduct = tot_deduct;
    }

    public double getTot_trans() {
        return tot_trans;
    }

    public void setTot_trans(double tot_trans) {
        this.tot_trans = tot_trans;
    }

    public double getNet_pay() {
        return net_pay;
    }

    public void setNet_pay(double net_pay) {
        this.net_pay = net_pay;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
