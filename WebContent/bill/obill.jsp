<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<%
          String pid = request.getParameter("pid");
		  String fee = request.getParameter("fee");
		  String tc = request.getParameter("tc");
		   String tid = request.getParameter("tid");
				try{
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  String strSQL ="SELECT OUT_BILL_ID FROM OUT_BILL";
				  ResultSet rs = statement.executeQuery(strSQL);
				  int m=0,j=0;
				  while(rs.next()){
					
					  String s = rs.getString("OUT_BILL_ID").substring(2,8);
					
					 int t =Integer.parseInt(s);
					
					 if(m<t){
						 m=t;
					 }
				  }
				  int n = m+1;
			for(int i=n;i>=10;i%=10){	 
				j++;
				  }
			String id ="ob";
				  for(int i=4-j;i>=0;i--){
					  id=id+'0';
				  }
				  
				  String a = Integer.toString(n);
				  id=id+a;
				int i=statement.executeUpdate("INSERT INTO OUT_BILL (OUT_BILL_ID, PATIENT_ID, DEPT_ID, FEE, TEST_ID, TOTAL_CHARGE,ENT_BY) VALUES ('"+id+"','"+pid+"',(SELECT DEPT_ID FROM PATIENT_MASTER WHERE PATIENT_ID='"+pid+"'),'"+fee+"','"+tid+"','"+tc+"','"+session.getAttribute("uid")+"')");
				if(i!=0){%>
				
				<center>
				<b>
				One Row Inserted</b>
				</center>
				
				<%}
				}
catch(Exception E){
//out.println(E);
out.println("Data Missing OR Incorrect");
}
				
%>


<div class="clear"></div>
<center> 


  <a class="button buttonBlue" href="javascript:sendRequest('../bill/bill.jsp','middleFullWidth')">
														<span>Back</span>
  </a>
                            

</center>