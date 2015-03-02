<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<% 		  
String tstname = request.getParameter("tstname");
String tstch = request.getParameter("tstch");		  
		  	 
		  	 try{
		  	  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();

				  String strSQL ="SELECT * FROM TEST_MASTER WHERE TEST_NAME='"+tstname+"' AND TEST_CHARGE='"+tstch+"'";
				  ResultSet rs = statement.executeQuery(strSQL);
				  while(rs.next()){
				  %>
				 <tr>
                        
                        <td>	Test Name:</td>
                        <td>	<input type="text" name="tstname" disabled value="<%=rs.getString("TEST_NAME")%>"/> </td>
                        </tr>
                        
                    
				 		<tr>    
                        <td colspan="2">	AND</td>
                        </tr>
                    
                        
                           <tr>
                        
                        <td>
                        <label> Test Charge:</label></td>
                        <td>
                        <input type="text" name="tstch" value="<%=rs.getString("TEST_CHARGE")%>"/>
                        </td>
                        
                        </tr>
                     <tr>
                        
                        <td colspan="2">
                        <a class="button buttonBlue" href="javascript:dispage('../test/edit.jsp','in')">
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
				  
				 