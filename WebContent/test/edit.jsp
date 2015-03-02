<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<% 		  
String tstname = request.getParameter("tstname");
String tstch = request.getParameter("tstch");		  
		  try{
		  	  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();

				  
				int i = statement.executeUpdate("UPDATE TEST_MASTER SET TEST_CHARGE='"+tstch+"',ENT_BY='"+session.getAttribute("uid")+"' WHERE TEST_NAME='"+tstname+"'");
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
<a class="button buttonBlue" href="javascript:sendRequest('../test/test.jsp','middleFullWidth')">
														<span>Back</span>
												</a>


</center>
