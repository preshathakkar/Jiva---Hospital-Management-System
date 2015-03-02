package jiva;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

/**
 * Servlet implementation class adddoc
 */
public class adddoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adddoc() {
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
		  // String sid = session.getAttribute("sid").toString();
		   String stfid = request.getParameter("stfid");
		   String dept = request.getParameter("dept");
		  
		
		try{
			//response.setContentType("text/html");
			 // PrintWriter out = response.getWriter();
			  InitialContext ctx = new InitialContext();
			  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
			  Connection conn = ds.getConnection("krazy4","deena111");
			  Statement statement = conn.createStatement();
			  String strSQL ="SELECT DOCTOR_ID FROM DOCTOR_MASTER";
			  ResultSet rs = statement.executeQuery(strSQL);
			  int m=0,j=0;
			  while(rs.next()){
				
				  String s = rs.getString("DOCTOR_ID").substring(1,8);
				
				 int t =Integer.parseInt(s);
				
				 if(m<t){
					 m=t;
				 }
			  }
			  int n = m+1;
		for(int i=n;i>=10;i%=10){	 
			j++;
			  }
		String did ="d";
			  for(int i=5-j;i>=0;i--){
				  did=did+'0';
			  }
			  
			  String a = Integer.toString(n);
			  did=did+a;
  
			  
			 statement.executeUpdate("INSERT INTO DOCTOR_MASTER(DOCTOR_ID,STAFF_ID,DEPT_ID,USERTYPE_ID) VALUES('"+did+"','"+stfid+"',(SELECT DEPT_ID FROM DEPARTMENT_MASTER WHERE DEPARTMENT='"+dept+"'),'ut000002')");
			  
			  String f = session.getAttribute("role").toString(); 

			  char flag[] = f.toCharArray();

			  out.println(flag);

			  switch(flag[0])
			      { 
			  case '1':  
			  response.sendRedirect("/Jiva/admin/doctor.jsp");
			      break;
			  case '2':   
			  	response.sendRedirect("/Jiva/doctor/doctor.jsp");
			       break;
			   case '3': 
			   	response.sendRedirect("/Jiva/nurse/doctor.jsp");
			       break;
			   case '4': 
			     response.sendRedirect("/Jiva/reception/doctor.jsp");
			       break;
			   case '5': 
			     response.sendRedirect("/Jiva/hr/doctor.jsp");
			       break;
			   case '6': 
			     response.sendRedirect("/Jiva/store/doctor.jsp");
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
