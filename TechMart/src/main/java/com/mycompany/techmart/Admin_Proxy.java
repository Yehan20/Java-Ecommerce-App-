/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.techmart;

import com.mycompany.techmartwebservices.AdminServices;
import com.mycompany.techmartwebservices.AdminServices_Service;

/**
 *
 * @author Yehan_NK
 */
public class Admin_Proxy {
     private static AdminServices instance = null;
    
     private Admin_Proxy() {
    
     }
     
     public static AdminServices getInstance(){
              if(instance==null){
                   AdminServices_Service service = new AdminServices_Service();
                   instance= service.getAdminServicesPort();
              }
       return instance;
     }
                    
                         
}
