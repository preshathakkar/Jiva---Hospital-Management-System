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
 * Servlet implementation class inpatient
 */
public class inpatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inpatient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
			}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		  PrintWriter out = response.getWriter();
		  HttpSession session = request.getSession();
		  String sid = session.getAttribute("sid").toString();
		  String utid = session.getAttribute("utid").toString();
		  String dept = request.getParameter("dept");
		  String pid = request.getParameter("pid").toString();
		   String docid = request.getParameter("docid").toString();
		   String adate = request.getParameter("adate").toString();
		   String ddate = request.getParameter("ddate");
		   String diag = request.getParameter("diag");
		   //String add1 = request.getParameter("add1");
			
		   String dise = request.getParameter("dise");
		   String distype = request.getParameter("distyp");
		   String add = request.getParameter("add");
		 // out.println("hellooo");
		   try{
				//response.setContentType("text/html");
				 // PrintWriter out = response.getWriter();
				  InitialContext ctx = new InitialContext();
				  DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
				  Connection conn = ds.getConnection("krazy4","deena111");
				  Statement statement = conn.createStatement();
				  
				  
				 statement.executeUpdate("INSERT INTO PATIENT_DETAILS_IN (P_D_ID, ADMIT_DATE, DISCHARGE_DATE, DIAGNOSIS, DISEASE, PATIENT_ID, DOCTOR_ID, DISCHARGE_TYPE, TREATMENT_DESCRIPTION, DEPT_ID, USERTYPE_ID, STAFF_ID)VALUES ('pd000011', '"+adate+"', '"+ddate+"', '"+diag+"', '"+dise+"', '"+pid+"', '"+docid+"', '"+distype+"', '"+add+"', (select Dept_ID from Department_Master where Department='"+dept+"'), '"+utid+"', '"+sid+"')");
				}
			catch(Exception E){
				//PrintWriter out = response.getWriter();
				out.print(E);
			}

	}

}
