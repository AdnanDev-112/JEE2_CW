package dao;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import model.Attendance;
import model.Module;
import model.Schedule;
import model.Student;

/**
 * Session Bean implementation class RegisterAttendanceDTO
 */
@Stateless
@LocalBean
public class RegisterAttendanceDTO {
	@PersistenceContext(unitName = "AttendanceDAO")
	EntityManager em;

    /**
     * Default constructor.
     */
    public RegisterAttendanceDTO() {
        // TODO Auto-generated constructor stub
    }

    public List<Student> getStudentsByModule(Integer moduleId) {
//    	Integer moduleIdInt = moduleId.intValue();
    	List queryResults = em.createNamedQuery("Student.findByModule", Student.class)
        		.setParameter("moduleId", moduleId)
                 .getResultList();
		List<Student> listResult = new ArrayList<>();

		for (Object queryResult : queryResults) {
			Student b = new Student();
			b = (Student) queryResult;
			listResult.add(b);
		}
		return listResult;
    }


    public void saveStudentAttendance(Integer moduleID , Integer scheduleID , List<String> selectedStudents ) {

    	List<Student> studentList = getStudentsByModule(moduleID);

    	List<String> existingStudentListToStringIds = new ArrayList<>();
    	for (Student student : studentList) {
    		existingStudentListToStringIds.add(String.valueOf(student.getStudentID()));
    	}

        List<String> allStudentIds = existingStudentListToStringIds;

		Set<String> presentStudentIdsSet = new HashSet<>(selectedStudents);

		// Iterate over all student IDs
		for (String student : allStudentIds) {
			// If the student ID is in presentStudentIdsSet, the student is present, otherwise they are absent
//			attendance.put(studentId, presentStudentIdsSet.contains(studentId));
			Attendance studentAttendance = new Attendance();

			Module studentModule = new Module();
			studentModule.setModuleID(moduleID);

			Student studentObj = new Student();
			studentObj.setStudentID(Integer.parseInt(student));

			Schedule attendedSchedule = new Schedule();
			System.out.println( scheduleID);
			attendedSchedule.setScheduleID(scheduleID);


			if(presentStudentIdsSet.contains(student)) {
				studentAttendance.setAttended((byte) 1);
			}else {
				studentAttendance.setAttended((byte) 0);
			}
			studentAttendance.setStudent(studentObj);
			studentAttendance.setModule(studentModule);
			studentAttendance.setSchedule(attendedSchedule);

			em.persist(studentAttendance);
		}

    }

}
