<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<%try{ 		  
String dept = request.getParameter("dname");
String deptid = request.getParameter("did");		  
		 
		  	  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();

				  
				int i = statement.executeUpdate("UPDATE DEPARTMENT_MASTER SET DEPARTMENT='"+dept+"',ENT_BY='"+session.getAttribute("uid")+"' WHERE DEPT_ID='"+deptid+"'");
							if(i!=0){%>
				
				<center>
				<b>
				One Row Updated</b>
				</center>
				
				<%}}
				catch(Exception E){
				out.println("Data Missing OR Incorrect");
				}
%>


<div class="clear"></div>
<center> 

<a class="button buttonBlue" href="javascript:sendRequest('../dept/dept.jsp','middleFullWidth')">
														<span>Back</span>
</a>



</center>
