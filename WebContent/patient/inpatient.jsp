<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>
<%


 String sid = session.getAttribute("sid").toString();
		  String utid = session.getAttribute("utid").toString();
		  String dept = request.getParameter("dept");
		  String pid = request.getParameter("pid").toString();
		   String docid = request.getParameter("docid").toString();
		   String adate = request.getParameter("adate").toString();
		   //String ddate =null;
		   String diag = request.getParameter("diag");
		   String tid = request.getParameter("tid");
			String wid=request.getParameter("wid");
		   String dise = request.getParameter("dise");
		   String distype = request.getParameter("distyp");
		   String add = request.getParameter("add");
		 
		 try{
		 		  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  
				  String strSQL ="SELECT * FROM PATIENT_DETAILS_IN";
				  ResultSet rs = statement.executeQuery(strSQL);
				  int m=0,j=0;
				  while(rs.next()){
					
					  String s = rs.getString("P_D_ID").substring(2,8);
					
					 int t =Integer.parseInt(s);
					
					 if(m<t){
						 m=t;
					 }
				  }
				  int n = m+1;
			for(int i=n;i>=10;i%=10){	 
				j++;
				  }
			String pdid ="pd";
				  for(int i=4-j;i>=0;i--){
					  pdid=pdid+'0';
				  }
				  
				  String a = Integer.toString(n);
				  pdid=pdid+a;
				  out.print(pdid);
				  
			int i = statement.executeUpdate("INSERT INTO PATIENT_DETAILS_IN (P_D_ID, ADMIT_DATE, DIAGNOSIS, DISEASE, PATIENT_ID, DOCTOR_ID, DISCHARGE_TYPE, TREATMENT_DESCRIPTION, DEPT_ID, USERTYPE_ID, STAFF_ID, WARD_ID, ENT_BY, TEST_ID) VALUES ('"+pdid+"', '"+adate+"', '"+diag+"', '"+dise+"', '"+pid+"', '"+docid+"', '"+distype+"', '"+add+"', (SELECT DEPT_ID FROM DEPARTMENT_MASTER WHERE DEPARTMENT='"+dept+"'), '"+utid+"', '"+sid+"','"+wid+"','"+session.getAttribute("uid")+"','"+tid+"')");
					if(i!=0){%>
				
				<center>
				<b>
				One Row Inserted</b>
				</center>
				
				<%}
}
catch(Exception E){
out.print(E);
//out.println("Data Missing OR Incorrect");
}

%>


<div class="clear"></div>
<center> 

<a class="button buttonBlue" href="javascript:sendRequest('../patient/patient.jsp','middleFullWidth')">
														<span>Back</span>
												</a>

</center>