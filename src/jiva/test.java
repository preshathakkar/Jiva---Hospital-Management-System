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

/**
 * Servlet implementation class test
 */
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
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
		  	
		  // HttpSession session = request.getSession();
		  //String tname = request.getParameter("tstname");
		  //String tdesc = request.getParameter("tstdesc");
		  //String tch = request.getParameter("tstch");
		  try{
				//response.setContentType("text/html");
				 // PrintWriter out = response.getWriter();
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  String strSQL ="SELECT * FROM TEST_MASTER";
				  ResultSet rs = statement.executeQuery(strSQL);
				  //int m=0,j=0;
				  while(rs.next()){
					  out.print(rs.getString("TEST_ID"));
					  //String s = rs.getString("TEST_ID").substring(1,7);
					  //out.print(s);
					 //int t =Integer.parseInt(s);
					// out.print(t);
					 //if(m>t){
					//	 m=t;
					// }
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
