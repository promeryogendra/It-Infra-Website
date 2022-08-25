
import adminmethods.adminmethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class adminremoveupdate extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		
		String id=(String)request.getParameter("id");
		String dept=(String)request.getParameter("dept");
		String msg=(String)request.getParameter("msg");
		
        adminmethods a=new adminmethods();
		int i=a.removeupdate(id,dept,msg);
		if(i==1)
		{
			response.sendRedirect("admineditupdates.jsp");
		}
		else
		{			
			response.sendRedirect("admineditupdates.jsp");
		}
      }
  }