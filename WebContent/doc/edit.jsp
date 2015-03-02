<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<% 		  
String stfid = request.getParameter("stfid");
String deptid = request.getParameter("dept");		  
		  try{
		  	  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();

				  
				int i = statement.executeUpdate("UPDATE DOCTOR_MASTER SET DEPT_ID='"+deptid+"',ENT_BY='"+session.getAttribute("uid")+"' WHERE STAFF_ID='"+stfid+"'");
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
<a class="button buttonBlue" href="javascript:sendRequest('../doc/doctor.jsp','middleFullWidth')">
														<span>Back</span>
</a>



</center>
