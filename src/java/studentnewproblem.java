import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import studentmethods.studentmethods;
public class studentnewproblem extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String ptype = request.getParameter("ptype");
        String pdesc = request.getParameter("pdesc");
		String id=(String)session.getAttribute("studentsession");
		studentmethods s=new studentmethods();
		int k=s.checkproblem(ptype,id,pdesc);
		if(k==0)
		{
			session.setAttribute("createerror","Problem with problem type, Please check Again...");
			response.sendRedirect("studentnewproblem.jsp");
		}
		else if(k==1)
		{
			session.setAttribute("createerror","This type problem is already posted please consult staff...");
			response.sendRedirect("studentnewproblem.jsp");
		}
		else if(k==3 || k==2)
		{
			System.out.println(k);
			session.setAttribute("createerror","Problem with inserting data into table...");
			response.sendRedirect("studentnewproblem.jsp");
		}
		else if(k==4)
		{
			session.setAttribute("createerror","Problem posted successfully....");
			response.sendRedirect("studentproblems.jsp");
		}
	}
}