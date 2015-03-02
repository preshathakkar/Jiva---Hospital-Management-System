<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<% 		  
String name = request.getParameter("name");
String pass = request.getParameter("pass");		  
		  try{
		  	  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();

				  
				int i = statement.executeUpdate("UPDATE USER_PHS SET PASSWORD='"+pass+"',ENT_BY='"+session.getAttribute("uid")+"' WHERE USERNAME='"+name+"'");
							if(i!=0){%>
				
				<center>
				<b>
				One Row Updated</b>
				</center>
				
				<%}
				}
				catch(Exception E){
				out.println("Data Missing OR Incorrect");
				}
%>


<div class="clear"></div>
<center> 
<a class="button buttonBlue" href="javascript:sendRequest('../user/user.jsp','middleFullWidth')">
														<span>Back</span>
												</a>
</center>
