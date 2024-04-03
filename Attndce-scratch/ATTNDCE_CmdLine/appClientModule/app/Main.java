package app;

import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.xml.rpc.ServiceException;

import org.apache.commons.logging.impl.SLF4JLog;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dao.AttndceDTO;
import dao.AttndceDTORemote;
import dao.AttndceDTOServiceLocator;

public class Main {

	private static Logger LOGGER = LoggerFactory.getLogger(SLF4JLog.class);

	private static String JNDI = "ejb:ATTNDCE_EAR/ATTNDCE_EJB/AttndceDTO!dao.AttndceDTORemote";

	private static String CONTEXT_FACTORY = "org.wildfly.naming.client.WildFlyInitialContextFactory";
	private static String PROVIDER_URL = "http-remoting://localhost:8112";

	public static void main(String[] args) throws ServiceException, NamingException {
		// Getting a handle to ejb
		final Properties env = new Properties();
		env.put(Context.INITIAL_CONTEXT_FACTORY, CONTEXT_FACTORY);
		env.put(Context.PROVIDER_URL, PROVIDER_URL);
		env.put("jboss.naming.client.ejb.context", true);
		InitialContext ic = new InitialContext(env);
		AttndceDTORemote ejb = (AttndceDTORemote) ic.lookup(JNDI);
		

//		// Getting a handle to ejb-ws
		AttndceDTOServiceLocator loc = new AttndceDTOServiceLocator();
		AttndceDTO ejb_ws = loc.getAttndceDTOPort();

		Console.loop(ejb, ejb_ws);
	}

	/*
	 * (non-Java-doc)
	 * 
	 * @see java.lang.Object#Object()
	 */
	public Main() {
		super();
	}

}