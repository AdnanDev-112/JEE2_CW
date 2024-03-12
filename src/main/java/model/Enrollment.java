package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the enrollment database table.
 * 
 */
@Entity
@NamedQuery(name="Enrollment.findAll", query="SELECT e FROM Enrollment e")
public class Enrollment implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int enrollmentID;

	//bi-directional many-to-one association to Module
	@ManyToOne
	@JoinColumn(name="ModuleID")
	private Module module;

	//bi-directional many-to-one association to Student
	@ManyToOne
	@JoinColumn(name="StudentID")
	private Student student;

	public Enrollment() {
	}

	public int getEnrollmentID() {
		return this.enrollmentID;
	}

	public void setEnrollmentID(int enrollmentID) {
		this.enrollmentID = enrollmentID;
	}

	public Module getModule() {
		return this.module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

}