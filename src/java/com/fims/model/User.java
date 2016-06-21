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
public class User {
    private String username;
    private String password;
    private String role;
    private String userCall;
    private String nic;
    private String fullname;
    private String email;
    private int q_no;
    private String answer;

    public int getQ_no() {
        return q_no;
    }

    public void setQ_no(int q_no) {
        this.q_no = q_no;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
    

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUserCall() {
        return userCall;
    }

    public void setUserCall(String userCall) {
        this.userCall = userCall;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
