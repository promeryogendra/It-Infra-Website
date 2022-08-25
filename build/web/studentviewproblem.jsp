<%@page import="itinfra.problem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="studentmethods.studentmethods"%>
<%
	HttpServletResponse httpResponse = (HttpServletResponse)response;
	httpResponse.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
	response.addHeader("Cache-Control", "post-check=0, pre-check=0");
	httpResponse.setHeader("Pragma","no-cache"); 
	httpResponse.setDateHeader ("Expires", 0);
	
	session =request.getSession(false);
	if(session.getAttribute("studentsession")==null)
	{
		response.sendRedirect("index.jsp");
	}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
     <style>
	.cont{
		width: 95%;
		margin: 0 auto;
	}
	.header{
		text-align: center;
		font-size: 81px;
		width:100%;
		font-family: serif;
		background-color: #1e5e25;;
	}
	.logout{
		float: right;
		width:100px;
		height: 48px;
		border: none;
		border-radius: 5px;
		background-color: #4CAF50;
		color: white;
		cursor: pointer;
	}
	.logout:hover {
		background-color: #45a049;
	}
	*{
		box-sizing: border-box;
	}
	body {
	  margin: 0;
	  font-family: Arial, Helvetica, sans-serif;
	}
	.topnav {
	  overflow: hidden;
	  background-color: #e9e9e9;
	}

	.topnav a {
	  float: left;
	  display: block;
	  color: black;
	  text-align: center;
	  padding: 14px 16px;
	  text-decoration: none;
	  font-size: 17px;
	}

	.topnav a:hover {
	  background-color: #ddd;
	  color: black;
	}

	.topnav a.active {
	  background-color: #86c3f4;
	  color: white;
	}
	.active1{
		background: #beb552;
	}
	.link {
		text-decoration: none;
	}
	.topnav .search-container {
	  float: right;
	}

	.topnav input[type=text] {
	  padding: 6px;
	  margin-top: 8px;
	  font-size: 17px;
	  border: none;
	}

	.topnav .search-container button {
	  float: right;
	  padding: 6px 10px;
	  margin-top: 8px;
	  margin-right: 16px;
	  background: #ddd;
	  font-size: 17px;
	  border: none;
	  cursor: pointer;
	}

	.topnav .search-container button:hover {
	  background: #ccc;
	}

	@media screen and (max-width: 600px) {
	  .topnav .search-container {
		float: none;
	  }
	  .topnav a, .topnav input[type=text], .topnav .search-container button {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		margin: 0;
		padding: 14px;
	  }
	  .topnav input[type=text] {
		border: 1px solid #ccc;  
	  }
	}

	.subm{
			width:160px;
			height: 48px;
			border: none;
			font-size: 20px;
			margin-left:180px;
			border-radius: 12px;
			border-radius: 5px;
			background-color: #ff9800;
			color: black;
			cursor: pointer;
		}
	.subm:hover {
		background-color: #45a049;
	}
	.left-half{
		width: 50%;
		float: left;
		border: 1px solid black;
	}
	.right-half{
		width: 50%;
		float: right;
	}
	.info{
    border-left: 2px solid teal; 
	border-left-color: tomato;
    color:navy;
	margin-left:20px;
	margin-right:20px;
	margin-top: 20px;
	margin-bottom: 20px;
	background: #e0e1b7;
    border-radius: 14px;
    width: 650px;
    }
	.messages{
		font-size: 20px;
		padding-left:  40px;
		padding-right: 10px;
		word-break:keep-all
	}
	.body_space
	{
		width: 100%;
		height:489px;
		background: white;
		overflow-y: scroll;
	}
	.sub_head
	{
		text-align: center;
		text-decoration: underline;
		color: #a88011;
		font-size: 40px;
		margin-top: -6px;
		font-family:cursive;
	}
	.new_problem
	{
		display: table;
		border:2px solid black;
		border-radius: 50px;
		margin-left:280px;
		width:800px;
		max-width:800px;
		background: #86bda1;
		padding:20px;
		padding-left: 70px;
	}
	.para
	{
		font-family: cursive;
		
	}
	.back_button
	{
		width:100px;
		height: 48px;
		border: none;
		border-radius: 5px;
		background-color: #4CAF50;
		color: white;
		margin-left: 280px;
		cursor: pointer;
	}
	.back_button:hover {
		background-color: #45a049;
	}
</style>
    </head>
    <body>
        <div class="header">
			<a class="link" href="studenthome.jsp" style="color:#d9de0d;">IT INFRA STRUCTURE</a>
			<form class="logoutform" action="logout" method="post">
				<input style="font-size:20px;" class="logout" type="submit" value="logout">
			</form>
		</div>
		<div class="topnav">
			<a class="active1" href="studenthome.jsp">Home</a>
			<a href="studentproblems.jsp">Problems</a>	
			<a href="studentnotifications.jsp">Notifications</a>
			<a href="studentnewproblem.jsp">New Problem</a>
			<a href="studentprofile.jsp">Profile</a>
		</div>
		<div class="body_space">
			<h1 class="sub_head">Problem Details</h1>
			 <div class="row">
				<%
				
				String ptid=(String)request.getParameter("ptid");
				String sid=(String)request.getParameter("sid");
				String ptype=(String)request.getParameter("ptype");
				String pdesc=(String)request.getParameter("pdesc");
				String pstatus=(String)request.getParameter("pstatus");
				boolean i=true;
				if(ptid==null || ptid.isEmpty())
				{
					response.sendRedirect("studentproblems.jsp");
				}
				studentmethods s=new studentmethods();
				String timeslot=s.getslot(ptid);
				if(true)
				{
					i=false;
					String col="green";
					if(pstatus.equals("pending"))
					{
						col="red";
					}
					else if(pstatus.equals("inprogress"))
					{
						col="#155bc3";
					}
					 System.out.println(pdesc);
						%>
						<div class="new_problem">
							<p class="para">
								ID &nbsp;NUMBER &emsp;&emsp;&emsp;&emsp;	 :&emsp; <%=sid%>
							</p>
							<p class="para">
								PROBLEM TYPE &emsp;&emsp;&emsp;:&emsp; <%=ptype%>
							</p>
							<p class="para">
							PROBLEM &nbsp;DESC &emsp;&emsp;&nbsp; :&emsp; <%=pdesc %>
							</p>
							<p class="para">
							PROBLEM STATUS &emsp;&nbsp;: &emsp; <span style="font-weight:bold;font-size:20px;color: <%=col%>;"><%=pstatus %></span>
							</p>
							<p class="para">
								TIME &nbsp;SLOT &emsp;&emsp;&emsp;&emsp;&nbsp;: &emsp; <%=timeslot %>
							</p>
							<form action="studentproblems.jsp" method="post">
								<input class="back_button" type="submit" value="BACK">
							</form>
						</div>
						<%
				}
				%>
			  </div> 
		</div>
    </body>
</html>
