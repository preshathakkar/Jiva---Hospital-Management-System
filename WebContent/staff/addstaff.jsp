<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<%
    	  String utid = request.getParameter("ut");
		  String fname = request.getParameter("fname").toString();
		   String lname = request.getParameter("lname").toString();
		   String sex = request.getParameter("sex").toString();
		   String age = request.getParameter("age");
		   String add = request.getParameter("add");
		   String add1 = request.getParameter("add1");
			
		   String dob = request.getParameter("dob");
		   //String religion = request.getParameter("religion");
		   String bg = request.getParameter("bg");
		   String cntr = request.getParameter("cntr");
		   String cntm = request.getParameter("cntm");
		   String email = request.getParameter("email");
		   String jdate = request.getParameter("jdate");
		   String sal = request.getParameter("sal");
		   //String shift = request.getParameter("shift");
		   //session.setAttribute("shift", shift);
		   String acd = request.getParameter("acd");
		   String desig = request.getParameter("desig");
		   out.println(utid + fname);					 
		
		try{
		  InitialContext ctx = new InitialContext();
			  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
			  Connection conn = ds.getConnection("krazy4","deena111");
			  Statement statement = conn.createStatement();
			  String strSQL ="SELECT STAFF_ID FROM STAFF_MASTER";
			  ResultSet rs = statement.executeQuery(strSQL);
			  int m=0,j=0;
			  while(rs.next()){
				
				  String s = rs.getString("STAFF_ID").substring(1,8);
				
				 int t =Integer.parseInt(s);
				
				 if(m<t){
					 m=t;
				 }
			  }
			  int n = m+1;
		for(int i=n;i>=10;i%=10){	 
			j++;
			  }
		String sid ="s";
			  for(int i=5-j;i>=0;i--){
				  sid=sid+'0';
			  }
			  
			  String a = Integer.toString(n);
			  sid=sid+a;
			  ResultSet rs1 =statement.executeQuery("SELECT USERTYPE_ID FROM USERTYPE_MASTER WHERE USERTYPE='"+utid+"'");
				String dptid=rs1.getString("USERTYPE_ID");
				
			  
			  
			 int i = statement.executeUpdate("INSERT INTO STAFF_MASTER (STAFF_ID, FNAME, LNAME, GENDER, ADDRESS, CONTACT_NO_R, CONTACT_NO_M, AGE, E_MAIL, JOIN_DATE, LEAVE_DATE, SALARY, WORKING_HOURS, USERTYPE_ID, DOB, ACADEMIC_QUALIFICATION, DESIGNATION, BLOOD_GROUP, ENT_BY) VALUES ('"+sid+"','"+fname+"','"+lname+"','"+sex+"','"+add+"','"+cntr+"','"+cntm+"','"+age+"','"+email+"','"+jdate+"','0','"+sal+"','12',(SELECT USERTYPE_ID FROM USERTYPE_MASTER WHERE USERTYPE='"+utid+"'),'"+dob+"','"+add1+"','"+acd+"','"+desig+"','"+bg+"','"+session.getAttribute("uid")+"')");
		if(i!=0){%>
				
				<center>
				<b>
				One Row Inserted</b>
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