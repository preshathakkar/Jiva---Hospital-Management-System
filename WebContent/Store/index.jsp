<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true" errorPage="./error.jsp" import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*"%>
<html>
<head>
<title>Jiva</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />	
<link rel="stylesheet" type="text/css" href="../css/superfish.css" media="screen">
<link href="../css/log.css" rel="stylesheet" type="text/css" media="screen"/>

<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/superfish.js"></script>
<script type="text/javascript" src="../js/show-message.js"></script>
<script type="text/javascript">
// Initialise menu plugin
jQuery(function(){
	jQuery('ul.sf-menu').superfish();
});
</script>	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%if((session.getAttribute("role").toString().compareTo("6")!=0)&&(session.getAttribute("uid")!=null)){out.print("Invalid Entry : Security Breach");}
else{
 %>

<div id="container">

		<!--Header begins-->
		<div id="headerContainer">
			
				<a class="logo" href="../index.html" title="Jiva">Jiva</a>
		
				<div class="clear"></div>
	
		</div>
		<!--Header ends-->
		<div id="sidebar">
		<a href="../logout.jsp">Logout</a>
		</div>
		
		<div id="contentContainer">
				
					<!--Menu begins-->
					<div id="menubarborder">
					<div id="menubar">
					
							<ul class="sf-menu">
					<li  class="current"><a href="javascript:sendRequest('./main.jsp','middleFullWidth')">Home</a></li>

									
<li><a href="javascript:sendRequest('../inv/store.jsp','middleFullWidth')">Inventory</a></li>
                                                     </ul>
							
					</div>
					</div>
					<!--Menu ends-->
						
				<!--Content begins-->		
				<div id="content">
						
						<!--Middle part begins-->
						<div id="middlePart">
						
								<!--Full width begins-->
								<div id="middleFullWidth">
										
<img src="../images/bannerstore.png"/>										
								</div>
								<!--Full width ends-->
								
						</div>
						<!--Middle part ends-->

										</div>
				<!--Content ends-->	
				
				<!--Footer begins-->	
				<div id="footerPart">
						
					<a href="../logout.jsp">Logout</a>	
				</div>
				<!--Footer ends-->	
				
		</div>
		<!--ContentContainer ends-->	

</div>
<!--Container ends-->	
</body>
<%} %>
</html>