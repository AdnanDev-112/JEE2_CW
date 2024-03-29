package model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;


/**
 * The persistent class for the attendance database table.
 *
 */
@Entity
@NamedQuery(name="Attendance.findAll", query="SELECT a FROM Attendance a")
@NamedQuery(name="Attendance.findByStudentIDAndModuleID", query="SELECT a FROM Attendance a WHERE a.student.studentID = :studentID AND a.module.moduleID = :moduleID")


public class Attendance implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int attendanceID;

	private byte attended;

	//bi-directional many-to-one association to Module
	@ManyToOne
	@JoinColumn(name="ModuleID")
	private Module module;

	//bi-directional many-to-one association to Schedule
	@ManyToOne
	@JoinColumn(name="ScheduleID")
	private Schedule schedule;

	//bi-directional many-to-one association to Student
	@ManyToOne
	@JoinColumn(name="StudentID")
	private Student student;

	public Attendance() {
	}

	public int getAttendanceID() {
		return this.attendanceID;
	}

	public void setAttendanceID(int attendanceID) {
		this.attendanceID = attendanceID;
	}

	public byte getAttended() {
		return this.attended;
	}

	public void setAttended(byte attended) {
		this.attended = attended;
	}

	public Module getModule() {
		return this.module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	public Schedule getSchedule() {
		return this.schedule;
	}

	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

}