<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.lang.*,java.util.*,courtyard_shelter.*"%>

<%    
    String officer_id=request.getParameter("officer_id");
    String pass=request.getParameter("password");

try{
    MyDatabaseLib dbconn=new MyDatabaseLib();

ResultSet rs;
String qry="select * from register where officer_id='"+officer_id+"' and password='"+pass+"'";
rs=dbconn.executorSelect(qry);
rs.next();

//out.print("<br>"+qry+"<br>connected="+dbconn.getConnectionStatus()+"<br> Exception='"+dbconn.errorDisplay()+"'");

if(rs.getString("password").equals(pass)&&rs.getString("officer_id").equals(officer_id))
{

    //login
         session.setAttribute("officer_id", officer_id); 
/**************** Object Setting ***********/
         session.setAttribute("dbconn", dbconn);
/*****************************************/
         //forwording...
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", "insert.jsp");   
}
else
{
//not work because resultset exception creat in if (empty resultset on operation not perform..)
}

} catch(SQLException sqle){
   out.println("<script>alert('Invalid password or username.');</script>");
}catch (Exception e) {
//out.println("Error=="+e);
//e.printStackTrace();
}finally{
    out.println("<br><h1><a href='index.jsp'>Go Back</a></h1>");
}
%>