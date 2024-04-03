package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ModuleDTO;
import model.Lecturer;
import model.Module;
import model.Schedule;

/**
 * Servlet implementation class ModuleServlet
 */
@WebServlet("/ModuleServlet")
public class ModuleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String baseFolder = "/AttendanceDAO";

	private static String moduleFolder = "/Module/";

    /**
     * @see HttpServlet#HttpServlet()
     */
	@EJB
	private ModuleDTO attendanceDTO;

    public ModuleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String param_action = request.getParameter("action");
		String tableStr = new String();
		switch (param_action) {

		case "showAllModules": {
			try {
				HttpSession session = request.getSession();
				String lecturerIDStr = request.getParameter("lecturerID");
				int lecturerID = Integer.parseInt(lecturerIDStr);
				List<Module> moduleList = attendanceDTO.allModulesByLecturer(lecturerID);
				Lecturer lecturer = attendanceDTO.getLecturerById(lecturerID);
				session.setAttribute("moduleList", moduleList);
				session.setAttribute("lecturer", lecturer);
				String redirectURL = baseFolder + moduleFolder + "ListModules.jsp";
			    response.sendRedirect(redirectURL);

//				RequestDispatcher dispatcher = request.getRequestDispatcher(moduleFolder + "ListModules.jsp");
//				dispatcher.forward(request, response);
				break;

			}catch(Exception e)
			{
				System.out.println(e);
			}
		}
		case "moduleSelected":{
			try {
				HttpSession session = request.getSession();
				String moduleIDStr = request.getParameter("chosenModule");
				int moduleID = Integer.parseInt(moduleIDStr);

				Module module = attendanceDTO.getModuleById(moduleID);
				List<Schedule> scheduleList = attendanceDTO.getScheduleForModule(moduleID);

				session.setAttribute("moduleData", module);
				session.setAttribute("scheduleList", scheduleList);
				session.setAttribute("moduleID", moduleID);

				String redirectURL = baseFolder + moduleFolder + "DateSelector.jsp";
			    response.sendRedirect(redirectURL);
				break;

			}catch(Exception e)
			{
				System.out.println(e);
			}


		}
		case "getAllModules": {
			try {
				HttpSession session = request.getSession();
				List<Module> moduleList = attendanceDTO.getAllModules();
				session.setAttribute("reportModuleList", moduleList);
				String redirectURL = baseFolder + "/Report/" + "selectModule.jsp";
			    response.sendRedirect(redirectURL);
				break;

			}catch(Exception e)
			{
				System.out.println(e);
			}
		}


		}


		response.setContentType("text/html;charsetUTF-8");

		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Attendance Module App</title>");
		out.println("<head>");

		out.println("Displayed @ " + new java.util.Date() + "<br/>" + tableStr);
		out.println("<br/> <a href='/AttendanceDAO'>Home</a>");
		out.println("<body>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
