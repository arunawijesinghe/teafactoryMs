/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.controller;

import com.fims.model.MonthlyPayment;
import com.fims.service.MonthlyPayementService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class AddMonthlyPaymentServlet extends HttpServlet {

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
        try {
            processRequest(request, response);
            
            PrintWriter out = response.getWriter();
            
            String sysid = request.getParameter("sysid");
            String date = request.getParameter("date");
            String payid = request.getParameter("payid");
            double tot_tl_weight = Double.parseDouble(request.getParameter("tot_tl_weight"));
            double tot_tl_value = Double.parseDouble(request.getParameter("tot_tl_value"));
            double tot_t_value = Double.parseDouble(request.getParameter("tot_t_value"));
            double tot_f_value = Double.parseDouble(request.getParameter("tot_f_value"));
            double ad_pay = Double.parseDouble(request.getParameter("ad_pay"));
            double tot_deduct = Double.parseDouble(request.getParameter("tot_deduct"));
            double tot_trans = Double.parseDouble(request.getParameter("tot_trans"));
            double net_pay = Double.parseDouble(request.getParameter("net_pay"));
            String status="pending";
            
            SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
            Date sdate =df.parse(date);
            MonthlyPayment monthlyPayment=new MonthlyPayment();
            monthlyPayment.setSystem_id(sysid);
            monthlyPayment.setMp_Date(sdate);
            monthlyPayment.setMp_id(payid);
            monthlyPayment.setTot_tl_weight(tot_tl_weight);
            monthlyPayment.setTot_tl_val(tot_tl_value);
            monthlyPayment.setTot_tv(tot_t_value);
            monthlyPayment.setTot_fv(tot_f_value);
            monthlyPayment.setAd_pay(ad_pay);
            monthlyPayment.setTot_deduct(tot_deduct);
            monthlyPayment.setTot_trans(tot_trans);
            monthlyPayment.setNet_pay(net_pay);
            monthlyPayment.setStatus(status);
            
            MonthlyPayementService.addMonthlyPayment(monthlyPayment);
            out.print("<head><title>Success</title>"
                    + "<link rel=\"icon\" href=\"img/success.png\" type=\"image/png\">\n"
                    + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                    + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                    + "</head>"
                    + "<Body><div class=\"row\">"
                    + "<div class=\"well\" style=\"background:#\">"
                    + "<font color=\"Green\">"
                    + "<h1 align=\"center\">Monthly Payment Sent to Approval Successfully !</h1>"
                    + "<p align=\"center\"> &nbsp;&nbsp;&nbsp;&nbsp;"
                    + "<a href=\"profile.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back   <span class=\"glyphicon glyphicon-back\"></span></button></a>\n"
                    + "</p> <hr/>\n<font color=\"black\">"
                    + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                    + " </div>");
        } catch (ParseException | SQLException ex) {
            Logger.getLogger(AddMonthlyPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
            try (PrintWriter out = response.getWriter()) {

                out.print("<head><title>Error</title>"
                        + "<link rel=\"icon\" href=\"img/Error.png\" type=\"image/png\">\n"
                        + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                        + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                        + "</head>"
                        + "<Body><div class=\"row\">"
                        + "<div class=\"well\" style=\"background:#cd3a3a\">"
                        + "<font color=\"white\">"
                        + "<h1 align=\"center\">Data Inserted Failed !</h1>"
                        + "<p align=\"center\">Please Check you inserted values<br> OR<br>"
                        + "All Field Must Be Filled<br>"
                        + "<a href=\"profile.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
                        + "</p> <hr/>\n"
                        + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                        + " </div>");
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
