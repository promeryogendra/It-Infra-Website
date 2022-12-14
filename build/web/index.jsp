<%
	HttpServletResponse httpResponse = (HttpServletResponse)response;
	httpResponse.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
	response.addHeader("Cache-Control", "post-check=0, pre-check=0");
	httpResponse.setHeader("Pragma","no-cache");
	httpResponse.setDateHeader ("Expires", 0);
	
	session =request.getSession(false);
	if(session.getAttribute("studentsession")!=null)
	{
		response.sendRedirect("studenthome.jsp");
	}
	if(session.getAttribute("adminsession")!=null)
	{
		response.sendRedirect("adminhome.jsp");
	}
	if(session.getAttribute("clerksession")!=null)
	{
		response.sendRedirect("technicianhome.jsp");
	}
	%>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
<html>
<head>
    <style type="text/css">
    body{
        margin:0;
        color:#6a6f8c;
        background:#c8c8c8;
        font:600 16px/18px 'Open Sans',sans-serif;
    }
    *,:after,:before{box-sizing:border-box}
    .clearfix:after,.clearfix:before{content:'';display:table}
    .clearfix:after{clear:both;display:block}
    a{color:inherit;text-decoration:none}

    .login-wrap{
        margin:auto;
        margin-top: 10px;
        max-width:525px;
        min-height:620px;
        position:relative;
        box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
    }
    .login-html{
        width:100%;
        height:100%;
        position:absolute;
        padding:50px 70px 50px 70px;
        background:rgba(2, 28, 97, 0.9);
    }
    .login-html .sign-in-htm,
    .login-html .sign-up-htm{
        top:0;
        left:0;
        right:0;
        bottom:0;
        position:absolute;
        transform:rotateY(180deg);
        backface-visibility:hidden;
        transition:all .4s linear;
    }
    .login-html .sign-in,
    .login-html .sign-up,
    .login-form .group .check{
        display:none;
    }
    .login-html .tab,
    .login-form .group .label,
    .login-form .group .button{
        text-transform:uppercase;
    }
    .login-html .tab{
        font-size:22px;
        margin-right:15px;
        padding-bottom:5px;
        margin:0 15px 10px 0;
        display:inline-block;
        border-bottom:2px solid transparent;
    }
    .login-html .sign-in:checked + .tab,
    .login-html .sign-up:checked + .tab{
        color:#fff;
        border-color:#1161ee;
    }
    .login-form{
        min-height:345px;
        position:relative;
        perspective:1000px;
        transform-style:preserve-3d;
    }
    .login-form .group{
        margin-bottom:15px;
    }
    .login-form .group .label,
    .login-form .group .input,
    .login-form .group .button{
        width:100%;
        color:#fff;
        display:block;
    }
    .login-form .group .input,
    .login-form .group .button{
        padding:15px 20px;
        border-radius:25px;
        background:rgba(255,255,255,.1);
    }
    .login-form .group input[data-type="password"]{
        text-security:circle;
        -webkit-text-security:circle;
    }
    .login-form .group .label{
        color:#aaa;
        font-size:12px;
    }
    .login-form .group .button{
        background:#1161ee;
    }
    .login-form .group label .icon{
        width:15px;
        height:15px;
        border-radius:2px;
        position:relative;
        display:inline-block;
        background:rgba(255,255,255,.1);
    }
    .login-form .group label .icon:before,
    .login-form .group label .icon:after{
        content:'';
        width:10px;
        height:2px;
        background:#fff;
        position:absolute;
        transition:all .2s ease-in-out 0s;
    }
    .login-form .group label .icon:before{
        left:3px;
        width:5px;
        bottom:6px;
        transform:scale(0) rotate(0);
    }
    .login-form .group label .icon:after{
        top:6px;
        right:0;
        transform:scale(0) rotate(0);
    }
    .login-form .group .check:checked + label{
        color:#fff;
    }
    .login-form .group .check:checked + label .icon{
        background:#1161ee;
    }
    .login-form .group .check:checked + label .icon:before{
        transform:scale(1) rotate(45deg);
    }
    .login-form .group .check:checked + label .icon:after{
        transform:scale(1) rotate(-45deg);
    }
    .login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
        transform:rotate(0);
    }
    .login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
        transform:rotate(0);
    }

    .hr1{
        height:2px;
        margin:20px 0 50px 0;
        background:rgba(255,255,255,.2);
    }
    .hr2{
        height:2px;
        margin:30px 0 20px 0;
        background:rgba(255,255,255,.2);
    }
    .foot-lnk{
        text-align:center;
    }
    .foot-lnk:hover{
        cursor: pointer;
    }
    .king:hover{
        cursor: pointer;
    }
    .button:hover{
        cursor: pointer;
    }
    .sign-in-htm{
        margin-top: 40px;
    }.tab:hover
    {
        cursor: pointer;
    }
	.select-field{
	display: inline-block;
	width: 100%;
	border-radius: 9px;
	font-size: 25px;
	max-width: 465px;
	height: 45px;
	margin-right: 0px;
	margin-top:-20px;
	margin-bottom: 20px;
	padding:0px;
	background-color: #839dca;
	position: relative;
}
.select-field:after
{
	content: "";
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
	margin: 0px;
	padding-left: 0px 45px 0px 15px;
	border:0px;
	background-color: transparent;;
	font-family: 'osbold';
	font-size: 25px;
	content: #bdc3d1;
	position: relative;;
	z-index: 3;}
    </style>
</head>
<body>   
<div class="login-wrap">
    <div class="login-html">
        <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label style="margin-left: 140px;font-size: 35px;" for="tab-1" class="tab">IT INFRA</label>
        <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
        <div class="login-form">
            <div class="sign-in-htm">
				<form action="login" method="post">
					<p style="margin-top:-10px;" class="label">select role</p>
					<br>
					<div id="none" class="select-field">
						<select required name="role">
							  <option value="student">Student</option>
							  <option value="admin">Admin</option>
							  <option value="clerk">Technician</option>
						</select>
					</div>
					<div class="group">
						<label for="user" class="label">Username</label>
						<input name="username" id="user" type="text" class="input"placeholder="Enter Id ex:-prasanth"  REQUIRED>
					</div>
					<div class="group">
						<label for="pass" class="label">Password</label>
						<input name="password" id="pass" type="password" class="input" data-type="password" placeholder="Enter Password ex:-8FY8J" required>
					</div>
					<br>
					<div class="group">
						<input type="submit" class="button" value="Sign In">
					</div>
				</form>
				<%
					String loginerror="",color="red";
					loginerror=(String)session.getAttribute("username_password_status");
					if(loginerror==null)
					{
						loginerror="Please Fill All Fileds";
						color="green";
					}
					session.setAttribute("username_password_status",null);
				%>
				<p style="text-align:center ; color:<%=color%>;text-size:26px" text=" "> <%=" "+loginerror%></p>
                <div class="hr1"></div>
               <!---<div class="foot-lnk">
                    <a href="forgot">Forgot Password?</a>
                </div>--->
            </div>
        </div>
    </div>
</div>
</body>
</html>