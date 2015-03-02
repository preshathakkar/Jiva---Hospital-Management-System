<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<% 		  
          String stfid = request.getParameter("stfid").toString();
		  String fname = request.getParameter("fname").toString();
		   String lname = request.getParameter("lname").toString();
		   String sex = request.getParameter("sex").toString();
		   String age = request.getParameter("age");
		   String add = request.getParameter("add");
			 String add1 = request.getParameter("add1");
		   String dob = request.getParameter("dob");
		   String sal = request.getParameter("sal");
		   String cntr = request.getParameter("cntr");
		   String cntm = request.getParameter("cntm");
		   String email = request.getParameter("email");
			try{	  
		  	  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();

				  
				int i = statement.executeUpdate("UPDATE STAFF_MASTER SET FNAME='"+fname+"',LNAME='"+lname+"',ADDRESS='"+add+"',GENDER='"+sex+"',AGE='"+age+"',DOB='"+dob+"',CONTACT_NO_R='"+cntr+"',CONTACT_NO_M='"+cntm+"',SALARY='"+sal+"',ENT_BY='"+session.getAttribute("uid")+"' WHERE STAFF_ID='"+stfid+"'");
							if(i!=0){%>
				
				<center>
				<b>
				One Row Updated</b>
				</center>
				
				<%}
				}
				catch(Exception E){
				out.println("Data Missing OR Incorrect");
				}
%>


<div class="clear"></div>
<center> 

<a class="button buttonBlue" href="javascript:sendRequest('../staff/staff.jsp','middleFullWidth')">
														<span>Back</span>
												</a>
</center>
