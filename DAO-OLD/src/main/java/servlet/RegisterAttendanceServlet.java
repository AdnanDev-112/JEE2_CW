package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RegisterAttendanceDTO;
import model.Student;

/**
 * Servlet implementation class RegisterAttendanceServlet
 */
@WebServlet("/RegisterAttendanceServlet")
public class RegisterAttendanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

private static String baseFolder = "/AttendanceDAO";

	private static String moduleFolder = "/RegisterAttendance/";

	@EJB
    private RegisterAttendanceDTO registerAttDTO ;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAttendanceServlet() {
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
		switch (param_action) {

		case "showAllStudents": {
			try {
				HttpSession session = request.getSession();
				String moduleIDStr = request.getParameter("chosenModule");
				int moduleID = Integer.parseInt(moduleIDStr);
				String scheduleIDStr = request.getParameter("scheduleID");
				int scheduleID = Integer.parseInt(scheduleIDStr);


				List<Student> studentList = registerAttDTO.getStudentsByModule(moduleID);
				session.setAttribute("studentList", studentList);
				session.setAttribute("scheduleID", scheduleID);
				session.setAttribute("chosenModule", moduleID);
				String redirectURL = baseFolder + moduleFolder + "ListStudents.jsp";
			    response.sendRedirect(redirectURL);

				break;

			}catch(Exception e)
			{
				System.out.println(e);
			}
		}
		case "registerStudentsAttendance": {
			try {
				HttpSession session = request.getSession();
				String moduleIDStr = request.getParameter("chosenModule");
				int moduleID = Integer.parseInt(moduleIDStr);

				String scheduleIDstr = request.getParameter("scheduleID");
				int scheduleID = Integer.parseInt(scheduleIDstr);


				List<String> selectedStudents = new ArrayList<>(Arrays.asList(request.getParameterValues("selectedStudents")));
			    if (selectedStudents.size() > 0 ) {
			        for (String studentID : selectedStudents) {
			        	System.out.println(studentID);
			        }
			        registerAttDTO.saveStudentAttendance(moduleID , scheduleID ,selectedStudents);
			    }

				String redirectURL = baseFolder + moduleFolder + "RegisterSuccessfull.jsp";
			    response.sendRedirect(redirectURL);
//			    response.setStatus(HttpServletResponse.SC_OK);
				break;

			}catch(Exception e)
			{
				System.out.println(e);
			}
		}



		}

		response.getWriter().append("Served at: ").append(request.getContextPath());
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
