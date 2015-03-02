<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>

<table class="logtable" align="center" width="100%">
						
<%
		  String stfid = request.getParameter("stfid");
		  try{
				//response.setContentType("text/html");
				 // PrintWriter out = response.getWriter();
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  String strSQL="SELECT * FROM STAFF_MASTER WHERE STAFF_ID='"+stfid+"')";
				  ResultSet rs = statement.executeQuery(strSQL);
				  //List datalist = new ArrayList();
				  
				  while(rs.next()){
%>
						
						<tr>
						<td>First Name</td>
						<td><%=request.getAttribute("FNAME")%></td>
						</tr>
						<tr>
						<td>Last Name </td>
						<td><%=request.getAttribute("LNAME")%></td>
						</tr>
						<tr>
						<td>Salary</td>
						<td><%=request.getAttribute("SALARY")%></td>
						</tr>
		
				
						
						<%}
}
catch(Exception E){
out.println("Data Missing OR Incorrect");
}
%>
</table>				 
<div class="clear"></div>
<center> 
<a class="button buttonBlue" href="javascript:sendRequest('../staff/staff.jsp','middleFullWidth')">
														<span>Back</span>
												</a>

</center>

 
				