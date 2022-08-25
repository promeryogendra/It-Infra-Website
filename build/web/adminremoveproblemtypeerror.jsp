<%@page import="adminmethods.adminmethods"%>
<%@page import="technicianmethods.technicianmethods"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%
	HttpServletResponse httpResponse = (HttpServletResponse)response;
	httpResponse.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
	response.addHeader("Cache-Control", "post-check=0, pre-check=0");
	httpResponse.setHeader("Pragma","no-cache"); 
	httpResponse.setDateHeader ("Expires", 0);
	session =request.getSession(false);
	if(session.getAttribute("adminsession")==null)
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
	.body_space
	{
		border:1px solid #1b89e2;
		height: 300px;
		width: 70%;
		margin-left: 15%;
		margin-right: 15%;
		font-size: 20px;
		background: #66978b;
		padding-top: 20px;
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
	
	.back_button
	{
		width:100px;
		height: 48px;
		border: none;
		border-radius: 5px;
		background-color: #4CAF50;
		color: white;
		margin-top: 20px;
		cursor: pointer;
		margin-left: 150px;
	}
	.back_button:hover {
		background-color: #45a049;
	}
	.row
	{
		padding-left: 260px;
	}
</style>
    </head>
    <body>
        <div class="header">
			<a class="link" href="adminhome.jsp" style="color:#d9de0d;">IT INFRA STRUCTURE</a>
			<form class="logoutform" action="logout" method="post">
				<input style="font-size:20px;" class="logout" type="submit" value="logout">
			</form>
		</div>
		<div class="topnav">
			<a class="active1" href="adminhome.jsp">Home</a>	
			<a href="adminaddtechnician.jsp">AddTechnician</a>
			<a href="adminaddproblemtype.jsp">AddProblemType</a>
			<a class="active" href="admineditproblems.jsp">EditProblemType</a>
			<a href="admineditprofile.jsp">EditProfile</a>
			<a href="adminaddupdates.jsp">AddUpdates</a>
			<a href="admineditupdates.jsp">EditUpdates</a>
			<a href="adminviewproblems.jsp">ViewProblemsList</a>
		</div>
		<h1 class="sub_head">Work Status</h1>
		<div>
			<div class="body_space">
				<h1 class="sub_head">Problem with removing Problem type</h1>
				
				<h2 style="text-align: center;">You are not Allowed to remove this problem.Because still some problem under this type are not solved.</h2>
			</div>
			
		</div>
    </body>
</html>
