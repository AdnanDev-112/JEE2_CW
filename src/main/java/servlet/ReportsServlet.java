package servlet;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RegisterAttendanceDTO;
import dao.ReportsDTO;
import model.Attendance;
import model.Student;

/**
 * Servlet implementation class ReportsServlet
 */
@WebServlet("/ReportsServlet")
public class ReportsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static String baseFolder = "/AttendanceDAO";

	private static String moduleFolder = "/Report/";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    @EJB
    private RegisterAttendanceDTO registerAttDTO ;

    @EJB
    private ReportsDTO reportsDTO;

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
				String moduleIDStr = request.getParameter("reportModuleID");
				int moduleID = Integer.parseInt(moduleIDStr);

				List<Student> studentList = registerAttDTO.getStudentsByModule(moduleID);
				session.setAttribute("reportStudentList", studentList);
				session.setAttribute("reportModuleID", moduleID);
				String redirectURL = baseFolder + moduleFolder + "selectStudents.jsp";
			    response.sendRedirect(redirectURL);

				break;

			}catch(Exception e)
			{
				System.out.println(e);
			}
		}
		case "showReport": {
			try {
				System.out.print("didnt even hit");
				HttpSession session = request.getSession();
				String studentIDStr = request.getParameter("studentID");
				int studentID = Integer.parseInt(studentIDStr);

				String reportModuleIDStr = request.getParameter("reportModuleID");
				System.out.print("moule str?"+ reportModuleIDStr );

				int reportModuleID = Integer.parseInt(reportModuleIDStr);

				List<Attendance> attendanceList = reportsDTO.getstudentAttendance(studentID,reportModuleID);
				session.setAttribute("attendanceList", attendanceList);
				String redirectURL = baseFolder + moduleFolder + "displayReport.jsp";
			    response.sendRedirect(redirectURL);

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
