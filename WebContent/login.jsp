<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true" import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*"%>
<html>
<head>
<title>login</title>

<link href="css/style.css" rel="stylesheet" type="text/css" />	
<link rel="stylesheet" type="text/css" href="css/superfish.css" media="screen">
<link href="css/log.css" rel="stylesheet" type="text/css" media="screen"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/hoverIntent.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>
<script type="text/javascript">
// Initialise menu plugin
jQuery(function(){
	jQuery('ul.sf-menu').superfish();
});
</script>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<div id="container">

		<!--Header begins-->
		<div id="headerContainer">
			
				<a class="logo" href="./index.html" title="Jiva">Jiva</a>
		
				<div class="clear"></div>
	
		</div>
		<!--Header ends-->
		
		<div id="contentContainer">
				
					<!--Menu begins-->
		  <div id="menubarborder">
					<div id="menubar">
					
							
							<ul class="sf-menu">
									<li><a href="./index.html">Home</a></li>
									<li><a href="./facilities.html">Facilities</a></li>
									<li><a href="./about-us.html" >About Us</a></li>
									<li><a href="./contact-us.html">Contact Us</a></li>
									<li class="current"><a href="./login.html">Login</a></li>

							</ul>
							
							
					</div>
					</div>
					<!--Menu ends-->
						
				<!--Content begins-->		
				<div id="content">
						
						<!--Middle part begins-->
						<div id="middlePart">
						<br>
                        <br>
                        <br>
								<!--Full width begins-->
								<div id="middleFullWidth">
                                		
                                	<center>
                                    <table class="logtable" align="center">
                                    <tr>
                                    <td>
                                    <img src="image/login.png" align="right">
										</td>
                                        <td>
                                    <div class="h1title">
													 
                                                    <h1>Login</h1>
											<span>For Staff Only</span>
									</div>
                                       </td>
                                       </tr>
                                       </table>
										  <form method="POST" action="login.jsp">
                                                	<center><p class="input-block first">
																<label>
																		Username:
																</label>
																<input type="text" name="username">
														</p></center>
														<center><p class="input-block">
																<label>
																		Password:
																</label>
																<input type="password" name="pass">
														</p></center>
                										<%
String user = request.getParameter("username");
//session.setAttribute("uname",user);
String pass = request.getParameter("pass");

InitialContext ctx = new InitialContext();
DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
Connection conn = ds.getConnection("krazy4","deena111");
Statement statement = conn.createStatement();
ResultSet rs  = statement.executeQuery("SELECT * FROM USER_PHS");


boolean userValidate, passValidate;
userValidate = false;
passValidate = false;
String name = " ";
if (rs != null)
{while (rs.next())
{name = rs.getString("Username");
if (name.equals(request.getParameter("username")))
{
userValidate = true;
session.setAttribute("uname", name);
session.setMaxInactiveInterval(60);
String passwd = rs.getString("password");
if (passwd.equals(request.getParameter("pass")))
{
passValidate = true;
session.setAttribute("pass",passwd);
}}}}
if (userValidate==true && passValidate == true)
{response.sendRedirect(response.encodeRedirectURL("success.jsp"));}
else if (userValidate==true && passValidate == false)
{out.println("Password Error! Pls Try Again.\n\n");
%> 
 <%}
else
{out.println("User Name Error! Pls Try Again.\n\n");}
%>
                										<br/>                                        
                                                        <input type="submit" value="Login"/>
                                                        
                                                        </form>
                                                
								 </center>
                                </div>
								<!--Full width ends-->
						</div>
						<!--Middle part ends-->
                        
                        <br>
                        <br>
                        <br>
                        
                        <br>
						<div class="clear"></div>
						
						
						
						<div class="clear"></div>
						
				</div>
				<!--Content ends-->	
				
				<!--Footer begins-->	
				<div id="footerPart">
						<div class="footerLeft">
								
						</div>
						<div class="footerRight">
								
						</div>
				</div>
				<!--Footer ends-->	
				
		</div>
		<!--ContentContainer ends-->	

</div>
<!--Container ends-->	

</body>
</html>