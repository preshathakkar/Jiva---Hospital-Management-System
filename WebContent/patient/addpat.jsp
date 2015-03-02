<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>
<%

		  String utid = session.getAttribute("utid").toString();
		  String dept = request.getParameter("dept").toString();
		  String fname = request.getParameter("fname").toString();
		   String lname = request.getParameter("lname").toString();
		   String sex = request.getParameter("sex").toString();
		   String age = request.getParameter("age");
		   String add = request.getParameter("add");
			
		   String dob = request.getParameter("dob");
		   String religion = request.getParameter("religion");
		   String bg = request.getParameter("bg");
		   String cnt = request.getParameter("cnt");
		   String ptype = request.getParameter("ptype");
		   String visit = request.getParameter("visit");
		   java.util.Date reg_date = new java.util.Date();
		
		try{
			  InitialContext ctx = new InitialContext();
			  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
			  Connection conn = ds.getConnection("krazy4","deena111");
			  Statement statement = conn.createStatement();
			  String strSQL ="SELECT PATIENT_ID FROM PATIENT_MASTER";
			  ResultSet rs = statement.executeQuery(strSQL);
			  int m=0,j=0;
			  while(rs.next()){
				
				  String s = rs.getString("PATIENT_ID").substring(1,8);
				
				 int t =Integer.parseInt(s);
				
				 if(m<t){
					 m=t;
				 }
			  }
			  int n = m+1;
		for(int i=n;i>=10;i%=10){	 
			j++;
			  }
		String pid ="p";
			  for(int i=5-j;i>=0;i--){
				  pid=pid+'0';
			  }
			  
			  String a = Integer.toString(n);
			  pid=pid+a;
		 out.println(pid);
			ResultSet rs1 =statement.executeQuery("SELECT DEPT_ID FROM DEPARTMENT_MASTER WHERE DEPTARTMENT='"+dept+"'");
			String dptid=rs1.getString("DEPT_ID");
			out.println(dptid);
			int i = statement.executeUpdate("INSERT INTO PATIENT_MASTER(PATIENT_ID,FNAME,LNAME,ADDRESS,GENDER,AGE,CONTACT_NUM,VISITED,PATIENT_TYPE,DOB,BLOOD_GROUP,REG_DATE,DEPT_ID,RELIGION,REG_BY,ENT_BY) VALUES('"+pid+"','"+fname+"','"+lname+"','"+add+"','"+sex+"','"+age+"','"+cnt+"','"+visit+"','"+ptype+"','"+dob+"','"+bg+"','"+reg_date+"','"+dptid+"','"+religion+"','"+utid+"','"+session.getAttribute("uid")+"')");
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
<a class="button buttonBlue" href="javascript:sendRequest('../patient/patient.jsp','middleFullWidth')">
														<span>Back</span>
												</a>
</center>