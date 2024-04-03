package test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import model.Module;

public class Test {

	public Test() {
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated constructor stub
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("AttedancenDAO");
		EntityManager em = factory.createEntityManager();
		Module module = new Module();
		module.setShortCode("COMPzzzz");
		em.persist(module);
		em.close();
		System.out.println("closed!");

	}

}
