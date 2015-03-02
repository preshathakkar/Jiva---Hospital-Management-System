<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>

<% 
		   String stfid = request.getParameter("stfid");
		   String dept = request.getParameter("dept");
		  try{
			  InitialContext ctx = new InitialContext();
			  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
			  Connection conn = ds.getConnection("krazy4","deena111");
			  Statement statement = conn.createStatement();
			  String strSQL ="SELECT DOCTOR_ID FROM DOCTOR_MASTER";
			  ResultSet rs = statement.executeQuery(strSQL);
			  int m=0,j=0;
			  while(rs.next()){
				
				  String s = rs.getString("DOCTOR_ID").substring(1,8);
				
				 int t =Integer.parseInt(s);
				
				 if(m<t){
					 m=t;
				 }
			  }
			  int n = m+1;
		for(int i=n;i>=10;i%=10){	 
			j++;
			  }
		String did ="d";
			  for(int i=5-j;i>=0;i--){
				  did=did+'0';
			  }
			  
			  String a = Integer.toString(n);
			  did=did+a;
  
			  
			int i = statement.executeUpdate("INSERT INTO DOCTOR_MASTER(DOCTOR_ID,STAFF_ID,DEPT_ID,USERTYPE_ID,ENT_BY) VALUES('"+did+"','"+stfid+"',(SELECT DEPT_ID FROM DEPARTMENT_MASTER WHERE DEPARTMENT='"+dept+"'),'ut000002','"+session.getAttribute("uid")+"')");
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

<input type="button" value="Back" onClick="javascript:sendRequest('../doc/doctor.jsp','middleFullWidth')">


</center>	  
