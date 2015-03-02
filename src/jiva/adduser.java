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
 * Servlet implementation class adduser
 */
public class adduser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adduser() {
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
		  // String sid = session.getAttribute("sid").toString();
		   String stfid = request.getParameter("stfid");
		   String name = request.getParameter("name");	
		   String pass = request.getParameter("pass");
		   String ut = request.getParameter("ut");
		
		try{
			//response.setContentType("text/html");
			 // PrintWriter out = response.getWriter();
			  InitialContext ctx = new InitialContext();
			  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
			  Connection conn = ds.getConnection("krazy4","deena111");
			  Statement statement = conn.createStatement();
			  
			  
			 statement.executeUpdate("INSERT INTO USER_PHS(PASSWORD, USERNAME, U_ID, STAFF_ID, USERTYPE_ID)VALUE('"+pass+"', '"+name+"', 'u0000008', '"+stfid+"','(SELECT USERTYPE_ID FROM USERTYPE_MASTER WHERE USERTYPE='"+ut+"')')");
			  
			}
		catch(Exception E){
			//PrintWriter out = response.getWriter();
			out.print(E);
		}

	}

	
	}


