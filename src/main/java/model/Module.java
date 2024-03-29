package model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;


/**
 * The persistent class for the module database table.
 *
 */
@Entity
@NamedQuery(name="Module.findAll", query="SELECT m FROM Module m")
@NamedQuery(name="Module.findByLecturer", query="SELECT m FROM Module m WHERE m.lectureID = :lecturerID")
@NamedQuery(name="Module.findById", query="SELECT m FROM Module m WHERE m.moduleID = :moduleID")

public class Module implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int moduleID;

	private int lectureID;

	private String longName;

	private String shortCode;

	private int totalStudents;

	//bi-directional many-to-one association to Attendance
	@OneToMany(mappedBy="module")
	private List<Attendance> attendances;

	//bi-directional many-to-one association to Enrollment
	@OneToMany(mappedBy="module")
	private List<Enrollment> enrollments;

	//bi-directional many-to-one association to Lecturer
	@OneToMany(mappedBy="module")
	private List<Lecturer> lecturers;

	//bi-directional many-to-one association to Schedule
	@OneToMany(mappedBy="module")
	private List<Schedule> schedules;

	public Module() {
	}

	public int getModuleID() {
		return this.moduleID;
	}

	public void setModuleID(int moduleID) {
		this.moduleID = moduleID;
	}

	public int getLectureID() {
		return this.lectureID;
	}

	public void setLectureID(int lectureID) {
		this.lectureID = lectureID;
	}

	public String getLongName() {
		return this.longName;
	}

	public void setLongName(String longName) {
		this.longName = longName;
	}

	public String getShortCode() {
		return this.shortCode;
	}

	public void setShortCode(String shortCode) {
		this.shortCode = shortCode;
	}

	public int getTotalStudents() {
		return this.totalStudents;
	}

	public void setTotalStudents(int totalStudents) {
		this.totalStudents = totalStudents;
	}

	public List<Attendance> getAttendances() {
		return this.attendances;
	}

	public void setAttendances(List<Attendance> attendances) {
		this.attendances = attendances;
	}

	public Attendance addAttendance(Attendance attendance) {
		getAttendances().add(attendance);
		attendance.setModule(this);

		return attendance;
	}

	public Attendance removeAttendance(Attendance attendance) {
		getAttendances().remove(attendance);
		attendance.setModule(null);

		return attendance;
	}

	public List<Enrollment> getEnrollments() {
		return this.enrollments;
	}

	public void setEnrollments(List<Enrollment> enrollments) {
		this.enrollments = enrollments;
	}

	public Enrollment addEnrollment(Enrollment enrollment) {
		getEnrollments().add(enrollment);
		enrollment.setModule(this);

		return enrollment;
	}

	public Enrollment removeEnrollment(Enrollment enrollment) {
		getEnrollments().remove(enrollment);
		enrollment.setModule(null);

		return enrollment;
	}

	public List<Lecturer> getLecturers() {
		return this.lecturers;
	}

	public void setLecturers(List<Lecturer> lecturers) {
		this.lecturers = lecturers;
	}

	public Lecturer addLecturer(Lecturer lecturer) {
		getLecturers().add(lecturer);
		lecturer.setModule(this);

		return lecturer;
	}

	public Lecturer removeLecturer(Lecturer lecturer) {
		getLecturers().remove(lecturer);
		lecturer.setModule(null);

		return lecturer;
	}

	public List<Schedule> getSchedules() {
		return this.schedules;
	}

	public void setSchedules(List<Schedule> schedules) {
		this.schedules = schedules;
	}

	public Schedule addSchedule(Schedule schedule) {
		getSchedules().add(schedule);
		schedule.setModule(this);

		return schedule;
	}

	public Schedule removeSchedule(Schedule schedule) {
		getSchedules().remove(schedule);
		schedule.setModule(null);

		return schedule;
	}

}