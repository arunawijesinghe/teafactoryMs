/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.controller;

import com.fims.model.TeaDeduct;
import com.fims.service.DeductionService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class AddTeaDeductServlet extends HttpServlet {

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
            String teaIssuedId = request.getParameter("teaIssuedId");
            double totWeight = Double.parseDouble(request.getParameter("tot_weight"));
            double montrate = Double.parseDouble(request.getParameter("montrate"));
            double price = Double.parseDouble(request.getParameter("price"));
            SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
            
            Date sdate =df.parse(date);
            TeaDeduct teaDeduct = new TeaDeduct();
            
            teaDeduct.setSystemId(sysid);
            teaDeduct.setDate(sdate);
            teaDeduct.setTeaIssuedId(teaIssuedId);
            teaDeduct.setTotTeaWeight(totWeight);
            teaDeduct.setMonthlyRate(montrate);
            teaDeduct.setPrice(price);
            
            DeductionService.teaDeductService(teaDeduct );
            out.print("<head><title>Success</title>"
                    + "<link rel=\"icon\" href=\"img/success.png\" type=\"image/png\">\n"
                    + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                    + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                    + "</head>"
                    + "<Body><div class=\"row\">"
                    + "<div class=\"well\" style=\"background:#\">"
                    + "<font color=\"Green\">"
                    + "<h1 align=\"center\">Data Inserted Successfully !</h1>"
                    + "<p align=\"center\"> &nbsp;&nbsp;&nbsp;&nbsp;"
                    + "<a href=\"profile.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back   <span class=\"glyphicon glyphicon-back\"></span></button></a>\n"
                    + "</p> <hr/>\n<font color=\"black\">"
                    + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                    + " </div>");

        } catch (Exception ex) {
            Logger.getLogger(AddDailyCollectionServlet.class.getName()).log(Level.SEVERE, null, ex);
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
                        + "<a href=\"deduction.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
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
