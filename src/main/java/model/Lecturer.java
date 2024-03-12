package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the lecturer database table.
 * 
 */
@Entity
@NamedQuery(name="Lecturer.findAll", query="SELECT l FROM Lecturer l")
@NamedQuery(name="Lecturer.findByLecturerID", query="SELECT l FROM Lecturer l WHERE l.lectureID = :lecturerID")
public class Lecturer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int lectureID;

	private String email;

	private String name;

	//bi-directional many-to-one association to Module
	@ManyToOne
	@JoinColumn(name="ModuleID")
	private Module module;

	public Lecturer() {
	}

	public int getLectureID() {
		return this.lectureID;
	}

	public void setLectureID(int lectureID) {
		this.lectureID = lectureID;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Module getModule() {
		return this.module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

}