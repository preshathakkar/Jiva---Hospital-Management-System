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
 * Servlet implementation class patsearch
 */
public class patsearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public patsearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		  PrintWriter out = response.getWriter();
		
		  HttpSession session = request.getSession();
		  String patid = request.getParameter("patid");
		 // String tdesc = request.getParameter("tstdesc");
		 // String tch = request.getParameter("tstch");
		  try{
				//response.setContentType("text/html");
				 // PrintWriter out = response.getWriter();
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
		
				  String strSQL="SELECT * FROM PATIENT_MASTER WHERE PATIENT_ID='"+patid+"'";
				  ResultSet rs = statement.executeQuery(strSQL);
				  //List datalist = new ArrayList();
				  
				  while(rs.next()){
					  //datalist.add(rs.getString(columnName))
				  String fname = rs.getString("FNAME");
				  String lname = rs.getString("LNAME");
				  String cntr = rs.getString("CONTACT_NO_R");
				  String age = rs.getString("AGE");
				  String ptyp = rs.getString("PATIENT_TYPE");
				  String rdate = rs.getString("REG_DATE");
				  String bg = rs.getString("BLOOD_GROUP");
				  request.setAttribute("fname", fname);
				  request.setAttribute("lname", lname);
				  request.setAttribute("cntr", cntr);
				  request.setAttribute("age", age);
				  request.setAttribute("ptyp", ptyp);
				  request.setAttribute("rdate", rdate);
				  request.setAttribute("bg", bg);
				  
				  String f = session.getAttribute("role").toString(); 

				  char flag[] = f.toCharArray();

				  out.println(flag);

				  switch(flag[0])
				      { 
				  case '1':  
				  response.sendRedirect("/Jiva/admin/patdisplay.jsp");
				      break;
				  case '2':   
				  	response.sendRedirect("/Jiva/doctor/patdisplay.jsp");
				       break;
				   case '3': 
				   	response.sendRedirect("/Jiva/nurse/patdisplay.jsp");
				       break;
				   case '4': 
				     response.sendRedirect("/Jiva/reception/patdisplay.jsp");
				       break;
				   case '5': 
				     response.sendRedirect("/Jiva/hr/patdisplay.jsp");
				       break;
				   case '6': 
				     response.sendRedirect("/Jiva/store/patdisplay.jsp");
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
