
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
@WebServiceClient(name = "AdminServices", targetNamespace = "http://techmartwebservices.mycompany.com/", wsdlLocation = "http://localhost:8080/TechMartWebServices/AdminServices?wsdl")
public class AdminServices_Service
    extends Service
{

    private final static URL ADMINSERVICES_WSDL_LOCATION;
    private final static WebServiceException ADMINSERVICES_EXCEPTION;
    private final static QName ADMINSERVICES_QNAME = new QName("http://techmartwebservices.mycompany.com/", "AdminServices");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://localhost:8080/TechMartWebServices/AdminServices?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        ADMINSERVICES_WSDL_LOCATION = url;
        ADMINSERVICES_EXCEPTION = e;
    }

    public AdminServices_Service() {
        super(__getWsdlLocation(), ADMINSERVICES_QNAME);
    }

    public AdminServices_Service(WebServiceFeature... features) {
        super(__getWsdlLocation(), ADMINSERVICES_QNAME, features);
    }

    public AdminServices_Service(URL wsdlLocation) {
        super(wsdlLocation, ADMINSERVICES_QNAME);
    }

    public AdminServices_Service(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, ADMINSERVICES_QNAME, features);
    }

    public AdminServices_Service(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public AdminServices_Service(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns AdminServices
     */
    @WebEndpoint(name = "AdminServicesPort")
    public AdminServices getAdminServicesPort() {
        return super.getPort(new QName("http://techmartwebservices.mycompany.com/", "AdminServicesPort"), AdminServices.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns AdminServices
     */
    @WebEndpoint(name = "AdminServicesPort")
    public AdminServices getAdminServicesPort(WebServiceFeature... features) {
        return super.getPort(new QName("http://techmartwebservices.mycompany.com/", "AdminServicesPort"), AdminServices.class, features);
    }

    private static URL __getWsdlLocation() {
        if (ADMINSERVICES_EXCEPTION!= null) {
            throw ADMINSERVICES_EXCEPTION;
        }
        return ADMINSERVICES_WSDL_LOCATION;
    }

}
