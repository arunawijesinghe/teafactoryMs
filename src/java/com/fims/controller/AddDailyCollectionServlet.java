/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.controller;

import com.fims.dao.DailyCollectionDao;
import com.fims.model.DailyCollection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aruna Csw
 */
public class AddDailyCollectionServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("dailycollection_bill.jsp");

            String action = request.getParameter("action");
            if (null != action) {
                switch (action) {
                    case "print":
                        String system_id1 = request.getParameter("sysid");
                        String date1 = (request.getParameter("date"));
                        String collection_id1 = request.getParameter("collection_id");
                        double tot_weight1 = Double.parseDouble(request.getParameter("total_weight"));
                        double deduct_weight1 = Double.parseDouble(request.getParameter("deduct_weight"));
                        double net_weight1 = Double.parseDouble(request.getParameter("net_weight"));
                        SimpleDateFormat df1 = new SimpleDateFormat("MM/dd/yyyy");

                        Date sdate1 = df1.parse(date1);

                        out.print("<head><title>Daily Collection Bill</title>"
                                + "<link rel=\"icon\" href=\"img/success.png\" type=\"image/png\">\n"
                                + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                                + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                                + "</head>"
                                + "<Body> <table  width=\"300\" height=\"500\" bgcolor=\"grey\">\n"
                                + " <tr><td align=\"center\" colspan=\"2\">\n"
                                + "                    <h3>WIJAYA TEA FACTORY<h3>\n"
                                + "                </td></tr>\n"
                                
                                + "            <tr><td align=\"center\" colspan=\"2\">\n"
                                + "                    <b>Daily Tea Collection Bill</b>\n"
                                + "                </td></tr>\n"
                                + "            <tr></tr>\n"
                                + "            <tr></tr>\n"
                                + "            <tr>\n"
                                + "                <td>System Id:</td>\n"
                                + "                <td>"+system_id1+"</td>\n"
                                + "            </tr>\n"
                                + "            <tr>\n"
                                + "                <td>Date:</td>\n"
                                + "                <td>"+date1+"</td>\n"
                                + "            </tr>\n"
                                + "            <tr>\n"
                                + "                <td>Collection Id:</td>\n"
                                + "                <td>"+collection_id1+"</td>\n"
                                + "            </tr>\n"
                                + "            <tr>\n"
                                + "                <td>Total Weight:</td>\n"
                                + "                <td>"+tot_weight1+" Kg"+"</td>\n"
                                + "            </tr>\n"
                                + "            <tr>\n"
                                + "                <td>Deduct Weight:</td>\n"
                                + "                <td>"+deduct_weight1+" Kg"+"</td>\n"
                                + "            </tr>\n"
                                + "            <tr>\n"
                                + "                <td>Net Weight:</td>\n"
                                + "                <td>"+net_weight1+" Kg"+"</td>\n"
                                + "            </tr>\n"
                                + "            <tr><td></td></tr>\n"
                                + "            <tr><td></td></tr>\n"
                                + "            <tr>\n"
                                + "                <td></td>\n"
                                + "                <td>--------------------</td>\n"
                                + "            </tr>\n"
                                + "            <tr>\n"
                                + "                <td></td>\n"
                                + "                <td>Signature</td>\n"
                                + "            </tr>\n"
                                + "           \n"
                                + "        </table>  <a href=\"#\" onclick=\"javascript:window.print();\" >Print Bill</a>\n"
                                );

                        break;
                    case "save":
                        try {
                            processRequest(request, response);
                            String system_id = request.getParameter("sysid");
                            String date = (request.getParameter("date"));
                            String collection_id = request.getParameter("collection_id");
                            double tot_weight = Double.parseDouble(request.getParameter("total_weight"));
                            double deduct_weight = Double.parseDouble(request.getParameter("deduct_weight"));
                            double net_weight = Double.parseDouble(request.getParameter("net_weight"));
                            SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");

                            Date sdate = df.parse(date);
                            DailyCollection dailycollection = new DailyCollection();

                            dailycollection.setSystemId(system_id);
                            dailycollection.setDate(sdate);
                            dailycollection.setCollectionId(collection_id);
                            dailycollection.setTotTea(tot_weight);
                            dailycollection.setDeductTea(deduct_weight);
                            dailycollection.setNetTea(net_weight);

                            DailyCollectionDao.addDailyCollection(dailycollection);

                            /* DailyCollectionDao.viewDailyCollection();
                             request.setAttribute("dailycollection",dailycollection);*/
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
                                    + "<form method=\"post\" action=\"dailycollection_bill.jsp\">"
                                    + "<input type=\"text\" value=\""+collection_id+"\" name=\"tcolid\" readonly=\"true\">"
                                    + "<input type=\"submit\" value=\"print bill\">"
                                    
                                    + "<a href=\"profile.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back   <span class=\"glyphicon glyphicon-back\"></span></button></a>\n"
                                    + "</p> <hr/>\n<font color=\"black\">"
                                    + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                                    + " </div>");

                        } catch (Exception ex) {
                            Logger.getLogger(AddDailyCollectionServlet.class.getName()).log(Level.SEVERE, null, ex);

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
                                    + "<a href=\"dailycollection.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
                                    + "</p> <hr/>\n"
                                    + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                                    + " </div>");
                        }
                }
            }
        } catch (ParseException ex) {
            Logger.getLogger(AddDailyCollectionServlet.class.getName()).log(Level.SEVERE, null, ex);
            out.print("<head><title>Error</title>"
                                    + "<link rel=\"icon\" href=\"img/Error.png\" type=\"image/png\">\n"
                                    + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                                    + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                                    + "</head>"
                                    + "<Body><div class=\"row\">"
                                    + "<div class=\"well\" style=\"background:#cd3a3a\">"
                                    + "<font color=\"white\">"
                                    + "<h1 align=\"center\">Data Inserted Failed !</h1>"+ex
                                    + "<p align=\"center\">Please Check you inserted values<br> OR<br>"
                                    + "All Field Must Be Filled<br>"
                                    + "<a href=\"dailycollection.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
                                    + "</p> <hr/>\n"
                                    + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                                    + " </div>");
                       
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
