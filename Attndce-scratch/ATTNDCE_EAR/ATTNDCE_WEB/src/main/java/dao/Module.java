/**
 * Module.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package dao;

import java.util.Objects;

public class Module  implements java.io.Serializable {
	private int moduleID;

	private int lectureID;

	private String longName;

	private String shortCode;

	private int totalStudents;

	public int getModuleID() {
		return moduleID;
	}

	public void setModuleID(int moduleID) {
		this.moduleID = moduleID;
	}

	public int getLectureID() {
		return lectureID;
	}

	public void setLectureID(int lectureID) {
		this.lectureID = lectureID;
	}

	public String getLongName() {
		return longName;
	}

	public void setLongName(String longName) {
		this.longName = longName;
	}

	public String getShortCode() {
		return shortCode;
	}

	public void setShortCode(String shortCode) {
		this.shortCode = shortCode;
	}

	public int getTotalStudents() {
		return totalStudents;
	}

	public void setTotalStudents(int totalStudents) {
		this.totalStudents = totalStudents;
	}

	@Override
	public String toString() {
		return "ModuleDTO [moduleID=" + moduleID + ", lectureID=" + lectureID + ", longName=" + longName
				+ ", shortCode=" + shortCode + ", totalStudents=" + totalStudents + "]";
	}

	public Module(int moduleID, int lectureID, String longName, String shortCode, int totalStudents) {
		super();
		this.moduleID = moduleID;
		this.lectureID = lectureID;
		this.longName = longName;
		this.shortCode = shortCode;
		this.totalStudents = totalStudents;
	}
	
	
	private boolean __hashCodeCalc = false;
	@Override
	public int hashCode() {
		return Objects.hash(lectureID, longName, moduleID, shortCode, totalStudents);
	}

	
	private java.lang.Object __equalsCalc = null;
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Module other = (Module) obj;
		return lectureID == other.lectureID && Objects.equals(longName, other.longName) && moduleID == other.moduleID
				&& Objects.equals(shortCode, other.shortCode) && totalStudents == other.totalStudents;
	}
	    // Type metadata
	    private static org.apache.axis.description.TypeDesc typeDesc =
	        new org.apache.axis.description.TypeDesc(ModuleDTO.class, true);

	    static {
	        typeDesc.setXmlType(new javax.xml.namespace.QName("http://dao/", "module"));
	        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
	        elemField.setFieldName("id");
	        elemField.setXmlName(new javax.xml.namespace.QName("", "id"));
	        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
	        elemField.setNillable(false);
	        typeDesc.addFieldDesc(elemField);
	        elemField = new org.apache.axis.description.ElementDesc();
	        elemField.setFieldName("shortname");
	        elemField.setXmlName(new javax.xml.namespace.QName("", "shortname"));
	        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
	        elemField.setMinOccurs(0);
	        elemField.setNillable(false);
	        typeDesc.addFieldDesc(elemField);
	        elemField = new org.apache.axis.description.ElementDesc();
	        elemField.setFieldName("tittle");
	        elemField.setXmlName(new javax.xml.namespace.QName("", "tittle"));
	        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
	        elemField.setMinOccurs(0);
	        elemField.setNillable(false);
	        typeDesc.addFieldDesc(elemField);
	    }

	    /**
	     * Return type metadata object
	     */
	    public static org.apache.axis.description.TypeDesc getTypeDesc() {
	        return typeDesc;
	    }

	    /**
	     * Get Custom Serializer
	     */
	    public static org.apache.axis.encoding.Serializer getSerializer(
	           java.lang.String mechType, 
	           java.lang.Class _javaType,  
	           javax.xml.namespace.QName _xmlType) {
	        return 
	          new  org.apache.axis.encoding.ser.BeanSerializer(
	            _javaType, _xmlType, typeDesc);
	    }

	    /**
	     * Get Custom Deserializer
	     */
	    public static org.apache.axis.encoding.Deserializer getDeserializer(
	           java.lang.String mechType, 
	           java.lang.Class _javaType,  
	           javax.xml.namespace.QName _xmlType) {
	        return 
	          new  org.apache.axis.encoding.ser.BeanDeserializer(
	            _javaType, _xmlType, typeDesc);
	    }
	
	

   

}
