
package com.mycompany.techmartwebservices;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for viewProductsAgent complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="viewProductsAgent">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="agentBranch" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "viewProductsAgent", propOrder = {
    "agentBranch"
})
public class ViewProductsAgent {

    protected String agentBranch;

    /**
     * Gets the value of the agentBranch property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getAgentBranch() {
        return agentBranch;
    }

    /**
     * Sets the value of the agentBranch property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setAgentBranch(String value) {
        this.agentBranch = value;
    }

}
