<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,courtyard_shelter.*"%>
<%
String fname=request.getParameter("first_name");
String mname=request.getParameter("middle_name");
String lname=request.getParameter("last_name");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String gender=request.getParameter("gender");
String email=request.getParameter("email");
String password=request.getParameter("password");
MyDatabaseLib dbconn =new MyDatabaseLib();
try{
        
ResultSet rs;
              int max=0;
              rs=dbconn.executorSelect("SELECT MAX(officer_id) from register");
              //rs.next();
              //
              while(rs.next()){
                max=rs.getInt(1);  //Very Important
              }
String qry9="INSERT INTO register VALUES("+(max+1)+",'"+fname+"','"+mname+"','"+lname+"','"+phone+"','"+password+"','"+gender+"','"+email+"')";

dbconn.executorUpdate(qry9);


              
              
out.print("<h3>Successfully Account is created<br>Your Password:<b>"+password+"</b><br>Your ID:<b>"+(max+1)+"</b><br><br><a href='index.jsp'><h1>Login Here</h1></a>");
        
/*
response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", "index.jsp");
*/

}catch(Exception e)
{
out.print("Error="+e);
}finally{
dbconn.closeConnection();
}

%>