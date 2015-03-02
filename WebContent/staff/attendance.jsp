<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<%
		  String stfid = request.getParameter("stfid");
		  String shf1 = request.getParameter("shf1");
		  String shf2 = request.getParameter("shf2");
		 // java.util.Date date = new java.util.Date();
		 String date="2012-06-29";
		  try{
				
					  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  String strSQL ="SELECT ATTENDANCE_ID FROM ATTENDANCE_MASTER";
				  ResultSet rs = statement.executeQuery(strSQL);
				  int m=0,j=0;
				  while(rs.next()){
					
					  String s = rs.getString("ATTENDANCE_ID").substring(1,8);
					
					 int t =Integer.parseInt(s);
					
					 if(m<t){
						 m=t;
					 }
				  }
				  int n = m+1;
			for(int i=n;i>=10;i%=10){	 
				j++;
				  }
			String aid ="a";
				  for(int i=5-j;i>=0;i--){
					  aid=aid+'0';
				  }
//				out.print(aid);  
				  String a = Integer.toString(n);
				  aid=aid+a;
    //            out.print(aid);
				  
				int i =	statement.executeUpdate("INSERT INTO ATTENDANCE_MASTER (ATTENDANCE_ID, DATE, STAFF_ID, SHIFT1, SHIFT2, USERTYPE_ID, ENT_BY) VALUES ('"+aid+"','"+date+"','"+stfid+"','"+shf1+"', '"+shf2+"', (SELECT USERTYPE_ID FROM STAFF_MASTER WHERE STAFF_ID='"+stfid+"'),'"+session.getAttribute("uid")+"')");
if(i!=0){%>
				
				<center>
				<b>
				One Row Inserted</b>
				</center>
				
				<%}
				}
catch(Exception E){
out.println(E);
out.println("Data Missing OR Incorrect");
}
				
%>


<div class="clear"></div>
<center> 

<a class="button buttonBlue" href="javascript:sendRequest('../staff/staff.jsp','middleFullWidth')">
														<span>Back</span>
												</a>

</center>