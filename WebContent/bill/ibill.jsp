<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<%
          String ipid = request.getParameter("ipid");
		  String wid = request.getParameter("wid");
		  String fee = request.getParameter("fee");
		  String ofee = request.getParameter("ofee");
		  String tc = request.getParameter("tc");
				try{
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  String strSQL ="SELECT IN_BILL_ID FROM IN_BILL";
				  ResultSet rs = statement.executeQuery(strSQL);
				  int m=0,j=0;
				  while(rs.next()){
					
					  String s = rs.getString("IN_BILL_ID").substring(2,8);
					
					 int t =Integer.parseInt(s);
					
					 if(m<t){
						 m=t;
					 }
				  }
				  int n = m+1;
			for(int i=n;i>=10;i%=10){	 
				j++;
				  }
			String id ="in";
				  for(int i=4-j;i>=0;i--){
					  id=id+'0';
				  }
				  
				  String a = Integer.toString(n);
				  id=id+a;
				int i=statement.executeUpdate("INSERT INTO IN_BILL (IN_BILL_ID, PATIENT_ID, P_D_ID, DEPT_ID, WARD_ID, FEE, TEST_ID, OPERATION_FEES, TOTAL_CHARGE, USERTYPE_ID, STAFF_ID, DOCTOR_ID,ENT_BY) VALUES ('"+id+"',(SELECT PATIENT_ID FROM PATIENT_DETAILS_IN WHERE P_D_ID='"+ipid+"'),'"+ipid+"',(SELECT DEPT_ID FROM PATIENT_DETAILS_IN WHERE P_D_ID='"+ipid+"'),'"+wid+"','"+fee+"',(SELECT TEST_ID FROM PATIENT_DETAILS_IN WHERE P_D_ID='"+ipid+"'),'"+ofee+"','"+tc+"',(SELECT USERTYPE_ID FROM PATIENT_DETAILS_IN WHERE P_D_ID='"+ipid+"'),(SELECT STAFF_ID FROM PATIENT_DETAILS_IN WHERE P_D_ID='"+ipid+"'),(SELECT DOCTOR_ID FROM PATIENT_DETAILS_IN WHERE P_D_ID='"+ipid+"'),'"+session.getAttribute("uid")+"')");
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