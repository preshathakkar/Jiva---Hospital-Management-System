<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>

<table class="logtable" align="center" width="100%">
<% 		  
String dept = request.getParameter("dname");
String deptid = request.getParameter("did");		  
		  try{
		  	  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();

				  String strSQL ="SELECT * FROM DEPARTMENT_MASTER WHERE DEPT_ID='"+deptid+"' OR DEPARTMENT='"+dept+"'";
				  ResultSet rs = statement.executeQuery(strSQL);
				  while(rs.next()){
				  %>
				 <tr>
                        
                        <td>	Department Name </td>
                        <td>	<input type="text" name="dname" value="<%=rs.getString("DEPARTMENT")%>"/> </td>
                        </tr>
                        
                        <tr>
                        
                        <td>	Department ID </td>
                        <td>	<input type="text" name="did" disabled value="<%=rs.getString("DEPT_ID")%>"/> </td>
                        </tr>
                 	     <tr>
                        
                        
                        <td colspan="2">	
                        <a class="button buttonBlue" href="javascript:dispage('../dept/edit.jsp','in')">
														<span>Edit</span>
						</a>
                        
                        </td>
                        </tr>
                   
                      
				 <%  }
				}
				catch(Exception E){
				out.println("Data Missing OR Incorrect");
				}
				  %>
				  </table>
				 