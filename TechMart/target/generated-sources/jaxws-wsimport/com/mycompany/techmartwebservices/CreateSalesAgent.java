
package com.mycompany.techmartwebservices;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for createSalesAgent complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="createSalesAgent">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="agent" type="{http://techmartwebservices.mycompany.com/}salesAgent" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "createSalesAgent", propOrder = {
    "agent"
})
public class CreateSalesAgent {

    protected SalesAgent agent;

    /**
     * Gets the value of the agent property.
     * 
     * @return
     *     possible object is
     *     {@link SalesAgent }
     *     
     */
    public SalesAgent getAgent() {
        return agent;
    }

    /**
     * Sets the value of the agent property.
     * 
     * @param value
     *     allowed object is
     *     {@link SalesAgent }
     *     
     */
    public void setAgent(SalesAgent value) {
        this.agent = value;
    }

}
