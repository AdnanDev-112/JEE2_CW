package dao;

import java.io.Serializable;

public class StudentDTO implements Serializable {

	private int studentID;

	private String email;

	private String name;
	
	public int getStudentID() {
		return studentID;
	}

	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public StudentDTO() {
		// TODO Auto-generated constructor stub
	}

	public StudentDTO(int studentID, String email, String name) {
		super();
		this.studentID = studentID;
		this.email = email;
		this.name = name;
	}
	
	
	

}
