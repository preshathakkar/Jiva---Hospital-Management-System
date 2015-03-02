package jiva;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;


/**
 * Servlet implementation class addstaff
 */
public class addstaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addstaff() {
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
		 //String utid = session.getAttribute("utid").toString();
		  String utid = request.getParameter("ut");
		  String fname = request.getParameter("fname").toString();
		   String lname = request.getParameter("lname").toString();
		   String sex = request.getParameter("sex").toString();
		   String age = request.getParameter("age");
		   String add = request.getParameter("add");
		   String add1 = request.getParameter("add1");
			
		   String dob = request.getParameter("dob");
		   //String religion = request.getParameter("religion");
		   String bg = request.getParameter("bg");
		   String cntr = request.getParameter("cntr");
		   String cntm = request.getParameter("cntm");
		   String email = request.getParameter("email");
		   String jdate = request.getParameter("jdate");
		   String sal = request.getParameter("sal");
		   String shift = request.getParameter("shift");
		   session.setAttribute("shift", shift);
		   String acd = request.getParameter("acd");
		   String desig = request.getParameter("desig");
		   out.println(utid + fname);					 
		
		try{
			//response.setContentType("text/html");
			 // PrintWriter out = response.getWriter();
			  InitialContext ctx = new InitialContext();
			  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
			  Connection conn = ds.getConnection("krazy4","deena111");
			  Statement statement = conn.createStatement();
			  String strSQL ="SELECT STAFF_ID FROM STAFF_MASTER";
			  ResultSet rs = statement.executeQuery(strSQL);
			  int m=0,j=0;
			  while(rs.next()){
				
				  String s = rs.getString("STAFF_ID").substring(1,8);
				
				 int t =Integer.parseInt(s);
				
				 if(m<t){
					 m=t;
				 }
			  }
			  int n = m+1;
		for(int i=n;i>=10;i%=10){	 
			j++;
			  }
		String sid ="s";
			  for(int i=5-j;i>=0;i--){
				  sid=sid+'0';
			  }
			  
			  String a = Integer.toString(n);
			  sid=sid+a;
			  out.print(sid);
		statement.executeUpdate("INSERT INTO STAFF_MASTER (STAFF_ID, FNAME, LNAME, GENDER, ADDRESS, CONTACT_NO_R, CONTACT_NO_M, AGE, E_MAIL, JOIN_DATE, SALARY, WORKING_HOURS, USERTYPE_ID, DOB, ACADEMIC_QUALIFICATION, DESIGNATION, BLOOD_GROUP) VALUES ('"+sid+"','"+fname+"','"+lname+"','"+sex+"','"+add+"','"+cntr+"','"+cntm+"','"+age+"','"+email+"','"+jdate+"','"+sal+"','12',(SELECT USERTYPE_ID FROM USERTYPE_MASTER WHERE USERTYPE='"+utid+"'),'"+dob+"','"+add1+"','"+acd+"','"+desig+"','"+bg+"')");
			}
		catch(Exception E){
			//PrintWriter out = response.getWriter();
			out.print(E);
		}

	}

}
