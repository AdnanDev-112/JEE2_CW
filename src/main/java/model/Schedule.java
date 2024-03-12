package model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Time;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the schedules database table.
 * 
 */
@Entity
@Table(name="schedules")
@NamedQuery(name="Schedule.findAll", query="SELECT s FROM Schedule s")
@NamedQuery(name="Schedule.findByModuleId", query="SELECT s FROM Schedule s WHERE s.module.moduleID = :moduleID")

public class Schedule implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int scheduleID;

	private int duration;

	@Temporal(TemporalType.DATE)
	private Date scheduleDate;

	private Time scheduleTime;

	//bi-directional many-to-one association to Attendance
	@OneToMany(mappedBy="schedule")
	private List<Attendance> attendances;

	//bi-directional many-to-one association to Module
	@ManyToOne
	@JoinColumn(name="ModuleID")
	private Module module;

	public Schedule() {
	}

	public int getScheduleID() {
		return this.scheduleID;
	}

	public void setScheduleID(int scheduleID) {
		this.scheduleID = scheduleID;
	}

	public int getDuration() {
		return this.duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public Date getScheduleDate() {
		return this.scheduleDate;
	}

	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public Time getScheduleTime() {
		return this.scheduleTime;
	}

	public void setScheduleTime(Time scheduleTime) {
		this.scheduleTime = scheduleTime;
	}

	public List<Attendance> getAttendances() {
		return this.attendances;
	}

	public void setAttendances(List<Attendance> attendances) {
		this.attendances = attendances;
	}

	public Attendance addAttendance(Attendance attendance) {
		getAttendances().add(attendance);
		attendance.setSchedule(this);

		return attendance;
	}

	public Attendance removeAttendance(Attendance attendance) {
		getAttendances().remove(attendance);
		attendance.setSchedule(null);

		return attendance;
	}

	public Module getModule() {
		return this.module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

}