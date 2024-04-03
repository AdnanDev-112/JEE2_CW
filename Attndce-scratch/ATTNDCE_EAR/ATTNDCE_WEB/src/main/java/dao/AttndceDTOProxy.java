package dao;

public class AttndceDTOProxy implements dao.AttndceDTO {
  private String _endpoint = null;
  private dao.AttndceDTO attndceDTO = null;
  
  public AttndceDTOProxy() {
    _initAttndceDTOProxy();
  }
  
  public AttndceDTOProxy(String endpoint) {
    _endpoint = endpoint;
    _initAttndceDTOProxy();
  }
  
  private void _initAttndceDTOProxy() {
    try {
      attndceDTO = (new dao.AttndceDTOServiceLocator()).getAttndceDTOPort();
      if (attndceDTO != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)attndceDTO)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)attndceDTO)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (attndceDTO != null)
      ((javax.xml.rpc.Stub)attndceDTO)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public dao.AttndceDTO getAttndceDTO() {
    if (attndceDTO == null)
      _initAttndceDTOProxy();
    return attndceDTO;
  }
  
  public dao.StudentDTO[] allStudents() throws java.rmi.RemoteException{
    if (attndceDTO == null)
      _initAttndceDTOProxy();
    return attndceDTO.allStudents();
  }
  
  public dao.ModuleDTO[] allModules() throws java.rmi.RemoteException{
    if (attndceDTO == null)
      _initAttndceDTOProxy();
    return attndceDTO.allModules();
  }
  
  
}