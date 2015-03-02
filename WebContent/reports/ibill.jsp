<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>

<table class="logtable" align="center" width="100%">
						
<%
		  String ibid = request.getParameter("ibid");
		  String ipid = request.getParameter("ipid");
		  try{
				//response.setContentType("text/html");
				 // PrintWriter out = response.getWriter();
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  String strSQL="SELECT * FROM IN_BILL WHERE IN_BILL_ID='"+ibid+"' OR P_D_ID='"+ipid+"'";
				  ResultSet rs = statement.executeQuery(strSQL);
				  //List datalist = new ArrayList();
				  
				  while(rs.next()){
%>
						
						<tr>
						<td>Out Bill ID:</td>
						<td><%=rs.getString("OUT_BILL_ID")%></td>
						</tr>
						<tr>
						<td>Fee:</td>
						<td><%=rs.getString("FEE")%></td>
						</tr>
						<tr>
						<td>Operation Charges:</td>
						<td><%=rs.getString("TOTAL_CHARGE")%></td>
						</tr>
		
		
						<tr>
						<td>Total Charges:</td>
						<td><%=rs.getString("TOTAL_CHARGE")%></td>
						</tr>
		
				
						
						<%}
}
catch(Exception E){
out.println("Data Missing OR Incorrect");
}
%>
</table>				 
