package jiva;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;
/**
 * Servlet implementation class testadd
 */
public class testadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public testadd() {
        super();
        // TODO Auto-generated constructor stub
    }
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
	doPost(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		  PrintWriter out = response.getWriter();
		  	
		  HttpSession session = request.getSession();
		  String tname = request.getParameter("tstname");
		  String tdesc = request.getParameter("tstdesc");
		  String tch = request.getParameter("tstch");
		  try{
				//response.setContentType("text/html");
				 // PrintWriter out = response.getWriter();
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
				statement.executeUpdate("INSERT INTO TEST_MASTER (TEST_ID, TEST_NAME, TEST_DESCRIPTION, TEST_CHARGE)VALUES ('"+id+"','"+tname+"','"+tdesc+"','"+tch+"')");
			
				  String f = session.getAttribute("role").toString(); 

				  char flag[] = f.toCharArray();

				  out.println(flag);

				  switch(flag[0])
				      { 
				  case '1':  
				  response.sendRedirect("/Jiva/admin/test.jsp");
				      break;
				  case '2':   
				  	response.sendRedirect("/Jiva/doctor/test.jsp");
				       break;
				   case '3': 
				   	response.sendRedirect("/Jiva/nurse/test.jsp");
				       break;
				   case '4': 
				     response.sendRedirect("/Jiva/reception/test.jsp");
				       break;
				   case '5': 
				     response.sendRedirect("/Jiva/hr/test.jsp");
				       break;
				   case '6': 
				     response.sendRedirect("/Jiva/store/test.jsp");
				       break;
				   default:    
				       
				       
				       } 

		  
		  }
			catch(Exception E){
				//PrintWriter out = response.getWriter();
				out.print(E);
			}


}
}
