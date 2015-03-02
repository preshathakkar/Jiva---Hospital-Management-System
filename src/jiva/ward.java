package jiva;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class ward
 */
public class ward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ward() {
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
		  String ward = request.getParameter("ward");
		  String dept = request.getParameter("dept");
		  try{
				//response.setContentType("text/html");
				 // PrintWriter out = response.getWriter();
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  
				statement.executeUpdate("INSERT INTO DEPARTMENT_MASTER (WARD_ID, WARD_NAME, DEPT_ID)VALUES ('W0000007','"+ward+"',(SELECT DEPT_ID FROM DEPARTMENT_MASTER WHERE DEPARTMENT='"+dept+"'))");
			}
			catch(Exception E){
				//PrintWriter out = response.getWriter();
				out.print(E);
			}

	}

	
	
	

}
