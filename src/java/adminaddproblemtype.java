import adminmethods.adminmethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class adminaddproblemtype extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String type = request.getParameter("type");
		
		adminmethods s=new adminmethods();
		int k=s.addproblemtype(type);
		if(k==1)
		{
			session.setAttribute("typeerror","Problem Type already exists...");
			response.sendRedirect("adminaddproblemtype.jsp");
		}
		else if(k==2)
		{
			session.setAttribute("typeerror","Problem Type successfully added.....");
			response.sendRedirect("adminaddproblemtype.jsp");
		}
		else
		{
			session.setAttribute("typeerror","Problem with inserting data into table...");
			response.sendRedirect("adminaddproblemtype.jsp");
		}
	}
}