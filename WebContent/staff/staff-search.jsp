<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>

<table class="tableGrey" align="center" width="100%">
<%
		  String stfid = request.getParameter("stfid");
		  try{
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
		
				  String strSQL="SELECT * FROM STAFF_MASTER WHERE STAFF_ID='"+stfid+"'";
				  ResultSet rs = statement.executeQuery(strSQL);
				  
				 
	%>
			<thead>
	<tr>
	
	<th>ID</th>
	
	<th> First Name</th>
	<th> Last Name</th>
	<th>Address</th>
	<th>Gender</th>
	<th>Age</th>
	<th>DOB</th>
	<th>Blood Group</th>
	<th>Contact No.(R)</th>
	<th>Contact No.(M)</th>
	<th>Email</th>
	<th>Designation</th>
	
	</tr>	
	</thead>		  
								  <% 
				  while(rs.next()){
				%>
				
<tr>
<td><%=rs.getString("STAFF_ID")%></td>
<td><%=rs.getString("FNAME")%></td>
<td><%=rs.getString("LNAME") %></td>
<td><%= rs.getString("ADDRESS") %></td>
<td><%= rs.getString("GENDER") %></td>
<td><%= rs.getString("AGE") %></td>
<td><%= rs.getString("DOB") %></td>
<td><%= rs.getString("BLOOD_GROUP") %></td>
<td><%= rs.getString("CONTACT_NO_R") %></td>
<td><%= rs.getString("CONTACT_NO_M") %></td>
<td><%= rs.getString("E_MAIL") %></td>
<td><%= rs.getString("DESIGNATION") %></td>
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



				  