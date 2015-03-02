<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<% 		  
String name = request.getParameter("name");
String pass = request.getParameter("pass");		  
		  try{
		  	  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();

				  String strSQL ="SELECT * FROM USER_PHS WHERE PASSWORD='"+pass+"' AND USERNAME='"+name+"'";
				  ResultSet rs = statement.executeQuery(strSQL);
				  while(rs.next()){
				  %>
				 <tr>
                        
                        <td>	User Name </td>
                        <td>	<input type="text" name="dname" disabled value="<%=rs.getString("USERNAME")%>"/> </td>
                        </tr>
                        
                        <tr>
                        
                        <td>	Password </td>
                        <td>	<input type="text" name="did"  value="<%=rs.getString("PASSWORD")%>"/> </td>
                        </tr>
                 	     <tr>
                        
                        
                        <td colspan="2">	
                        
                        <a class="button buttonBlue" href="javascript:dispage('../user/edit.jsp','in')">
														<span>Edit</span>
												</a> </td>
                        </tr>
                   
                      
				 <%  }
				}
				catch(Exception E){
				out.println("Data Missing OR Incorrect");
				}  %>
				  
				 