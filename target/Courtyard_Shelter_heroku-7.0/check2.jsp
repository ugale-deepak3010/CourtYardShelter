<%-- 
    Document   : check2
    Created on : 29 May, 2020, 11:06:22 AM
    Author     : Deepak
--%>
<%@page import="java.sql.*,java.util.*,courtyard_shelter.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
try{

        MyDatabaseLib dbconn = (MyDatabaseLib) request.getSession().getAttribute("dbconn");
//Object obj=session.getAttribute("object");
//out.print(obj.toString());
out.print("<br>connection status="+dbconn.getConnectionStatus());
out.print("<br>problem="+dbconn.errorDisplay()+"<br> connections="+dbconn.connections+" <br>closing...."+dbconn.closeConnection()+"<br>connection status="+dbconn.getConnectionStatus()+"<br> connections="+dbconn.connections);
}catch(Exception e){
out.print("Error "+e);
}finally{
out.print("<br> finally");
}
%>
    </body>
</html>
