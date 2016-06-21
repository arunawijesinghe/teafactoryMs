/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.controller;

import com.fims.model.Customer;
import com.fims.service.RegistrationService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aruna Csw
 */
public class RegistrationServlet extends HttpServlet {

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
        try {
            PrintWriter out = response.getWriter();
            
            Customer customer = new Customer();
            
            String customerType = request.getParameter("cusType");
            
            String sysId = request.getParameter("sysid");
            String nic = request.getParameter("nic");
            String gender = request.getParameter("gender");
            
            String fullName = request.getParameter("fullName");
            String namewithinit = request.getParameter("nwi");
            String homeno = request.getParameter("homeNo");
            String street = request.getParameter("hStreet");
            String city1 = request.getParameter("hCity1");
            String city2 = request.getParameter("hCity2");
            String resPhone = request.getParameter("resPhone");
            String mobPhone = request.getParameter("mobPhone");
            String landname = request.getParameter("landNo");
            String lstreet = request.getParameter("lStreet");
            String lcity1 = request.getParameter("lCity1");
            String lcity2 = request.getParameter("lCity2");
            
            String lsize = request.getParameter("lSize");
            String brand1 = request.getParameter("brand1");
            String reg1 = request.getParameter("regNo1");
            String brand2 = request.getParameter("brand2");
            String reg2 = request.getParameter("regNo2");
            String brand3 = request.getParameter("brand3");
            String reg3 = request.getParameter("regNo3");
            String brand4 = request.getParameter("brand4");
            String reg4 = request.getParameter("regNo4");
           try{ 
            int nic1=Integer.parseInt(nic.substring(0, 9));
            if(nic.substring(9,10).equals("v") || nic.substring(9,10).equals("x") ){

            // out.print(homeno+" "+ street+""+city1+""+city2+""+resPhone+""+mobPhone);
            customer.setCustomerType(customerType);
            customer.setNic(nic);
            customer.setSystemId(sysId);
            customer.setFullname(fullName);
            customer.setNameWithInitials(namewithinit);
            customer.setGender(gender);
            customer.setHomeNo(homeno);
            customer.setStreet(street);
            customer.setCity1(city1);
            customer.setCity2(city2);
            customer.setResPhone(resPhone);
            customer.setMobPhone(mobPhone);
            customer.setlNo(landname);
            customer.setLstreet(lstreet);
            customer.setLcity1(lcity1);
            customer.setLcity2(lcity2);
            customer.setLsize(lsize);
            customer.setBrand1(brand1);
            customer.setBrand2(brand2);
            customer.setBrand3(brand3);
            customer.setBrand4(brand4);
            customer.setReg1(reg1);
            customer.setReg2(reg2);
            customer.setReg3(reg3);
            customer.setReg4(reg4);
            
            new RegistrationService().getCustomerService(customer);
            
            out.print("<head><title>Success</title>"
                    + "<link rel=\"icon\" href=\"img/success.png\" type=\"image/png\">\n"
                    + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                    + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                    + "</head>"
                    + "<Body><div class=\"row\">"
                    + "<div class=\"well\" style=\"background:#\">"
                    + "<font color=\"Green\">"
                    + "<h1 align=\"center\">User Registered Successfully !</h1>"
                    + "<p align=\"center\"> &nbsp;&nbsp;&nbsp;&nbsp;"
                    + "<a href=\"profile.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back   <span class=\"glyphicon glyphicon-back\"></span></button></a>\n"
                    + "</p> <hr/>\n<font color=\"black\">"
                    + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                    + " </div>");}else{
                out.print("<head><title>Error</title>"
                        + "<link rel=\"icon\" href=\"img/Error.png\" type=\"image/png\">\n"
                        + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                        + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                        + "</head>"
                        + "<Body><div class=\"row\">"
                        + "<div class=\"well\" style=\"background:#cd3a3a\">"
                        + "<font color=\"white\">"
                        + "<h1 align=\"center\">Invalid NIC no !</h1>"
                        + "<p align=\"center\">Please Check Your Typed Data &nbsp;&nbsp;&nbsp;&nbsp;"
                        + "<a href=\"registration.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
                        + "</p> <hr/>\n"
                        + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                        + " </div>");
                
            }}catch(Exception e){
             try (PrintWriter out1 = response.getWriter()) {
                
                out1.print("<head><title>Error</title>"
                        + "<link rel=\"icon\" href=\"img/Error.png\" type=\"image/png\">\n"
                        + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                        + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                        + "</head>"
                        + "<Body><div class=\"row\">"
                        + "<div class=\"well\" style=\"background:#cd3a3a\">"
                        + "<font color=\"white\">"
                        + "<h1 align=\"center\">Invalid NIC No !</h1>"
                        + "<p align=\"center\">Please Check Your Typed Data &nbsp;&nbsp;&nbsp;&nbsp;"
                        + "<a href=\"registration.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
                        + "</p> <hr/>\n"
                        + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                        + " </div>");
            }}
        } catch (Exception e) {
            try (PrintWriter out = response.getWriter()) {
                
                out.print("<head><title>Error</title>"
                        + "<link rel=\"icon\" href=\"img/Error.png\" type=\"image/png\">\n"
                        + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                        + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                        + "</head>"
                        + "<Body><div class=\"row\">"
                        + "<div class=\"well\" style=\"background:#cd3a3a\">"
                        + "<font color=\"white\">"
                        + "<h1 align=\"center\">User Registration Faild !</h1>"
                        + "<p align=\"center\">Please Check Your Typed Data &nbsp;&nbsp;&nbsp;&nbsp;"
                        + "<a href=\"registration.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
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
