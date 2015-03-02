<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<% 		  
         // String dept = request.getParameter("dept").toString();
		  String fname = request.getParameter("fname").toString();
		   String lname = request.getParameter("lname").toString();
		   String sex = request.getParameter("sex").toString();
		   String age = request.getParameter("age");
		   String add = request.getParameter("add");
			
		   String dob = request.getParameter("dob");
		   String religion = request.getParameter("religion");
		   //String bg = request.getParameter("bg");
		   //String cnt = request.getParameter("cnt");
		   String ptid = request.getParameter("ptid");
			try{	  
		  	  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();

				  
				int i = statement.executeUpdate("UPDATE PATIENT_MASTER SET FNAME='"+fname+"',LNAME='"+lname+"',ADDRESS='"+add+"',GENDER='"+sex+"',AGE='"+age+"',DOB='"+dob+"',RELIGION='"+religion+"',ENT_BY='"+session.getAttribute("uid")+"' WHERE PATIENT_ID='"+ptid+"'");
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

<a class="button buttonBlue" href="javascript:sendRequest('../patient/patient.jsp','middleFullWidth')">
														<span>Back</span>
</a>
</center>
