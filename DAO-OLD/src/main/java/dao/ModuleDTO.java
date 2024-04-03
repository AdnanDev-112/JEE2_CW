package dao;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import model.Lecturer;
import model.Module;
import model.Schedule;

/**
 * Session Bean implementation class AttendanceDTO
 */
@Stateless
@LocalBean
public class ModuleDTO {

	@PersistenceContext(unitName = "AttendanceDAO")
	EntityManager em;

	/**
	 * Default constructor.
	 */
	public ModuleDTO() {
		// TODO Auto-generated constructor stub
	}

	public List<Module> allModulesByLecturer(int lecturerID) {
		// TODO Auto-generated method stub
		List queryResults = em.createNamedQuery("Module.findByLecturer", Module.class)
				.setParameter("lecturerID", lecturerID).getResultList();
		List<Module> listResult = new ArrayList<>();

		for (Object queryResult : queryResults) {
			Module b = new Module();
			b = (Module) queryResult;
			listResult.add(b);
		}

		return listResult;
	}

	public Lecturer getLecturerById(int lecturerID) {

		List<Lecturer> queryResults = em.createNamedQuery("Lecturer.findByLecturerID", Lecturer.class)
				.setParameter("lecturerID", lecturerID).getResultList();

		Lecturer b = new Lecturer();
		b = queryResults.get(0);
		return b;
	}

	public Module getModuleById(int moduleID) {

		List<Module> queryResults = em.createNamedQuery("Module.findById", Module.class).setParameter("moduleID", moduleID)
				.getResultList();

		Module m = new Module();
		m = queryResults.get(0);
		return m;
	}

	public List<Schedule> getScheduleForModule(int moduleID){
		List<Schedule> queryResults = em.createNamedQuery("Schedule.findByModuleId", Schedule.class)
				.setParameter("moduleID", moduleID)
				.getResultList();

		List<Schedule> listResult = new ArrayList<>();

		for (int i = 0; i < queryResults.size(); i++) {
			Schedule b = new Schedule();
			b = queryResults.get(i);
			listResult.add(b);
		}

		return listResult;


	}

	public List<Module> getAllModules(){
	    return em.createQuery("SELECT m FROM Module m", Module.class).getResultList();
	}





}
