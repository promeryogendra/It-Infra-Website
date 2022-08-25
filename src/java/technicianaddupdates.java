import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import technicianmethods.technicianmethods;
public class technicianaddupdates extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String uabout = request.getParameter("uabout");
        String udesc = request.getParameter("udesc");
		technicianmethods s=new technicianmethods();
		int k=s.insertupdate(uabout,udesc);
		if(k==0 || k==2)
		{
			session.setAttribute("updateerror","Problem with Database Please try agian...");
			response.sendRedirect("technicianaddupdates.jsp");
		}
		else if(k==1)
		{
			session.setAttribute("updateerror","Update inserted successfully...");
			response.sendRedirect("technicianaddupdates.jsp");
		}
		else
		{
			response.sendRedirect("technicianaddupdates.jsp");
		}
	}
}