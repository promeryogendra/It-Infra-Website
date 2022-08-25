import adminmethods.adminmethods;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import technicianmethods.technicianmethods;
public class adminaddupdate extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String uabout = request.getParameter("uabout");
        String udesc = request.getParameter("udesc");
		
		adminmethods s=new adminmethods();
		int k=s.insertupdate(uabout,udesc);
		if(k==0 || k==2)
		{
			session.setAttribute("updateerror","Problem with Database Please try agian...");
			response.sendRedirect("adminaddupdates.jsp");
		}
		else if(k==1)
		{
			session.setAttribute("updateerror","Update inserted successfully...");
			response.sendRedirect("adminaddupdates.jsp");
		}
		else
		{
			response.sendRedirect("adminaddupdates.jsp");
		}
	}
}