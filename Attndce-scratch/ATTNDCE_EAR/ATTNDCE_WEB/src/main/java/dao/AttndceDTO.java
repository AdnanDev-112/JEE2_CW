/**
 * AttndceDTO.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package dao;

public interface AttndceDTO extends java.rmi.Remote {
    public dao.StudentDTO[] allStudents() throws java.rmi.RemoteException;
    public dao.ModuleDTO[] allModules() throws java.rmi.RemoteException;
}
