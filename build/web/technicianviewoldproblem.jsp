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
	if(session.getAttribute("clerksession")==null)
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
		height: 380px;
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
		
		float: right;
		width:100px;
		height: 48px;
		border: none;
		border-radius: 5px;
		background-color: #4CAF50;
		color: white;
		margin-right: 300px;
		margin-top: -50px;
		
		cursor: pointer;
	}
	.back_button:hover {
		background-color: #45a049;
	}
	.back_button1
	{
		width:150px;
		height: 48px;
		border: none;
		border-radius: 5px;
		background-color: #4CAF50;
		color: white;
		margin-left: 80px;
		margin-top: 20px;
		cursor: pointer;
	}
	.back_button1:hover {
		background-color: #45a049;
	}
	.back_button3
	{
		float: right;
		width:150px;
		height: 48px;
		border: none;
		border-radius: 5px;
		background-color: #4CAF50;
		color: white;
		margin-top: -50px;
		margin-right: 100px;
		cursor: pointer;
	}
	.back_button3:hover {
		background-color: #45a049;
	}
	.back_button4
	{
		
		float: right;
		width:100px;
		height: 48px;
		border: none;
		border-radius: 5px;
		background-color: #4CAF50;
		color: white;
		margin-right: 300px;
		
		cursor: pointer;
	}
	.back_button4:hover {
		background-color: #45a049;
	}
	.textarea {
		   resize: none;
		   font-size: 20px;
		   color:#05100c;
		   background: #9cb256;
		   font-weight: bold;
		   padding: 10px;
		}
	.label{
        text-transform:uppercase;
        width:100%;
        color:black;
		float: left;
        display:block;
    }
	.textarea_class{
		float:right;
		 margin-top:-60px;
		 margin-right:200px;
	}
</style>
    </head>
    <body>
        <div class="header">
			<a class="link" href="technicianhome.jsp" style="color:#d9de0d;">IT INFRA STRUCTURE</a>
			<form class="logoutform" action="logout" method="post">
				<input style="font-size:20px;" class="logout" type="submit" value="logout">
			</form>
		</div>
		<div class="topnav">
			<a class="active1" href="technicianhome.jsp">Home</a>
			<a href="techniciannewproblems.jsp">NewProblems</a>	
			<a  class="active" href="technicianoldproblems.jsp">OldProblems</a>
			<a href="technicianaddnotifications.jsp">AddNotifications</a>
			<a href="technicianeditnotifications.jsp">Editnotifications</a>
			<a href="technicianaddupdates.jsp">AddUpdates</a>
			<a href="technicianeditupdates.jsp">EditUpdates</a>
		</div>
		<div class="body_space">
			<h1 class="sub_head">Problem Details</h1>
			 <div class="row">
				<%
				
				String sid=(String)request.getParameter("sid");
				String ptype=(String)request.getParameter("ptype");
				String pid=(String)request.getParameter("pid");
				String pdesc=(String)request.getParameter("pdesc");
				String ptypestring=(String)request.getParameter("ptypestring");
				String pstatus=(String)request.getParameter("pstatus");
				String time=(String)request.getParameter("time");
				boolean i=true;
				if(pid==null || pid.isEmpty())
				{
					response.sendRedirect("studentproblems.jsp");
				}
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
						%>
						<div class="new_problem">
							<p class="para">
								ID &nbsp;NUMBER &emsp;&emsp;&emsp;&emsp;	 :&emsp; <%=sid%>
							</p>
							<p class="para">
								PROBLEM TYPE &emsp;&emsp;&emsp;:&emsp; <%=ptypestring%>
							</p>
							<p class="para">
							PROBLEM &nbsp;DESC &emsp;&emsp;&nbsp; :&emsp; <%=pdesc %>
							</p>
							<p class="para">
							PROBLEM STATUS &emsp;&nbsp;: &emsp; <span style="font-weight:bold;font-size:20px;color: <%=col%>;"><%=pstatus %></span>
							</p>
							<p class="para">
							TIME SLOT &nbsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp; :&emsp; <%=time %>
							</p>
							<%
								if(pstatus.equals("inprogress"))
								{%>
									<form method="post" action="technicianeditslot">
										<input type="hidden" name="sid" value="<%=sid%>"/>
										<input type="hidden" name="ptype" value="<%=ptype %>"/>
										<input type="hidden" name="pid" value="<%=pid  %>"/>
										<input type="hidden" name="pdesc" value="<%=pdesc %>"/>
										<input type="hidden" name="ptypestring" value="<%=ptypestring %>"/>
										<input type="hidden" name="pstatus" value="<%=pstatus %>"/>
										<input type="hidden" name="time" value="<%=time %>"/>
										<p class="para" style="margin-top:50px;">
											EDIT TIME SLOT &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;:&emsp;
										</p>
										<div class="textarea_class">
											<textarea maxlength="200" class="textarea" name="newslot" cols="25" rows="2" placeholder="Enter tiem slot like :- Dec 16 10:30 AM" required pattern=".{255}"></textarea>
										</div>
										<input style="font-size:15px;" class="back_button1" type="submit" value="EDIT SLOT">
									</form>
									<%}%>
							
							<%if(!pstatus.equals("success")){ %>
							<form action="technicianoldproblems.jsp" method="post">
								<input class="back_button" type="submit" value="BACK">
							</form>
							<form action="technicianmakeproblemsuccess" method="post">
								<input type="hidden" name="sid" value="<%=sid%>"/>
								<input type="hidden" name="ptype" value="<%=ptype %>"/>
								<input type="hidden" name="pid" value="<%=pid  %>"/>
								<input type="hidden" name="pdesc" value="<%=pdesc %>"/>
								<input type="hidden" name="ptypestring" value="<%=ptypestring %>"/>
								<input type="hidden" name="pstatus" value="<%=pstatus %>"/>
								<input type="hidden" name="time" value="<%=time %>"/>
								<input class="back_button3" type="submit" value="SUCCESS">
							</form>
							<%}
							else
							{%>
							<form action="technicianoldproblems.jsp" method="post">
								<input class="back_button4" type="submit" value="BACK">
							</form>
							<%}%>
						</div>
						<%
				}
				%>
			  </div> 
		</div>
    </body>
</html>
