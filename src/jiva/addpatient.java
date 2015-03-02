package jiva;


import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

/**
 * Servlet implementation class addpatient
 */
public class addpatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addpatient() {
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
		  String utid = session.getAttribute("utid").toString();
		  String dept = request.getParameter("dept").toString();
		  String fname = request.getParameter("fname").toString();
		   String lname = request.getParameter("lname").toString();
		   String sex = request.getParameter("sex").toString();
		   String age = request.getParameter("age");
		   String add = request.getParameter("add");
		   //String add1 = request.getParameter("add1");
			
		   String dob = request.getParameter("dob");
		   String religion = request.getParameter("religion");
		   String bg = request.getParameter("bg");
		   String cnt = request.getParameter("cnt");
		   String ptype = request.getParameter("ptype");
		   //String email = request.getParameter("email");
		   String visit = request.getParameter("visit");
		   java.util.Date reg_date = new java.util.Date();
		
		try{
			//response.setContentType("text/html");
			 // PrintWriter out = response.getWriter();
			  InitialContext ctx = new InitialContext();
			  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
			  Connection conn = ds.getConnection("krazy4","deena111");
			  Statement statement = conn.createStatement();
			  String strSQL ="SELECT PATIENT_ID FROM PATIENT_MASTER";
			  ResultSet rs = statement.executeQuery(strSQL);
			  int m=0,j=0;
			  while(rs.next()){
				
				  String s = rs.getString("PATIENT_ID").substring(1,8);
				
				 int t =Integer.parseInt(s);
				
				 if(m<t){
					 m=t;
				 }
			  }
			  int n = m+1;
		for(int i=n;i>=10;i%=10){	 
			j++;
			  }
		String pid ="p";
			  for(int i=5-j;i>=0;i--){
				  pid=pid+'0';
			  }
			  
			  String a = Integer.toString(n);
			  pid=pid+a;
		 out.println(pid);
			ResultSet rs1 =statement.executeQuery("SELECT DEPT_ID FROM DEPARTMENT_MASTER WHERE DEPTARTMENT='"+dept+"'");
			String dptid=rs1.getString("DEPT_ID");
			out.println(dptid);
			 statement.executeUpdate("INSERT INTO PATIENT_MASTER(PATIENT_ID,FNAME,LNAME,ADDRESS,GENDER,AGE,CONTACT_NUM,VISITED,PATIENT_TYPE,DOB,BLOOD_GROUP,REG_DATE,DEPT_ID,RELIGION,REG_BY)VALUES('"+pid+"','"+fname+"','"+lname+"','"+add+"','"+sex+"','"+age+"','"+cnt+"','"+visit+"','"+ptype+"','"+dob+"','"+bg+"','"+reg_date+"','"+dptid+"','"+religion+"','"+utid+"')");
			
	/*		  String f = session.getAttribute("role").toString(); 

			  char flag[] = f.toCharArray();

			  out.println(flag);

			  switch(flag[0])
			      { 
			  case '1':  
			  response.sendRedirect("/Jiva/admin/patient.jsp");
			      break;
			  case '2':   
			  	response.sendRedirect("/Jiva/doctor/patient.jsp");
			       break;
			   case '3': 
			   	response.sendRedirect("/Jiva/nurse/patient.jsp");
			       break;
			   case '4': 
			     response.sendRedirect("/Jiva/reception/patient.jsp");
			       break;
			   case '5': 
			     response.sendRedirect("/Jiva/hr/patient.jsp");
			       break;
			   case '6': 
			     response.sendRedirect("/Jiva/store/patient.jsp");
			       break;
			   default:    
			       
			       
			       } 
*/
		
		}
		catch(Exception E){
			//PrintWriter out = response.getWriter();
			out.print(E);
		}


	}

}
