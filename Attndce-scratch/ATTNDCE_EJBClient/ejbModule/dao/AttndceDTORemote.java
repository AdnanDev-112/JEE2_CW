	package dao;

import java.util.List;

import javax.ejb.Remote;

@Remote
public interface AttndceDTORemote {
	public List<ModuleDTO> allModules();
	public List<StudentDTO> allStudents();

}
