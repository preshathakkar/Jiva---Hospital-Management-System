						
<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>
 
<form method="post" action="">
<table class="logtable" align="center" width="100%">
                        
 <%
 		  String stfid = request.getParameter("stfid");
 		  String fname = request.getParameter("fname");
 		  
 		  try{
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
		
				  String strSQL="SELECT * FROM Staff_MASTER WHERE STAFF_ID='"+stfid+"' OR FNAME='"+fname+"'";
				  ResultSet rs = statement.executeQuery(strSQL);
		
		

while(rs.next()){
 %>                        
<tr>
                        <tr>
                        
                        <td>
                        <label>
                        	Staff ID:
                        </label>
                        </td>
                        <td colspan="3">
                        <input type="text" name="stfid" value="<%=rs.getString("STAFF_ID")%>">
                        </td>
                        </tr>
                        <tr>
                        <td>
                        <label>
                        	Name:
                        </label>
                        </td>
                        <td colspan="3">
                        <input type="text" name="fname" value="<%=rs.getString("FNAME")%>">
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
                        <label>Alternate Address:</label></td>
                        <td>
                        <textarea cols="50" rows="2"  name="add1"><%=rs.getString("ALTERNATE_ADDRESS") %></textarea>                        
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
                        <label> Contact No.(R):</label></td>
                        <td>
                        <input type="text" name="cntr" value="<%=rs.getString("CONTACT_NO_R") %>">
                        </td>
                        </tr>
                        
                        <tr>
                        
                        <td>
                        <label> Contact No.(M):</label></td>
                        <td>
                        <input type="text" name="cntm" value="<%=rs.getString("CONTACT_NO_M") %>">
                        </td>
                        
                        </tr>
                        
                         <tr>
                        
                        <td>
                        <label> Email ID:</label></td>
                        <td>
                        <input type="text" name="email" value="<%=rs.getString("E_MAIL") %>">
                        </td>
                        
                        </tr>
                        
                        
                         <tr>
                        
                        <td>
                        <label> Salary:</label></td>
                        <td>
                        <input type="text" name="sal" value="<%=rs.getString("SALARY") %>">
                        </td>
                        </tr>
                        
                               
                         <tr>
                        
                        <td>
                        <label> Academic Qualification:</label></td>
                        <td>
                        <input type="text" name="acd" value="<%=rs.getString("ACADEMIC_QUALIFICATION") %>">
                        </td>
                        </tr>
                        
                         <tr>
                                                <td>
                        <label> Designation:</label></td>
                        <td>
                        <input type="text" name="desig" value="<%=rs.getString("DESIGNATION") %>">
                        </td>
                        </tr>
                        
                        <tr>
                        <td colspan="2"><center>
                        
                        <a class="button buttonBlue" href="javascript:dispage('../staff/edit.jsp','middleFullWidth')">
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
                        </form>
						<div class="clear"></div>
						