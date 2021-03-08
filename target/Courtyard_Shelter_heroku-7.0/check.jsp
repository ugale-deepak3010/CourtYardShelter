<%@page import="java.sql.*,java.util.*,courtyard_shelter.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>CHECK</title>
</head>
<body>
<%
try{
out.print("Heat");
//HttpSession session = request.getSession();
MyDatabaseLib dbconn = new MyDatabaseLib();
session.setAttribute("dbconn", dbconn);
out.print("<br>this is next line");
}catch(Exception e){
out.print("Error" +e);
}
%>
</body>
</html>