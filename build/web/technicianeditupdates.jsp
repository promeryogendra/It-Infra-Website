<%@page import="itinfra.update"%>
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
		width: 88%;
		margin-left: 6%;
		margin-right: 6%;
		font-size: 20px;
		background: #66978b;
		overflow-y: scroll;
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
	
div.table-title {
  display: block;
  margin: auto;
  max-width: 1170px;
  padding:5px;
}

.table-title h3 {
   color: #fafafa;
   font-size: 30px;
   font-weight: 400;
   font-style:normal;
   font-family: "Roboto", helvetica, arial, sans-serif;
   text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
   text-transform:uppercase;
}


/*** Table Styles **/
.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  height: 90px;
  width:100%;
  margin-left: -20px;
  padding:5px;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
}
 
th {
  color:#D5DDE5;;
  background:#1b1e24;
  border-bottom:4px solid #9ea7af;
  border-right: 1px solid #343a45;
  font-size:20px;
  padding:24px;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.5);
  vertical-align:middle;
}

th:first-child {
  border-top-left-radius:3px;
}
 
th:last-child {
  border-top-right-radius:3px;
  border-right:none;
}
  
tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color:#666B85;
  font-size:16px;
  font-weight:normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}
 
tr:hover td {
  background:#4E5066;
  color:#FFFFFF;
  border-top: 1px solid #22262e;
}
 
tr:first-child {
  border-top:none;
}

tr:last-child {
  border-bottom:none;
}
 
tr:nth-child(odd) td {
  background:#EBEBEB;
}
 
tr:nth-child(odd):hover td {
  background:#4E5066;
}

tr:last-child td:first-child {
  border-bottom-left-radius:3px;
}
 
tr:last-child td:last-child {
  border-bottom-right-radius:3px;
}
 
td {
  background:#FFFFFF;
  padding:20px;
  text-align:left;
  vertical-align:middle;
  font-weight:200;
  font-size:18px;
  overflow-y: auto;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}

th.text-left {
  text-align: left;
}
th.text-left1
{
	width:50px;
}
th.text-left2
{
	width:50px;
}
th.text-left3
{
	width:50px;
}
th.text-left4
{
	width:20px;
}
#cancel
{
		margin-left: 10px;
}
th.text-center {
  text-align: center;
}

th.text-right {
  text-align: right;
}

td.text-left1,td.text-left2,td.text-left3,td.text-left4 {
  text-align: left;
}

td.text-center {
  text-align: center;
}

td.text-right {
  text-align: right;
}
#cancel:hover{
	background:#d74a31
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
			<a href="technicianaddnotifications.jsp">AddNotifications</a>
			<a href="technicianeditnotifications.jsp">Editnotifications</a>
			<a href="technicianaddupdates.jsp">AddUpdates</a>
			<a  class="active"  href="technicianeditupdates.jsp">EditUpdates</a>
		</div>
		<h1 class="sub_head">Edit Updates</h1>
		
		<div class="body_space">
			<div class="table-title">
			<table border="1" class="table-fill">
				<thead>
					<tr>
						<th class="text-left1" height="5" width="300">S NO</th>
						<th class="text-left2" height="5" width="300">DEPARTMENT</th>
						<th class="text-left3" height="5" width="300">DESCRIPTION</th>
						<th class="text-left4" height="5" width="300">REMOVE</th>
					</tr>
				</thead>
				<tbody class="table-hover">
				<%int i=1;
				technicianmethods a=new technicianmethods();
				List list=a.getupdatesList();
				Iterator<update> itr=list.iterator();
				while(itr.hasNext())
					{
					update u=itr.next();
					%>
						<tr style="width:100%;height: 10px;">
							<TD class="text-left1" ><%=i++%></TD>
							<TD class="text-left2" ><%=u.getUdept() %></TD>
							<TD class="text-left3"><%=u.getUdesc() %></TD>
							<TD id="cancel" class="text-left4">
								<form action="technicianremoveupdate" method="post">
									<input type="hidden" name="id" value="<%=u.getUid() %>"/>
									<input type="hidden" name="dept" value="<%=u.getUdept() %>"/>
									<input type="hidden" name="msg" value="<%=u.getUdesc() %>"/>
									<input  type="image" src="images/cancel.png" name="remove" style="margin-left:60px;width:50px;height:50px;"/>
								</form>
							</TD>
							
						</tr><%
					}
					if(i==1){%>
						<tr style="width:100%;">
							<th class="text-left1" height="5" width="300" style="background:#EBEBEB;color:black;">EMPTY</th>
							<th class="text-left2" height="5" width="300" style="background:#EBEBEB;color:black;">EMPTY</th>
							<th class="text-left3" height="5" width="300" style="background:#EBEBEB;color:black;">EMPTY</th>
							<th class="text-left4" height="5" width="300" style="background:#EBEBEB;color:black;">EMPTY</th>
							</tr>
						<%}%>
				</tbody>
			</table>
		</div>
		</div>
		
    </body>
</html>
