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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class inventory
 */
public class inventory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inventory() {
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
		  String sid = session.getAttribute("sid").toString();
		  String utid = session.getAttribute("utid").toString();
		  String iname = request.getParameter("iname");
		  String iaval = request.getParameter("iaval");
		  String need = request.getParameter("need");
		  String order = request.getParameter("order");
		  try{
				//response.setContentType("text/html");
				 // PrintWriter out = response.getWriter();
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  
				 statement.executeUpdate("INSERT INTO INVENTORY_MASTER (INVENTORY_ID, INVENTORY_NAME, INVENTORY_AVAILABLE, INVENTORY_NEEDED, INVENTORY_ORDERED, STAFF_ID, USERTYPE_ID)VALUES ('IN000017','"+iname+"','"+iaval+"','"+need+"','"+order+"','"+sid+"','"+utid+"')");
				  
				/* if(i!=0){
					//response.sendRedirect("../Jiva/admin/display.jsp");
				out.println("Record has been inserted successfully.........!!!");
				 }
				 else{
					 out.println("TRY AGAIN");
				 }*/
				  
				  
			}
			catch(Exception E){
				//PrintWriter out = response.getWriter();
				out.print(E);
			}

	}

}
