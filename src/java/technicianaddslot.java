import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import technicianmethods.technicianmethods;
public class technicianaddslot extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String sid=(String)request.getParameter("sid");
		String ptype=(String)request.getParameter("ptype");
		String pid=(String)request.getParameter("pid");
		String pdesc=(String)request.getParameter("pdesc");
		String ptypestring=(String)request.getParameter("ptypestring");
		String pstatus=(String)request.getParameter("pstatus");
		String time=(String)request.getParameter("time");
		
		technicianmethods s=new technicianmethods();
		int k=s.addtimeslot(pid,time);
		if(k!=2)
		{
			session.setAttribute("newproblemerror","Problem with Database Please try agian...");
			response.sendRedirect("techniciannewproblems.jsp");
		}
		else
		{
			response.sendRedirect("techniciannewproblems.jsp");
		}
		
	}
}