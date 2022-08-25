import adminmethods.adminmethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class adminaddtechnician extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String fullname = request.getParameter("name");
		String gmail = request.getParameter("gmail");
		String phone = request.getParameter("phone");
		
		adminmethods s=new adminmethods();
		int k=s.addtechnician(username,password,fullname,gmail,phone);
		if(k==1)
		{
			session.setAttribute("techerror","Technician already exists...");
			response.sendRedirect("adminaddtechnician.jsp");
		}
		else if(k==2)
		{
			session.setAttribute("techerror","Technician successfully added.....");
			response.sendRedirect("adminaddtechnician.jsp");
		}
		else
		{
			session.setAttribute("techerror","Problem with inserting data into table...");
			response.sendRedirect("adminaddtechnician.jsp");
		}
	}
}