import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import technicianmethods.technicianmethods;
public class technicianeditslot extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String pid=(String)request.getParameter("pid");
		String newslot=(String)request.getParameter("newslot");
		
		technicianmethods s=new technicianmethods();
		int k=s.editslot(pid,newslot);
		if(k!=2)
		{
			session.setAttribute("successproblemerror","Problem with Database Please try agian...");
			response.sendRedirect("technicianoldproblems.jsp");
		}
		else
		{
			response.sendRedirect("technicianoldproblems.jsp");
		}
		
	}
}