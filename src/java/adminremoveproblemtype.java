
import adminmethods.adminmethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class adminremoveproblemtype extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		
		String id=(String)request.getParameter("id");
		String type=(String)request.getParameter("type");
		String number=(String)request.getParameter("number");
		if(!number.equals("0"))
		{
			response.sendRedirect("adminremoveproblemtypeerror.jsp");
		}
		else{
			adminmethods a=new adminmethods();
			int k=a.removeproblemtype(id);
			response.sendRedirect("admineditproblems.jsp");
		}
      }
  }