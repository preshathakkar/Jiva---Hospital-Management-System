<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<% 		  try{
String stfid = request.getParameter("stfid");
String dept = request.getParameter("dept");		  
		  
		  	  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();

				  String strSQL ="SELECT * FROM DOCTOR_MASTER WHERE DEPT_ID='"+dept+"' OR STAFF_ID='"+stfid+"'";
				  ResultSet rs = statement.executeQuery(strSQL);
				  while(rs.next()){
				  %>
				 <tr>
                        
                        <td>	Staff_ID: </td>
                        <td>	<input type="text" name="stfid" disabled value="<%=rs.getString("STAFF_ID")%>"/> </td>
                        </tr>
                        
                        <tr>
                        
                        <td>	Department ID:</td>
                        <td>	<input type="text" name="dept"  value="<%=rs.getString("DEPT_ID")%>"/> </td>
                        </tr>
                 	     <tr>
                        
                        
                        <td colspan="2">
<a class="button buttonBlue" href="javascript:dispage('../doc/edit.jsp','in')">
														<span>Edit</span>
												</a>                        
                        	</td>
                        </tr>
                   
                     
				 <%  }}
				 catch(Exception E){
				 out.println("Data Missing OR Incorrect");
				 }
				  %>
				  
<div id="in"></div>				 