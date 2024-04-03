package dao;


import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import model.Attendance;

/**
 * Session Bean implementation class ReportsDTO
 */
@Stateless
@LocalBean
public class ReportsDTO {

	@PersistenceContext(unitName = "AttendanceDAO")
	EntityManager em;

    /**
     * Default constructor.
     */
    public ReportsDTO() {
        // TODO Auto-generated constructor stub
    }


    public List<Attendance> getstudentAttendance(int studentID , int moduleID) {
		// TODO Auto-generated method stub
    	System.out.println(studentID);
    	System.out.println(moduleID);
		return em.createNamedQuery("Attendance.findByStudentIDAndModuleID", Attendance.class)
				.setParameter("studentID", studentID)
				.setParameter("moduleID", moduleID)
				.getResultList();


	}

}
