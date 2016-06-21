/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.utillity;

import javax.servlet.http.HttpSession;

/**
 *
 * @author Aruna Csw
 */
public class UtillManager {
    
    private static HttpSession session;

    public static HttpSession getSession() {
        return session;
    }

    public static void setSession(HttpSession session) {
        UtillManager.session = session;
    }
    
}
