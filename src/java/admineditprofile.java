
import adminmethods.adminmethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class admineditprofile extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		
		String user=(String)request.getParameter("user");
		String pass1=(String)request.getParameter("pass1");
		String pass2=(String)request.getParameter("pass2");
		if(!pass1.equals(pass2))
		{
			session.setAttribute("editerror", "Password should not match.....");
			response.sendRedirect("admineditprofile.jsp");
		}
		else
		{
			adminmethods a=new adminmethods();
			int k=a.editprofile(user,pass1);
			if(k==2)
			{
				session.setAttribute("editerror", "Profile updated successfully.....");
				session.setAttribute("adminsession", user);
				response.sendRedirect("admineditprofile.jsp");
			}
			else
			{
				session.setAttribute("editerror", "Problem with Database.....");
				response.sendRedirect("admineditprofile.jsp");
			}
		}
      }
  }