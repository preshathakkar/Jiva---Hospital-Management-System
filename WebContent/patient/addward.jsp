<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>
<%

		  String ward = request.getParameter("ward");
		  String dept = request.getParameter("dept");
		 
		 try{
		 		  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  
				  String strSQL ="SELECT WARD_ID FROM WARD_MASTER";
				  ResultSet rs = statement.executeQuery(strSQL);
				  int m=0,j=0;
				  while(rs.next()){
					
					  String s = rs.getString("WARD_ID").substring(1,8);
					
					 int t =Integer.parseInt(s);
					
					 if(m<t){
						 m=t;
					 }
				  }
				  int n = m+1;
			for(int i=n;i>=10;i%=10){	 
				j++;
				  }
			String id ="w";
				  for(int i=5-j;i>=0;i--){
					  id=id+'0';
				  }
				  
				  String a = Integer.toString(n);
				  id=id+a;
				  
				int i = statement.executeUpdate("INSERT INTO DEPARTMENT_MASTER (WARD_ID, WARD_NAME, DEPT_ID, ENT_BY) VALUES ('"+id+"','"+ward+"',(SELECT DEPT_ID FROM DEPARTMENT_MASTER WHERE DEPARTMENT='"+dept+"','"+session.getAttribute("uid")+"'))");
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