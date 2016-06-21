/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.controller;

import com.fims.utillity.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aruna Csw
 */
public class ApproveMonthlyPaymentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        String ap_id = request.getParameter("mp_id");
        String payment = request.getParameter("pay");

        if (null != action) {
            switch (action) {
                case "Approve":
                    Statement stm;
                    String Sql = "UPDATE `monthly_payment` SET `status`='Approved' WHERE `payment_id`='" + ap_id + "'";
                    try {
                        stm = DatabaseConnection.getConnection().createStatement();
                        stm.executeUpdate(Sql);
                        out.print(ap_id + " Approved");
                      //  out.print(ap_id);

                    } catch (SQLException ex) {
                        Logger.getLogger(ApproveDailyJobServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    break;
                case "Reject":
                    Statement stm1;
                    String Sql1 = "UPDATE `monthly_payment` SET `status`='Rejected' WHERE `payment_id`='" + ap_id + "'";
                    try {
                        stm1 = DatabaseConnection.getConnection().createStatement();
                        stm1.executeUpdate(Sql1);
                        out.print(ap_id + " Rejected");
                      //  out.print(ap_id);

                    } catch (SQLException ex) {
                        Logger.getLogger(ApproveDailyJobServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    break;
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
