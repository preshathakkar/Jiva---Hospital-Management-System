<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>

<table class="tableBlue" align="center" width="100%">
						
<%
		  String stfid = request.getParameter("stfid");
		  //String ipid = request.getParameter("ipid");
		  try{
				//response.setContentType("text/html");
				 // PrintWriter out = response.getWriter();
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  String strSQL="SELECT * FROM ATTENDANCE_MASTER WHERE STAFF_ID='"+stfid+"'";
				  ResultSet rs = statement.executeQuery(strSQL);
				  //List datalist = new ArrayList();
				  
				  while(rs.next()){
%>
						
						<tr>
						<th>Attendance ID</th>
						<th>Staff ID</th>
						<th>Shift 1</th>
						<th>Shift 2</th>
						<th>Date</th>
						</tr>
						<tr>
						<td><%=rs.getString("ATTENDANCE_ID")%></td>
						<td><%=rs.getString("STAFF_ID")%></td>
						<td><%if((rs.getString("SHIFT1")).compareTo("1")==0){%>
Present
<%}else{%>
Absent<%}%></td>
						<td><%if((rs.getString("SHIFT2")).compareTo("1")==0){%>
Present
<%}else{%>
Absent<%}%></td>
						<td><%=rs.getString("DATE")%></td>
						</tr>
		
				
						
						<%}
}
catch(Exception E){
out.println("Data Missing OR Incorrect");
}
%>
</table>				 
