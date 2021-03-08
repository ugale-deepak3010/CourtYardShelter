<%@page import="java.sql.*,java.util.*,courtyard_shelter.*"%>
<%
    String sr_no_temp=request.getParameter("sr_no");
    int sr_no=Integer.parseInt(sr_no_temp);
    MyDatabaseLib dbconn = (MyDatabaseLib) request.getSession().getAttribute("dbconn");

    try{
              dbconn.executorUpdate("DELETE  FROM children_record WHERE sr_no="+sr_no);
              response.setStatus(response.SC_MOVED_TEMPORARILY);
              response.setHeader("Location", "view_childrens_record.jsp");
    }catch(Exception e){
        out.print("Error=="+e);
    }
%>