<%@page import="studentmethods.studentmethods"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
	.sub_head
	{
		text-align: center;
		text-decoration: underline;
		color: #a88011;
		font-size: 40px;
		margin-top: -6px;
		font-family:cursive;
	}
	.body_space
	{
		border:1px solid #1b89e2;
		height: 401px;
		width: 1000px;
		margin-left:180px;
		font-size: 20px;
		background: #162b39;
		/*overflow-y: scroll;*/
		padding-left: 50px;
	}
	.select-field{
		width: 100%;
		border-radius: 9px;
		font-size: 25px;
		max-width: 465px;
		float:right;
		margin-right: 120px;
		margin-top: -30px;
		height: 45px;
		background-color: #839dca;
		position: relative;
	}
	.select-field:after
	{
		width: 0px;
		height: 0px;
		border-top:9px solid #bdc3d1;
		border-right: 8px solid transparent;
		border-left: 8px solid transparent;
		position: absolute;;
		top:27px;
		font-size: 25px;
		right: 15px;
		z-index: 2;
	}
	.select-field > select{
		float: left;
		width: 100%;
		height: 100%;
		border:0px;
		background-color: transparent;;
		font-family: 'osbold';
		font-size: 25px;
		position: relative;;
		z-index: 3;}
	.textarea {
		   resize: none;
		   font-size: 20px;
		   color:#05100c;
		   margin-top: 100px;
		   background: #9cb256;
		   font-weight: bold;
		   padding: 10px;
		}
	::placeholder { color:#666666; }
	.post{
		float: left;
		width:100px;
		height: 48px;
		border: none;
		border-radius: 5px;
		background-color: #4CAF50;
		color: white;
		cursor: pointer;
		margin-left: 380px;
		margin-top: 30px;
	}
	.post:hover {
		background-color: #45a049;
	}
	.label{
        text-transform:uppercase;
        width:100%;
        color:#fff;
		float: left;
		margin-top: 50px;
        display:block;
    }
	.textarea_class{
		 float : right;
		 margin-top:-150px;
		 margin-right: 110px;
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
			<a href="technicianoldproblems.jsp">OldProblems</a>
			<a  class="active" href="technicianaddnotifications.jsp">AddNotifications</a>
			<a href="technicianeditnotifications.jsp">EdiNotifications</a>
			<a href="technicianaddupdates.jsp">AddUpdates</a>
			<a href="technicianeditupdates.jsp">EditUpdates</a>
		</div>
		
		<h1 class="sub_head">Add New Notification</h1>
		<%
		studentmethods s=new studentmethods();
		List<String> list=s.getproblemtypes();
		Iterator<String> itr=list.iterator();
		int i=1;
		%>
		<div class="body_space">
			<form method="post" action="technicianaddnotification">
				
				<label for="user" style="margin-top:100px;" class="label">Notification Message</label>
				<div class="textarea_class">
					<textarea maxlength="200" class="textarea" name="nmsg" cols="39" rows="2" placeholder="Enter the notification message" required pattern=".{255}"></textarea>
				</div>
				<label for="user" style="margin-top:100px;" class="label">Notification Link</label>
				<div class="textarea_class">
					<textarea maxlength="200" class="textarea" name="nlink" cols="39" rows="2" placeholder="Enter the Link of notification with domain like http://www.google.com" pattern=".{255}"></textarea>
				</div>
				<input style="font-size:20px;" class="post" type="submit" value="Post">
			</form>
			<%
				String notificationerror,color="red";
				notificationerror=(String)session.getAttribute("notificationerror");
				if(notificationerror==null || notificationerror.isEmpty())
				{
					
					notificationerror="Please Fill All Fileds....";
					color="green";
				}
				if(notificationerror.equals("Notification inserted successfully....."))
				{
					color="green";
				}
				
				session.setAttribute("notificationerror",null);
			%>
			<p style="text-align:center;color:<%=color%>;text-size:26px;margin-top:375px;margin-right:110px;" text=" "> <%=notificationerror %></p>
		</div>
		
    </body>
</html>
