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
	.sub_head
	{
		text-align: center;
		text-decoration: underline;
		color: #a88011;
		margin-top: -6px;
		font-size: 40px;
		font-family:cursive;
	}
	.body_space
	{
		border:4px solid #1b89e2;
		height: 400px;
		margin: 10px 30px 10px 30px;
		background: #28282f;
		font-size: 20px;
		overflow-y: scroll;
		padding-left: 50px;
	}
	.message
	{
		font-size: 30px;
		color: #c5ffff;
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
			<a  href="studentproblems.jsp">Problems</a>	
			<a class="active"  href="studentnotifications.jsp">Notifications</a>
			<a href="studentnewproblem.jsp">New Problem</a>
			<a href="studentprofile.jsp">Profile</a>
		</div>
		<h1 class="sub_head">Notifications</h1>
		<div class="body_space">
			<ul id="noticedesign">
			<%
				studentmethods s=new studentmethods();
				List list=s.getnotifications();
				if(list.isEmpty())
				{%>
					<h3 style="text-align: center"> no notifications</h3>
				<%}
				else
				{
					Iterator<String> itr=list.iterator();
					while(itr.hasNext())
					{
						String msg=itr.next();
						if(msg==null)
							msg="None";
						String link=itr.next();%>
						<li class="message"><%=msg%>
						<%
						if(link==null || link.isEmpty())
						{%>
							<br>&emsp;&emsp;==>No Link Available</li><br>
						<%}
						else
						{%>
						<br>&emsp;&emsp;==><a style="color: #0000f0;font-size: 20px;" href="<%=link%>"><%=link%></a></li><br>
						<%}
					}
				}%>
			</ul>
		</div>
    </body>
</html>
