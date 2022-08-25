<%@page import="itinfra.student"%>
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
		font-size: 40px;
		font-family:cursive;
	}
	.all
	{
		overflow-y: scroll;
		height: 490px;
	}
	.body_space
	{
		border:4px solid #1b89e2;
		height: 420px;
		background: #28282f;
		margin-left: 150px;
		font-size: 20px;
		width: 1100px;
		padding-left: 50px;
	}
	table{
		height:100%;
		width: 95%;
		color: #00c5ff;
		font-family: cursive;
		font-style:italic;
		font-size:30px;
	
	}
	.row{
		height: 20px;
	}
	.col1{
		width: 50%; 
		height: 20px;
	}
	.col2{
		width: 50%; 
		height: 20px; 
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
			<a class="active" href="studentprofile.jsp">Profile</a>
		</div>
		<div class="all">
		
		<h1 class="sub_head">PROFILE</h1>
		<div class="body_space">
			<table>
				<%studentmethods s=new studentmethods();
				student st=s.getprofile((String)session.getAttribute("studentsession"));%>
				
				<tr class="row">
					<td class="col1">
					name
					</td>
					<td class="col2">
						:&emsp; <%=st.getSname() %>
					</td>
				</tr>
				<tr class="row">
					<td class="col1">
					id
					</td>
					<td  class="col2">
					:&emsp; <%=st.getSid()%>
					</td>
				</tr>
				<tr class="row">
					<td class="col1">
					age
					</td>
					<td class="col2">
					:&emsp; <%=st.getSage() %>
					</td>
				</tr>
				<tr class="row">
					<td class="col1">
					mail
					</td>
					<td class="col2">
					:&emsp; <%=st.getSmail() %>
					</td>
				</tr>
				<tr class="row">
					<td class="col1">
					phone
					</td>
					<td class="col2">
					:&emsp; <%=st.getSphone() %>
					</td>
				</tr>
				<tr class="row">
					<td class="col1">
					branch
					</td>
					<td class="col2">
					:&emsp; <%=st.getBranch() %>
					</td>
				</tr>
				<tr class="row">
					<td class="col1">
					batch
					</td>
					<td class="col2">
					:&emsp; <%=st.getSbatch() %>
					</td>
				</tr>
				<tr class="row">
					<td class="col1">
					laptop-serial-no
					</td>
					<td class="col2">
					<%String msg=st.getLaptap_serial_no();
					if( msg==null || msg.isEmpty())
					{
						msg="None";
					}
					%>
					:&emsp; <%=msg%>
					</td>
				</tr>
				<tr class="row">
					<td class="col1">
					adapter-serial-no
					</td>
					<%msg=st.getAdapter_serial_number();
					if( msg==null || msg.isEmpty())
					{
						msg="None";
					}
					%>
					<td class="col2">
					:&emsp; <%=msg	%>
					</td>
				</tr>
			</table>
		</div>
		</div>
    </body>
</html>
