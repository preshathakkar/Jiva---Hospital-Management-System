<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<% 		  
String dept = request.getParameter("dept");
		  try{
		  
		  	  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();

				  String strSQL ="SELECT DEPT_ID FROM DEPARTMENT_MASTER";
				  ResultSet rs = statement.executeQuery(strSQL);
				  int m=0,j=0;
				  while(rs.next()){
					
					  String s = rs.getString("DEPT_ID").substring(4,8);
					//out.print(s);
					 int t =Integer.parseInt(s);
					
					 if(m<t){
						 m=t;
					 }
				  }
				  int n = m+1;
			for(int i=n;i>=10;i%=10){	 
				j++;
				  }
			String deptid ="dept";
				  for(int i=2-j;i>=0;i--){
					  deptid=deptid+'0';
				  }
				  //out.println(deptid);
				  String a = Integer.toString(n);
				  deptid=deptid+a; 
				  
				int i = statement.executeUpdate("INSERT INTO DEPARTMENT_MASTER (DEPT_ID, DEPARTMENT,ENT_BY) VALUES ('"+deptid+"','"+dept+"','"+session.getAttribute("uid")+"')");
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
<a class="button buttonBlue" href="javascript:sendRequest('../dept/dept.jsp','middleFullWidth')">
														<span>Back</span>
						</a>
                        



</center>
