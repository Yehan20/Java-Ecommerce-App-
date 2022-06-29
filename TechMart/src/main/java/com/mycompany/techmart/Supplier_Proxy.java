/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.techmart;

import com.mycompany.techmartwebservices.SupplierServices;
import com.mycompany.techmartwebservices.SupplierServices_Service;

/**
 *
 * @author Yehan_NK
 */
public class Supplier_Proxy {
    
    private static SupplierServices instance = null;
    
    private Supplier_Proxy() {
    
    }
    
    public static SupplierServices getInstance(){
          if(instance==null){
              SupplierServices_Service service = new SupplierServices_Service();
              instance= service.getSupplierServicesPort();
            }
           return instance;
       }
     
}
