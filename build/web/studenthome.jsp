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
	  background-color: #2196F3;
	  color: white;
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
		width: 45%;
		height: 410px;
		margin-top: 20px;
		margin-left: 20px;
		border:2px solid black;
		border-radius: 20px;
		background: #477d70;
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
	margin-left:10px;
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
	.t1
	{
		text-align: center;
		width: 75%;
		margin-top: 100px;
		margin-left:60px;
		border: 2px solid white;
		border-radius: 20px;
		padding:10px;
		color: #006600;
	}
	.t2
	{
		text-align: center;
		width: 82%;
		margin-top: 101px;
		margin-left:40px;
		border: 2px solid white;
		border-radius: 20px;
		padding:10px;
		color: #006600;
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
			<a class="active" href="studenthome.jsp">Home</a>
			<a href="studentproblems.jsp">Problems</a>	
			<a href="studentnotifications.jsp">Notifications</a>
			<a href="studentnewproblem.jsp">New Problem</a>
			<a href="studentprofile.jsp">Profile</a>
		</div>
		<div>
			<div class="left-half">
				<h3 class="t1">Solutions which stops you from diversion,delete the tension and makes you the happiest person</h3>
				<h3 class="t2">Solution not only for your problem but also to "you".</h3>
			</div>
			<div class="right-half">
				<div class="info">
					<h3 align="center" style="background-color:navy;color:white;border-radius:10px;padding:10px;">NEW UPDATES</h3>
					<br>
					<marquee  class="messages" scrollamount="10"  height=330 direction="up">
						<ul id="noticedesign">
						<%
							studentmethods s=new studentmethods();
							List list=s.getupdates();
							if(list.isEmpty())
							{%>
								<h3 style="text-align: center"> no updates</h3>
							<%}
							else
							{
								Iterator<String> itr=list.iterator();
								while(itr.hasNext())
								{
									%>
									<li><%=(String)itr.next()%><br>&emsp;&emsp;<%=(String)itr.next()%></li><br>
									<%
								}
							}%>
						
					</ul>
						</marquee>
					</div>
			</div>
		</div>
    </body>
</html>
