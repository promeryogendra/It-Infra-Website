
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import technicianmethods.technicianmethods;

public class technicianremovenotification extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		
		String id=(String)request.getParameter("id");
		String msg=(String)request.getParameter("msg");
		String link=(String)request.getParameter("link");
        technicianmethods a=new technicianmethods();
		int i=a.removenotification(id,msg,link);
		System.out.println(i);
		if(i==1)
		{
			response.sendRedirect("technicianeditnotifications.jsp");
		}
		else
		{			
			response.sendRedirect("technicianeditnotifications.jsp");
		}
      }
  }