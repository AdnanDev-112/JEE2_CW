package dao;

import java.io.Serializable;

public class ModuleDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


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

	public ModuleDTO(int moduleID, int lectureID, String longName, String shortCode, int totalStudents) {
		super();
		this.moduleID = moduleID;
		this.lectureID = lectureID;
		this.longName = longName;
		this.shortCode = shortCode;
		this.totalStudents = totalStudents;
	}
	
	
	
	
	
	

}
