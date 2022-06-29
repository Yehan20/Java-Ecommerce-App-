/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.techmart;

import  com.mycompany.techmartwebservices.CustomerServices;
import com.mycompany.techmartwebservices.CustomerServices_Service;
public class Proxy {
    private static CustomerServices instance = null;
    
    private Proxy() {
    
    }
    
    public static CustomerServices getInstance() {
        if (instance == null) {
            CustomerServices_Service service = new CustomerServices_Service();  
             instance= service.getCustomerServicesPort();
        }
        return instance;
    }
}
