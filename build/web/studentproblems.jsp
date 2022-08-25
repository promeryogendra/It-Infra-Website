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
		margin-bottom: 1px;
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
		margin-top: 50px;
		width:800px;
		background: #86bda1;
		padding: 20px;
		padding-left:70px;
	}
	.para
	{
		font-family: cursive;
		
	}
	.view_button
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
	.view_button:hover {
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
			<a  class="active" href="studentproblems.jsp">Problems</a>	
			<a href="studentnotifications.jsp">Notifications</a>
			<a href="studentnewproblem.jsp">New Problem</a>
			<a href="studentprofile.jsp">Profile</a>
		</div>
		<div class="body_space">
			<h1 class="sub_head">Problems</h1>
			 <div class="row">
				<%
				studentmethods s=new studentmethods();
				List<problem> list=s.getproblems((String)session.getAttribute("studentsession"));
				Iterator<problem> itr=list.iterator();
				boolean i=true;
				while(itr.hasNext())
				{
					i=false;
					problem p=itr.next();
					String col="green";
					if(p.getPstatus().equals("pending"))
					{
						col="red";
					}
					else if(p.getPstatus().equals("inprogress"))
					{
						col="#155bc3";
					}
					 System.out.println(p.getPdesc());
						%>
						<div class="new_problem">
							<p class="para">
								ID &nbsp;NUMBER &emsp;&emsp;&emsp;&emsp;	 :&emsp; <%=p.getSid()%>
							</p>
							<p class="para">
								PROBLEM TYPE &emsp;&emsp;&emsp;:&emsp; <%=p.getPtype() %>
							</p>
							<p class="para">
								PROBLEM &nbsp;DESC &emsp;&emsp;&nbsp; :&emsp; <%=p.getPdesc() %>
							</p>
							<p class="para">
								PROBLEM STATUS &emsp;&nbsp;: &emsp; <span style="font-weight:bold;font-size:20px;color: <%=col%>" ><%=p.getPstatus()%></span>
							</p>
							<form action="studentviewproblem.jsp" method="post">
								<input type="hidden" value="<%=p.ptid%>" name="ptid">
								<input type="hidden" value="<%=p.getSid() %>" name="sid">
								<input type="hidden" value="<%=p.getPtype() %>" name="ptype">
								<input type="hidden" value="<%=p.getPdesc() %>" name="pdesc">
								<input type="hidden" value="<%=p.getPstatus() %>" name="pstatus">
								<input class="view_button" type="submit" value="VIEW">
							</form>
						</div><br><br>
						<%
				}
				if(i)
				{
					%>
					<br>
					<h1 style="text-align: center;" >No Problem Posted.....</h1>
					<%
				}
				%>
			  </div> 
		</div>
    </body>
</html>
