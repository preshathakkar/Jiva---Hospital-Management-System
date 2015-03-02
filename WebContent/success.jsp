<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" import="java.io.*, java.sql.*, javax.sql.*, javax.naming.*, java.util.*, java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Jiva</title>
</head>
<body>
<% 

try{
String user = session.getAttribute("uname").toString();
String pass = session.getAttribute("pass").toString();

InitialContext ctx = new InitialContext();
DataSource ds = (DataSource) ctx.lookup ("jdbc/JIVA");
Connection conn = ds.getConnection("krazy4","deena111");
Statement statement = conn.createStatement();
ResultSet rs  = statement.executeQuery("SELECT * FROM USER_PHS where USERNAME='"+user+"' AND PASSWORD='"+pass+"'");


while (rs.next()){
String utid = rs.getString("USERTYPE_ID".toString());
session.setAttribute("utid",utid);
char ch = utid.charAt(7);
//out.println(uid);
session.setAttribute("role",ch);

String uid = rs.getString("U_ID");
session.setAttribute("uid",uid);
String sid = rs.getString("STAFF_ID");
session.setAttribute("sid",sid);
}

String f = session.getAttribute("role").toString(); 

char flag[] = f.toCharArray();

out.println(flag);

switch(flag[0])
    { 
case '1':
	response.sendRedirect("./Admin/index.jsp");
    break;
case '2':  
	response.sendRedirect("./Doctor/index.jsp");
     break;
 case '3': 
 	response.sendRedirect("./Nurse/index.jsp");
     break;
 case '4':
   response.sendRedirect("./Reception/index.jsp");
     break;
 case '5':
   response.sendRedirect("./HR/index.jsp");
     break;
 case '6':
   response.sendRedirect("./Store/index.jsp");
     break;
 default:
 response.sendRedirect("./notfound.html");    
     
     
     } 




}
catch (Exception E){
out.print(E);
} 

%>

</body>
</html>