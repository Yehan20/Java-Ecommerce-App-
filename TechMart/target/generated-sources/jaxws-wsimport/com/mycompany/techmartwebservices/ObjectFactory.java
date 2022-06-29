
package com.mycompany.techmartwebservices;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the com.mycompany.techmartwebservices package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _MakeStockRequestResponse_QNAME = new QName("http://techmartwebservices.mycompany.com/", "makeStockRequestResponse");
    private final static QName _ViewProductsAgentResponse_QNAME = new QName("http://techmartwebservices.mycompany.com/", "viewProductsAgentResponse");
    private final static QName _ViewConfirmedOrdersResponse_QNAME = new QName("http://techmartwebservices.mycompany.com/", "viewConfirmedOrdersResponse");
    private final static QName _ViewPaidOrdersResponse_QNAME = new QName("http://techmartwebservices.mycompany.com/", "viewPaidOrdersResponse");
    private final static QName _ViewPaidOrders_QNAME = new QName("http://techmartwebservices.mycompany.com/", "viewPaidOrders");
    private final static QName _CompleteOrdersResponse_QNAME = new QName("http://techmartwebservices.mycompany.com/", "completeOrdersResponse");
    private final static QName _ViewAgentStatsResponse_QNAME = new QName("http://techmartwebservices.mycompany.com/", "viewAgentStatsResponse");
    private final static QName _ViewProductsAgent_QNAME = new QName("http://techmartwebservices.mycompany.com/", "viewProductsAgent");
    private final static QName _CompleteOrders_QNAME = new QName("http://techmartwebservices.mycompany.com/", "completeOrders");
    private final static QName _ViewConfirmedOrders_QNAME = new QName("http://techmartwebservices.mycompany.com/", "viewConfirmedOrders");
    private final static QName _LoginAgent_QNAME = new QName("http://techmartwebservices.mycompany.com/", "loginAgent");
    private final static QName _LoginAgentResponse_QNAME = new QName("http://techmartwebservices.mycompany.com/", "loginAgentResponse");
    private final static QName _ViewAgentStats_QNAME = new QName("http://techmartwebservices.mycompany.com/", "viewAgentStats");
    private final static QName _MakeStockRequest_QNAME = new QName("http://techmartwebservices.mycompany.com/", "makeStockRequest");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: com.mycompany.techmartwebservices
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link ViewPaidOrdersResponse }
     * 
     */
    public ViewPaidOrdersResponse createViewPaidOrdersResponse() {
        return new ViewPaidOrdersResponse();
    }

    /**
     * Create an instance of {@link MakeStockRequestResponse }
     * 
     */
    public MakeStockRequestResponse createMakeStockRequestResponse() {
        return new MakeStockRequestResponse();
    }

    /**
     * Create an instance of {@link ViewProductsAgentResponse }
     * 
     */
    public ViewProductsAgentResponse createViewProductsAgentResponse() {
        return new ViewProductsAgentResponse();
    }

    /**
     * Create an instance of {@link ViewConfirmedOrdersResponse }
     * 
     */
    public ViewConfirmedOrdersResponse createViewConfirmedOrdersResponse() {
        return new ViewConfirmedOrdersResponse();
    }

    /**
     * Create an instance of {@link ViewConfirmedOrders }
     * 
     */
    public ViewConfirmedOrders createViewConfirmedOrders() {
        return new ViewConfirmedOrders();
    }

    /**
     * Create an instance of {@link LoginAgent }
     * 
     */
    public LoginAgent createLoginAgent() {
        return new LoginAgent();
    }

    /**
     * Create an instance of {@link LoginAgentResponse }
     * 
     */
    public LoginAgentResponse createLoginAgentResponse() {
        return new LoginAgentResponse();
    }

    /**
     * Create an instance of {@link ViewAgentStats }
     * 
     */
    public ViewAgentStats createViewAgentStats() {
        return new ViewAgentStats();
    }

    /**
     * Create an instance of {@link MakeStockRequest }
     * 
     */
    public MakeStockRequest createMakeStockRequest() {
        return new MakeStockRequest();
    }

    /**
     * Create an instance of {@link ViewPaidOrders }
     * 
     */
    public ViewPaidOrders createViewPaidOrders() {
        return new ViewPaidOrders();
    }

    /**
     * Create an instance of {@link CompleteOrdersResponse }
     * 
     */
    public CompleteOrdersResponse createCompleteOrdersResponse() {
        return new CompleteOrdersResponse();
    }

    /**
     * Create an instance of {@link ViewAgentStatsResponse }
     * 
     */
    public ViewAgentStatsResponse createViewAgentStatsResponse() {
        return new ViewAgentStatsResponse();
    }

    /**
     * Create an instance of {@link ViewProductsAgent }
     * 
     */
    public ViewProductsAgent createViewProductsAgent() {
        return new ViewProductsAgent();
    }

    /**
     * Create an instance of {@link CompleteOrders }
     * 
     */
    public CompleteOrders createCompleteOrders() {
        return new CompleteOrders();
    }

    /**
     * Create an instance of {@link Products }
     * 
     */
    public Products createProducts() {
        return new Products();
    }

    /**
     * Create an instance of {@link SalesAgent }
     * 
     */
    public SalesAgent createSalesAgent() {
        return new SalesAgent();
    }

    /**
     * Create an instance of {@link Order }
     * 
     */
    public Order createOrder() {
        return new Order();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MakeStockRequestResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://techmartwebservices.mycompany.com/", name = "makeStockRequestResponse")
    public JAXBElement<MakeStockRequestResponse> createMakeStockRequestResponse(MakeStockRequestResponse value) {
        return new JAXBElement<MakeStockRequestResponse>(_MakeStockRequestResponse_QNAME, MakeStockRequestResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ViewProductsAgentResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://techmartwebservices.mycompany.com/", name = "viewProductsAgentResponse")
    public JAXBElement<ViewProductsAgentResponse> createViewProductsAgentResponse(ViewProductsAgentResponse value) {
        return new JAXBElement<ViewProductsAgentResponse>(_ViewProductsAgentResponse_QNAME, ViewProductsAgentResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ViewConfirmedOrdersResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://techmartwebservices.mycompany.com/", name = "viewConfirmedOrdersResponse")
    public JAXBElement<ViewConfirmedOrdersResponse> createViewConfirmedOrdersResponse(ViewConfirmedOrdersResponse value) {
        return new JAXBElement<ViewConfirmedOrdersResponse>(_ViewConfirmedOrdersResponse_QNAME, ViewConfirmedOrdersResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ViewPaidOrdersResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://techmartwebservices.mycompany.com/", name = "viewPaidOrdersResponse")
    public JAXBElement<ViewPaidOrdersResponse> createViewPaidOrdersResponse(ViewPaidOrdersResponse value) {
        return new JAXBElement<ViewPaidOrdersResponse>(_ViewPaidOrdersResponse_QNAME, ViewPaidOrdersResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ViewPaidOrders }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://techmartwebservices.mycompany.com/", name = "viewPaidOrders")
    public JAXBElement<ViewPaidOrders> createViewPaidOrders(ViewPaidOrders value) {
        return new JAXBElement<ViewPaidOrders>(_ViewPaidOrders_QNAME, ViewPaidOrders.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CompleteOrdersResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://techmartwebservices.mycompany.com/", name = "completeOrdersResponse")
    public JAXBElement<CompleteOrdersResponse> createCompleteOrdersResponse(CompleteOrdersResponse value) {
        return new JAXBElement<CompleteOrdersResponse>(_CompleteOrdersResponse_QNAME, CompleteOrdersResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ViewAgentStatsResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://techmartwebservices.mycompany.com/", name = "viewAgentStatsResponse")
    public JAXBElement<ViewAgentStatsResponse> createViewAgentStatsResponse(ViewAgentStatsResponse value) {
        return new JAXBElement<ViewAgentStatsResponse>(_ViewAgentStatsResponse_QNAME, ViewAgentStatsResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ViewProductsAgent }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://techmartwebservices.mycompany.com/", name = "viewProductsAgent")
    public JAXBElement<ViewProductsAgent> createViewProductsAgent(ViewProductsAgent value) {
        return new JAXBElement<ViewProductsAgent>(_ViewProductsAgent_QNAME, ViewProductsAgent.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CompleteOrders }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://techmartwebservices.mycompany.com/", name = "completeOrders")
    public JAXBElement<CompleteOrders> createCompleteOrders(CompleteOrders value) {
        return new JAXBElement<CompleteOrders>(_CompleteOrders_QNAME, CompleteOrders.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ViewConfirmedOrders }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://techmartwebservices.mycompany.com/", name = "viewConfirmedOrders")
    public JAXBElement<ViewConfirmedOrders> createViewConfirmedOrders(ViewConfirmedOrders value) {
        return new JAXBElement<ViewConfirmedOrders>(_ViewConfirmedOrders_QNAME, ViewConfirmedOrders.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link LoginAgent }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://techmartwebservices.mycompany.com/", name = "loginAgent")
    public JAXBElement<LoginAgent> createLoginAgent(LoginAgent value) {
        return new JAXBElement<LoginAgent>(_LoginAgent_QNAME, LoginAgent.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link LoginAgentResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://techmartwebservices.mycompany.com/", name = "loginAgentResponse")
    public JAXBElement<LoginAgentResponse> createLoginAgentResponse(LoginAgentResponse value) {
        return new JAXBElement<LoginAgentResponse>(_LoginAgentResponse_QNAME, LoginAgentResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ViewAgentStats }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://techmartwebservices.mycompany.com/", name = "viewAgentStats")
    public JAXBElement<ViewAgentStats> createViewAgentStats(ViewAgentStats value) {
        return new JAXBElement<ViewAgentStats>(_ViewAgentStats_QNAME, ViewAgentStats.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link MakeStockRequest }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://techmartwebservices.mycompany.com/", name = "makeStockRequest")
    public JAXBElement<MakeStockRequest> createMakeStockRequest(MakeStockRequest value) {
        return new JAXBElement<MakeStockRequest>(_MakeStockRequest_QNAME, MakeStockRequest.class, null, value);
    }

}
