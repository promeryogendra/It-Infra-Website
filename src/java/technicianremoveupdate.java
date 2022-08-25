
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import technicianmethods.technicianmethods;

public class technicianremoveupdate extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		
		String id=(String)request.getParameter("id");
		String dept=(String)request.getParameter("dept");
		String msg=(String)request.getParameter("msg");
        technicianmethods a=new technicianmethods();
		int i=a.removeupdate(id,dept,msg);
		if(i==1)
		{
			response.sendRedirect("technicianeditupdates.jsp");
		}
		else
		{			
			response.sendRedirect("technicianeditupdates.jsp");
		}
      }
  }