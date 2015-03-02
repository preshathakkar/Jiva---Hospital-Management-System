package jiva;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.servlet.http.*;
/**
 * Servlet implementation class dept
 */
public class dept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dept() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		  PrintWriter out = response.getWriter();
		
		 HttpSession session = request.getSession();
		  String dept = request.getParameter("dept");
		  try{
				//response.setContentType("text/html");
				 // PrintWriter out = response.getWriter();
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
				  
				statement.executeUpdate("INSERT INTO DEPARTMENT_MASTER (DEPT_ID, DEPARTMENT)VALUES ('"+deptid+"','"+dept+"')");
			
				  String f = session.getAttribute("role").toString(); 

				  char flag[] = f.toCharArray();

				  out.println(flag);

				  switch(flag[0])
				      { 
				  case '1':  
				  response.sendRedirect("/Jiva/admin/dept.jsp");
				      break;
				  case '2':   
				  	response.sendRedirect("/Jiva/doctor/dept.jsp");
				       break;
				   case '3': 
				   	response.sendRedirect("/Jiva/nurse/dept.jsp");
				       break;
				   case '4': 
				     response.sendRedirect("/Jiva/reception/dept.jsp");
				       break;
				   case '5': 
				     response.sendRedirect("/Jiva/hr/dept.jsp");
				       break;
				   case '6': 
				     response.sendRedirect("/Jiva/store/dept.jsp");
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
