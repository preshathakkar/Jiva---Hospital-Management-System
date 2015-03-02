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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class staffsearch
 */
public class staffsearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public staffsearch() {
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
		  String stfid = request.getParameter("stfid");
		 // String tdesc = request.getParameter("tstdesc");
		 // String tch = request.getParameter("tstch");
		  try{
				//response.setContentType("text/html");
				 // PrintWriter out = response.getWriter();
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
		
				  String strSQL="SELECT * FROM STAFF_MASTER WHERE STAFF_ID='"+stfid+"'";
				  ResultSet rs = statement.executeQuery(strSQL);
				  //List datalist = new ArrayList();
				  
				  while(rs.next()){
					  //datalist.add(rs.getString(columnName))
				  String fname = rs.getString("FNAME");
				  String lname = rs.getString("LNAME");
				  String cntr = rs.getString("CONTACT_NO_R");
				  String age = rs.getString("AGE");
				  String email = rs.getString("E_MAIL");
				  String desg = rs.getString("DESIGNATION");
				  String bg = rs.getString("BLOOD_GROUP");
				  request.setAttribute("fname", fname);
				  request.setAttribute("lname", lname);
				  request.setAttribute("cntr", cntr);
				  request.setAttribute("age", age);
				  request.setAttribute("email", email);
				  request.setAttribute("desg", desg);
				  request.setAttribute("bg", bg);
				  
				  String f = session.getAttribute("role").toString(); 

				  char flag[] = f.toCharArray();

				  out.println(flag);

				  switch(flag[0])
				      { 
				  case '1':  
				  response.sendRedirect("/Jiva/admin/display.jsp");
				      break;
				  case '2':   
				  	response.sendRedirect("/Jiva/doctor/display.jsp");
				       break;
				   case '3': 
				   	response.sendRedirect("/Jiva/nurse/display.jsp");
				       break;
				   case '4': 
				     response.sendRedirect("/Jiva/reception/display.jsp");
				       break;
				   case '5': 
				     response.sendRedirect("/Jiva/hr/display.jsp");
				       break;
				   case '6': 
				     response.sendRedirect("/Jiva/store/display.jsp");
				       break;
				   default:    
				       
				       
				       } 

				  
				  }
		  
		  }
			catch(Exception E){
				//PrintWriter out = response.getWriter();
				out.print(E);
			}


	}

}
