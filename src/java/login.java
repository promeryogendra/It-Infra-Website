import adminmethods.adminmethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import studentmethods.studentmethods;
import technicianmethods.technicianmethods;
public class login extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String customer=(String)session.getAttribute("studentsession");
		String admin=(String)session.getAttribute("adminsession");
		String clerk=(String)session.getAttribute("clerksession");
		
        String name = request.getParameter("username");
        String pass = request.getParameter("password");
		String role=request.getParameter("role");
		if(role.equals("student"))
		{
			studentmethods m=new studentmethods();
			boolean state=m.login(name , pass);
			if(state)
			{
				session.setAttribute("adminsession",null);
				session.setAttribute("clerksession",null);
				session.setAttribute("studentsession",name);
				response.sendRedirect("studenthome.jsp");
			}
			else
			{
			   session.setAttribute("username_password_status","Incorect username or password.....");
			   response.sendRedirect("index.jsp");
			}  
		}
		else if(role.equals("clerk"))
		{
			technicianmethods m=new technicianmethods();
			if(m.login(name , pass))
			{
				session.setAttribute("studentsession",null);
				session.setAttribute("clerksession",name);
				session.setAttribute("adminsession",null);
				response.sendRedirect("technicianhome.jsp");
			}
			else
			{
			   out.println("Username or Password incorrect");
			   response.sendRedirect("index.jsp");
			}
		}
		else if(role.equals("admin"))
		{
			adminmethods m=new adminmethods();
			if(m.login(name , pass))
			{
				session.setAttribute("studentsession",null);
				session.setAttribute("clerksession",null);
				session.setAttribute("adminsession",name);
				response.sendRedirect("adminhome.jsp");
			}
			else
			{
			   out.println("Username or Password incorrect");
			   response.sendRedirect("index.jsp");
			}  
		}
		else
		{
			response.sendRedirect("index.jsp");
		}
	}
}