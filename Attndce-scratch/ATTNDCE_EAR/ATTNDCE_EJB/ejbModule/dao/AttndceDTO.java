package dao;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Remote;
import javax.ejb.Stateless;
import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Session Bean implementation class AttndceDTO
 */
@WebService
@Stateless
@LocalBean
@Remote(AttndceDTORemote.class)
public class AttndceDTO implements AttndceDTORemote {

	@PersistenceContext(name = "ATTNDCE_JPA")
	EntityManager em;

	/**
	 * Default constructor.
	 */
	public AttndceDTO() {
		// TODO Auto-generated constructor stub
	}

	@WebMethod
	@Override
	public List<ModuleDTO> allModules() {
		List<model.Module> modules = em
				.createQuery("SELECT m FROM Module m",model.Module.class)
				.getResultList();
		List<ModuleDTO> listModules = new ArrayList<ModuleDTO>();
		modules.forEach(m ->
			listModules.add(new ModuleDTO(m.getModuleID(),m.getLectureID(),m.getLongName(), m.getShortCode(), m.getTotalStudents() )));
		return listModules;
	}

	@WebMethod
	@Override
	public List<StudentDTO> allStudents() {
		List<model.Student> students = em
				.createQuery("SELECT s FROM Student s",model.Student.class)
				.getResultList();
		List<StudentDTO> listModules = new ArrayList<StudentDTO>();
		students.forEach(s ->
			listModules.add(new StudentDTO(s.getStudentID(),s.getEmail(),s.getName())));
		return listModules;	}

}
