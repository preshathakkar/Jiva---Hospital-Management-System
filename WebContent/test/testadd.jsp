<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<%
String tname = request.getParameter("tstname");
		  String tdesc = request.getParameter("tstdesc");
		  String tch = request.getParameter("tstch");
				try{
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  String strSQL ="SELECT TEST_ID FROM TEST_MASTER";
				  ResultSet rs = statement.executeQuery(strSQL);
				  int m=0,j=0;
				  while(rs.next()){
					
					  String s = rs.getString("TEST_ID").substring(1,8);
					
					 int t =Integer.parseInt(s);
					
					 if(m<t){
						 m=t;
					 }
				  }
				  int n = m+1;
			for(int i=n;i>=10;i%=10){	 
				j++;
				  }
			String id ="t";
				  for(int i=5-j;i>=0;i--){
					  id=id+'0';
				  }
				  
				  String a = Integer.toString(n);
				  id=id+a;
				int i=statement.executeUpdate("INSERT INTO TEST_MASTER (TEST_ID, TEST_NAME, TEST_DESCRIPTION, TEST_CHARGE, ENT_BY)VALUES ('"+id+"','"+tname+"','"+tdesc+"','"+tch+"','"+session.getAttribute("uid")+"')");
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

<a class="button buttonBlue" href="javascript:sendRequest('../test/test.jsp','middleFullWidth')">
														<span>Back</span>
												</a>

</center>