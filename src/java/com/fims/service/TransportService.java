/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fims.service;

import com.fims.dao.TransportDao;
import com.fims.model.Transport;
import java.sql.SQLException;

/**
 *
 * @author Aruna Csw
 */
public class TransportService {
    
    public static Transport addTransportService(Transport transport) throws SQLException{
    
    transport = new TransportDao().addTransport(transport);
    
    
    return transport;
    }
    
}
