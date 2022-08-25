import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import technicianmethods.technicianmethods;
public class technicianaddnotification extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String nmsg = request.getParameter("nmsg");
        String nlink = request.getParameter("nlink");
		if(nlink.isEmpty())
		{
			nlink="";
		}
		technicianmethods s=new technicianmethods();
		int k=s.insertnotification(nmsg,nlink);
		if(k==0 || k==2)
		{
			session.setAttribute("notificationerror","Problem with Database Please try agian...");
			response.sendRedirect("technicianaddnotifications.jsp");
		}
		else if(k==1)
		{
			session.setAttribute("notificationerror","Notification inserted successfully.....");
			response.sendRedirect("technicianaddnotifications.jsp");
		}
		else
		{
			response.sendRedirect("technicianaddnotifications.jsp");
		}
	}
}