						
<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>
 
 <table class="logtable" align="center" width="100%">

 

 <%
 		  String patid = request.getParameter("patid");
 		  String name = request.getParameter("pname");
 		  
try{ 		  
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
		
				  String strSQL="SELECT * FROM PATIENT_MASTER WHERE PATIENT_ID='"+patid+"' OR FNAME='"+name+"'";
				  ResultSet rs = statement.executeQuery(strSQL);
		
		

while(rs.next()){
 %>                        
                         <tr>
                        
                        <td>
                        <label> Patient ID:</label></td>
                        <td>
                        <input type="text" name="ptid" disabled value="<%=rs.getString("PATIENT_ID")%>"/>   
                        </td>
                        
                        </tr>
                        
						<tr>
                        
                        <td>
                        <label>
                        	Name:
                        </label>
                        </td>
                        <td >
                              <input type="text" name="fname" value="<%=rs.getString("FNAME")%>"/>
                        <input type="text" name="lname" value="<%=rs.getString("LNAME")%>">
                        </td>
                        
                        </tr>
                        <tr>
                        
                        <td>
                        <label> Gender:</label></td>
                        <td>
                        <%if((rs.getString("GENDER").compareTo("1"))==0){ %>
                        <input type="radio" name="sex" value="1" checked>&nbsp;Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="sex" value="0">&nbsp;Female
                        
              			 <%}else{%>
                      <input type="radio" name="sex" value="1" >&nbsp;Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="sex" value="0" checked>&nbsp;Female
                        <%} %>
                       </td>
                        
                        </tr>
                        
                        <tr>
                        
                        <td>
                        <label> Age:</label></td>
                        <td>
                        <input type="text" name="age" value="<%=rs.getString("age")%>">
                        
                        </td>
                        
                        </tr>
                        
                        <tr>
                        
                        <td>
                        <label> Address:</label></td>
                        <td>
                        <textarea cols="50" rows="2"  name="add"><%=rs.getString("ADDRESS") %></textarea>                        
                        </td>
                        </tr>
                        
                        <tr>
                        
                        <td>
                        <label> DOB:</label></td>
                        <td>
                        <input type="text" name="dob" value="<%=rs.getString("DOB")%>">                        
                        </td>
                        </tr>
                        
                        <tr>
                        
                        <td>
                        <label> Religion:</label></td>
                        <td>
                        <input type="text" name="religion" value="<%=rs.getString("RELIGION")%>">                        
                        </td>
                        </tr>
                        
                        
                        
				
                        <tr>
                        <td colspan="2"><center>
                        
                        <a class="button buttonBlue" href="javascript:dispage('../patient/edit.jsp','middleFullWidth')">
														<span>Edit</span>
												</a>
                             </center>                   
                        </td>
                        </tr>
                       						
						
					<%} 
					}
					catch(Exception E){
					out.println("Data Missing OR Incorrect");
					}%>
			</table>