<%@page import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>


<%
		  String sid = session.getAttribute("sid").toString();
		  String utid = session.getAttribute("utid").toString();
		  String iname = request.getParameter("iname");
		  String iaval = request.getParameter("iaval");
		  String need = request.getParameter("need");
		  String order = request.getParameter("order");
		  try{
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  
				  String strSQL ="SELECT INVENTORY_ID FROM INVENTORY_MASTER";
				  ResultSet rs = statement.executeQuery(strSQL);
				  int m=0,j=0;
				  while(rs.next()){
					
					  String s = rs.getString("INVENTORY_ID").substring(2,8);
					
					 int t =Integer.parseInt(s);
					
					 if(m<t){
						 m=t;
					 }
				  }
				  int n = m+1;
			for(int i=n;i>=10;i%=10){	 
				j++;
				  }
			String inid ="in";
				  for(int i=4-j;i>=0;i--){
					  inid=inid+'0';
				  }
				  
				  String a = Integer.toString(n);
				  inid=inid+a;
 
			int i = statement.executeUpdate("INSERT INTO INVENTORY_MASTER (INVENTORY_ID, INVENTORY_NAME, INVENTORY_AVAILABLE, INVENTORY_NEEDED, INVENTORY_ORDERED, STAFF_ID, USERTYPE_ID) VALUES ('"+inid+"','"+iname+"','"+iaval+"','"+need+"','"+order+"','"+sid+"','"+utid+"')");
	
	
	
	
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
<a class="button buttonBlue" href="javascript:sendRequest('../inv/store.jsp','middleFullWidth')">
														<span>Back</span>
												</a>


</center>