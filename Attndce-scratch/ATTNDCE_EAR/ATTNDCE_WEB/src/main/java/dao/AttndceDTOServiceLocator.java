/**
 * AttndceDTOServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package dao;

public class AttndceDTOServiceLocator extends org.apache.axis.client.Service implements dao.AttndceDTOService {

    public AttndceDTOServiceLocator() {
    }


    public AttndceDTOServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public AttndceDTOServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for AttndceDTOPort
    private java.lang.String AttndceDTOPort_address = "http://localhost:8080/ATTNDCE_EJB/AttndceDTO";

    public java.lang.String getAttndceDTOPortAddress() {
        return AttndceDTOPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String AttndceDTOPortWSDDServiceName = "AttndceDTOPort";

    public java.lang.String getAttndceDTOPortWSDDServiceName() {
        return AttndceDTOPortWSDDServiceName;
    }

    public void setAttndceDTOPortWSDDServiceName(java.lang.String name) {
        AttndceDTOPortWSDDServiceName = name;
    }

    public dao.AttndceDTO getAttndceDTOPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(AttndceDTOPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getAttndceDTOPort(endpoint);
    }

    public dao.AttndceDTO getAttndceDTOPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            dao.AttndceDTOServiceSoapBindingStub _stub = new dao.AttndceDTOServiceSoapBindingStub(portAddress, this);
            _stub.setPortName(getAttndceDTOPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setAttndceDTOPortEndpointAddress(java.lang.String address) {
        AttndceDTOPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (dao.AttndceDTO.class.isAssignableFrom(serviceEndpointInterface)) {
                dao.AttndceDTOServiceSoapBindingStub _stub = new dao.AttndceDTOServiceSoapBindingStub(new java.net.URL(AttndceDTOPort_address), this);
                _stub.setPortName(getAttndceDTOPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("AttndceDTOPort".equals(inputPortName)) {
            return getAttndceDTOPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://dao/", "AttndceDTOService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://dao/", "AttndceDTOPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("AttndceDTOPort".equals(portName)) {
            setAttndceDTOPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
