
package com.mycompany.techmartwebservices;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.8
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "SupplierServices", targetNamespace = "http://techmartwebservices.mycompany.com/", wsdlLocation = "http://localhost:8080/TechMartWebServices/SupplierServices?wsdl")
public class SupplierServices_Service
    extends Service
{

    private final static URL SUPPLIERSERVICES_WSDL_LOCATION;
    private final static WebServiceException SUPPLIERSERVICES_EXCEPTION;
    private final static QName SUPPLIERSERVICES_QNAME = new QName("http://techmartwebservices.mycompany.com/", "SupplierServices");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://localhost:8080/TechMartWebServices/SupplierServices?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        SUPPLIERSERVICES_WSDL_LOCATION = url;
        SUPPLIERSERVICES_EXCEPTION = e;
    }

    public SupplierServices_Service() {
        super(__getWsdlLocation(), SUPPLIERSERVICES_QNAME);
    }

    public SupplierServices_Service(WebServiceFeature... features) {
        super(__getWsdlLocation(), SUPPLIERSERVICES_QNAME, features);
    }

    public SupplierServices_Service(URL wsdlLocation) {
        super(wsdlLocation, SUPPLIERSERVICES_QNAME);
    }

    public SupplierServices_Service(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, SUPPLIERSERVICES_QNAME, features);
    }

    public SupplierServices_Service(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public SupplierServices_Service(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns SupplierServices
     */
    @WebEndpoint(name = "SupplierServicesPort")
    public SupplierServices getSupplierServicesPort() {
        return super.getPort(new QName("http://techmartwebservices.mycompany.com/", "SupplierServicesPort"), SupplierServices.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns SupplierServices
     */
    @WebEndpoint(name = "SupplierServicesPort")
    public SupplierServices getSupplierServicesPort(WebServiceFeature... features) {
        return super.getPort(new QName("http://techmartwebservices.mycompany.com/", "SupplierServicesPort"), SupplierServices.class, features);
    }

    private static URL __getWsdlLocation() {
        if (SUPPLIERSERVICES_EXCEPTION!= null) {
            throw SUPPLIERSERVICES_EXCEPTION;
        }
        return SUPPLIERSERVICES_WSDL_LOCATION;
    }

}