package jiva;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.sql.*;

import javax.naming.*;
import javax.sql.*;

/**
 * Servlet implementation class attendance
 */
public class attendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public attendance() {
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
		
		 // HttpSession session = request.getSession();
		 // String utid = session.getAttribute("utid").toString();
		  String stfid = request.getParameter("stfid");
		  String shf1 = request.getParameter("shf1");
		  String shf2 = request.getParameter("shf2");
		  java.util.Date date = new java.util.Date();
		  out.println(shf1 + shf2);
		  out.println(date.toString());
		  try{
				//response.setContentType("text/html");
				 // PrintWriter out = response.getWriter();
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  
				int i = statement.executeUpdate("INSERT INTO ATTENDANCE_MASTER (ATTENDANCE_ID, DATE, STAFF_ID, SHIFT1, SHIFT2, USERTYPE_ID)VALUES ('a000017','"+date+"','"+stfid+"','"+shf1+"', '"+shf2+"', (SELECT USERTYPE_ID FROM STAFF_MASTER WHERE STAFF_ID='"+stfid+"'))");
				  
				 if(i!=0){
					//response.sendRedirect("../Jiva/admin/display.jsp");
				out.println("Record has been inserted successfully.........!!!");
				 }
				 else{
					 out.println("TRY AGAIN");
				 }
				}
			catch(Exception E){
				//PrintWriter out = response.getWriter();
				out.print(E);
			}
	}

}
