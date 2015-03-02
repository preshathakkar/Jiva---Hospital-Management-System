<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<%
   String uid = request.getParameter("uid");
		  
		try{
			  InitialContext ctx = new InitialContext();
			  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
			  Connection conn = ds.getConnection("krazy4","deena111");
			  Statement statement = conn.createStatement();
			

			  
			int i = statement.executeUpdate("DELETE FROM USER_PHS WHERE U_ID='"+uid+"'");
		if(i!=0){%>
				
				<center>
				<b>
				One Row Deleted</b>
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