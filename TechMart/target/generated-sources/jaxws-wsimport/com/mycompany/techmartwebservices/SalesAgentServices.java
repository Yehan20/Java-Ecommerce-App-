
package com.mycompany.techmartwebservices;

import java.util.List;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.Action;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.8
 * Generated source version: 2.2
 * 
 */
@WebService(name = "SalesAgentServices", targetNamespace = "http://techmartwebservices.mycompany.com/")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface SalesAgentServices {


    /**
     * 
     * @param branch
     * @return
     *     returns java.util.List<com.mycompany.techmartwebservices.Order>
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "viewPaidOrders", targetNamespace = "http://techmartwebservices.mycompany.com/", className = "com.mycompany.techmartwebservices.ViewPaidOrders")
    @ResponseWrapper(localName = "viewPaidOrdersResponse", targetNamespace = "http://techmartwebservices.mycompany.com/", className = "com.mycompany.techmartwebservices.ViewPaidOrdersResponse")
    @Action(input = "http://techmartwebservices.mycompany.com/SalesAgentServices/viewPaidOrdersRequest", output = "http://techmartwebservices.mycompany.com/SalesAgentServices/viewPaidOrdersResponse")
    public List<Order> viewPaidOrders(
        @WebParam(name = "branch", targetNamespace = "")
        String branch);

    /**
     * 
     * @param agentId
     * @param orderId
     * @param driverName
     * @return
     *     returns boolean
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "completeOrders", targetNamespace = "http://techmartwebservices.mycompany.com/", className = "com.mycompany.techmartwebservices.CompleteOrders")
    @ResponseWrapper(localName = "completeOrdersResponse", targetNamespace = "http://techmartwebservices.mycompany.com/", className = "com.mycompany.techmartwebservices.CompleteOrdersResponse")
    @Action(input = "http://techmartwebservices.mycompany.com/SalesAgentServices/completeOrdersRequest", output = "http://techmartwebservices.mycompany.com/SalesAgentServices/completeOrdersResponse")
    public boolean completeOrders(
        @WebParam(name = "orderId", targetNamespace = "")
        String orderId,
        @WebParam(name = "agentId", targetNamespace = "")
        String agentId,
        @WebParam(name = "driverName", targetNamespace = "")
        String driverName);

    /**
     * 
     * @param password
     * @param userid
     * @return
     *     returns com.mycompany.techmartwebservices.SalesAgent
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "loginAgent", targetNamespace = "http://techmartwebservices.mycompany.com/", className = "com.mycompany.techmartwebservices.LoginAgent")
    @ResponseWrapper(localName = "loginAgentResponse", targetNamespace = "http://techmartwebservices.mycompany.com/", className = "com.mycompany.techmartwebservices.LoginAgentResponse")
    @Action(input = "http://techmartwebservices.mycompany.com/SalesAgentServices/loginAgentRequest", output = "http://techmartwebservices.mycompany.com/SalesAgentServices/loginAgentResponse")
    public SalesAgent loginAgent(
        @WebParam(name = "userid", targetNamespace = "")
        String userid,
        @WebParam(name = "password", targetNamespace = "")
        String password);

    /**
     * 
     * @param result
     * @param amount
     * @param productid
     * @param agentname
     * @return
     *     returns boolean
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "makeStockRequest", targetNamespace = "http://techmartwebservices.mycompany.com/", className = "com.mycompany.techmartwebservices.MakeStockRequest")
    @ResponseWrapper(localName = "makeStockRequestResponse", targetNamespace = "http://techmartwebservices.mycompany.com/", className = "com.mycompany.techmartwebservices.MakeStockRequestResponse")
    @Action(input = "http://techmartwebservices.mycompany.com/SalesAgentServices/makeStockRequestRequest", output = "http://techmartwebservices.mycompany.com/SalesAgentServices/makeStockRequestResponse")
    public boolean makeStockRequest(
        @WebParam(name = "productid", targetNamespace = "")
        String productid,
        @WebParam(name = "agentname", targetNamespace = "")
        String agentname,
        @WebParam(name = "amount", targetNamespace = "")
        int amount,
        @WebParam(name = "result", targetNamespace = "")
        String result);

    /**
     * 
     * @param agentBranch
     * @return
     *     returns java.util.List<com.mycompany.techmartwebservices.Products>
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "viewProductsAgent", targetNamespace = "http://techmartwebservices.mycompany.com/", className = "com.mycompany.techmartwebservices.ViewProductsAgent")
    @ResponseWrapper(localName = "viewProductsAgentResponse", targetNamespace = "http://techmartwebservices.mycompany.com/", className = "com.mycompany.techmartwebservices.ViewProductsAgentResponse")
    @Action(input = "http://techmartwebservices.mycompany.com/SalesAgentServices/viewProductsAgentRequest", output = "http://techmartwebservices.mycompany.com/SalesAgentServices/viewProductsAgentResponse")
    public List<Products> viewProductsAgent(
        @WebParam(name = "agentBranch", targetNamespace = "")
        String agentBranch);

    /**
     * 
     * @param agentId
     * @return
     *     returns java.util.List<java.lang.Integer>
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "viewAgentStats", targetNamespace = "http://techmartwebservices.mycompany.com/", className = "com.mycompany.techmartwebservices.ViewAgentStats")
    @ResponseWrapper(localName = "viewAgentStatsResponse", targetNamespace = "http://techmartwebservices.mycompany.com/", className = "com.mycompany.techmartwebservices.ViewAgentStatsResponse")
    @Action(input = "http://techmartwebservices.mycompany.com/SalesAgentServices/viewAgentStatsRequest", output = "http://techmartwebservices.mycompany.com/SalesAgentServices/viewAgentStatsResponse")
    public List<Integer> viewAgentStats(
        @WebParam(name = "agentId", targetNamespace = "")
        String agentId);

    /**
     * 
     * @param agentId
     * @return
     *     returns java.util.List<com.mycompany.techmartwebservices.Order>
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "viewConfirmedOrders", targetNamespace = "http://techmartwebservices.mycompany.com/", className = "com.mycompany.techmartwebservices.ViewConfirmedOrders")
    @ResponseWrapper(localName = "viewConfirmedOrdersResponse", targetNamespace = "http://techmartwebservices.mycompany.com/", className = "com.mycompany.techmartwebservices.ViewConfirmedOrdersResponse")
    @Action(input = "http://techmartwebservices.mycompany.com/SalesAgentServices/viewConfirmedOrdersRequest", output = "http://techmartwebservices.mycompany.com/SalesAgentServices/viewConfirmedOrdersResponse")
    public List<Order> viewConfirmedOrders(
        @WebParam(name = "agentId", targetNamespace = "")
        String agentId);

}