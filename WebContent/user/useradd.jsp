<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<%
   String stfid = request.getParameter("stfid");
		   String name = request.getParameter("name");	
		   String pass = request.getParameter("pass");
		   String ut = request.getParameter("ut");
		
		try{
			//response.setContentType("text/html");
			 // PrintWriter out = response.getWriter();
			  InitialContext ctx = new InitialContext();
			  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
			  Connection conn = ds.getConnection("krazy4","deena111");
			  Statement statement = conn.createStatement();
			  String strSQL ="SELECT U_ID FROM USER_PHS";
			  ResultSet rs = statement.executeQuery(strSQL);
			  int m=0,j=0;
			  while(rs.next()){
				
				  String s = rs.getString("U_ID").substring(1,8);
				
				 int t =Integer.parseInt(s);
				
				 if(m<t){
					 m=t;
				 }
			  }
			  int n = m+1;
		for(int i=n;i>=10;i%=10){	 
			j++;
			  }
		String uid ="u";
			  for(int i=5-j;i>=0;i--){
				  uid=uid+'0';
			  }
			  
			  String a = Integer.toString(n);
			  uid=uid+a;
			  //out.print(uid);
			   
			  
			int i = statement.executeUpdate("INSERT INTO USER_PHS(PASSWORD, USERNAME, U_ID, STAFF_ID, USERTYPE_ID, ENT_BY) VALUES ('"+pass+"', '"+name+"', '"+uid+"', '"+stfid+"',(SELECT USERTYPE_ID FROM USERTYPE_MASTER WHERE USERTYPE='"+ut+"'),'"+session.getAttribute("uid")+"')");
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