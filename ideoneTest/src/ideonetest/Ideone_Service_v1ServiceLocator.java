package ideonetest;

public class Ideone_Service_v1ServiceLocator extends org.apache.axis.client.Service implements Ideone_Service_v1Service {

    public Ideone_Service_v1ServiceLocator() {
    }


    public Ideone_Service_v1ServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public Ideone_Service_v1ServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for Ideone_Service_v1Port
    private java.lang.String Ideone_Service_v1Port_address = "http://ideone.com/api/1/service";

    public java.lang.String getIdeone_Service_v1PortAddress() {
        return Ideone_Service_v1Port_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String Ideone_Service_v1PortWSDDServiceName = "Ideone_Service_v1Port";

    public java.lang.String getIdeone_Service_v1PortWSDDServiceName() {
        return Ideone_Service_v1PortWSDDServiceName;
    }

    public void setIdeone_Service_v1PortWSDDServiceName(java.lang.String name) {
        Ideone_Service_v1PortWSDDServiceName = name;
    }

    public Ideone_Service_v1Port_PortType getIdeone_Service_v1Port() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(Ideone_Service_v1Port_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getIdeone_Service_v1Port(endpoint);
    }

    public Ideone_Service_v1Port_PortType getIdeone_Service_v1Port(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            Ideone_Service_v1BindingStub _stub = new Ideone_Service_v1BindingStub(portAddress, this);
            _stub.setPortName(getIdeone_Service_v1PortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setIdeone_Service_v1PortEndpointAddress(java.lang.String address) {
        Ideone_Service_v1Port_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (Ideone_Service_v1Port_PortType.class.isAssignableFrom(serviceEndpointInterface)) {
                Ideone_Service_v1BindingStub _stub = new Ideone_Service_v1BindingStub(new java.net.URL(Ideone_Service_v1Port_address), this);
                _stub.setPortName(getIdeone_Service_v1PortWSDDServiceName());
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
        if ("Ideone_Service_v1Port".equals(inputPortName)) {
            return getIdeone_Service_v1Port();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://ideone.com/api/1/service", "Ideone_Service_v1Service");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://ideone.com/api/1/service", "Ideone_Service_v1Port"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("Ideone_Service_v1Port".equals(portName)) {
            setIdeone_Service_v1PortEndpointAddress(address);
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
