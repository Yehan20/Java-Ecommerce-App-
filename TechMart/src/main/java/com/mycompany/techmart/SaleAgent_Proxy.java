/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.techmart;

import com.mycompany.techmartwebservices.SalesAgentServices;
import com.mycompany.techmartwebservices.SalesAgentServices_Service;

/**
 *
 * @author Yehan_NK
 */
public class SaleAgent_Proxy {
    
    private static SalesAgentServices instance = null;
    
     private SaleAgent_Proxy() {
    
     }
     
     public static SalesAgentServices getInstance(){
          if(instance==null){
              SalesAgentServices_Service service = new SalesAgentServices_Service();
              instance= service.getSalesAgentServicesPort();
            }
           return instance;
       }
          
  
}
