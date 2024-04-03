package servlet;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AttndceDTORemote;
import dao.ModuleDTO;
import dao.StudentDTO;

/**
 * Servlet implementation class AttndceServlet
 */
@WebServlet(description = "The Control of dynamic Web view", urlPatterns = { "/AttndceServlet" })
public class AttndceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	AttndceDTORemote attndceDTO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AttndceServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;
		String target = null;

		switch (action) {
		case "outputModules": {
			target = "outputModules.jsp";
			List<ModuleDTO> listModules = attndceDTO.allModules();
			List<StudentDTO> listStudents = attndceDTO.allStudents();
			session.setAttribute("modules", listModules);
			session.setAttribute("students", listStudents);
			rd = request.getRequestDispatcher(target);
		}
			break;

		case "outputStudents": {
			target = "outputStudents.jsp";
			List<ModuleDTO> listModules = attndceDTO.allModules();
			List<StudentDTO> listStudents = attndceDTO.allStudents();
			session.setAttribute("modules", listModules);
			session.setAttribute("students", listStudents);
			rd = request.getRequestDispatcher(target);
		}
			break;

		case "module-attendance": {
			target = "module-attendance.jsp";
			String module = request.getParameter("moduleShortName");
			String week = request.getParameter("cbxWeek");
			List<StudentDTO> listStudents = attndceDTO.allStudents();
			session.setAttribute("students", listStudents);
			session.setAttribute("week", week);
			session.setAttribute("module", module);
			rd = request.getRequestDispatcher(target);
		}
		break;
		
		case "record-attendance": {
			target = "index.html";
			String module = request.getParameter("moduleId");
			String week = request.getParameter("week");		
			List<StudentDTO> listStudents = attndceDTO.allStudents();
			for (StudentDTO studentDTO : listStudents) {
				String attendance=request.getParameter("attend-"+studentDTO.getStudentID());
				System.out.println(String.format("WRITING TO DDBB through DTO %s %s %s %s",
						module, studentDTO.getStudentID(),week,attendance));
//				attndceDTO.
			}
			session.setAttribute("students", listStudents);
			session.setAttribute("week", week);
			session.setAttribute("module", module);
			rd = request.getRequestDispatcher(target);
		}
		break;

		case "student-attendance": {
			target = "student-attendance.jsp";
			List<ModuleDTO> listModules = attndceDTO.allModules();
			request.setAttribute("modules", listModules);
			rd = request.getRequestDispatcher(target);
		}
		break;
		default:
			break;
		}

		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
