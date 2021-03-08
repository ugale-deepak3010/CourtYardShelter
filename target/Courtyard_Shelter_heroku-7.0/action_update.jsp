<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,courtyard_shelter.*" %>
<%
    String officer_id_temp= (String)session.getAttribute("officer_id");
    int officer_id=Integer.parseInt(officer_id_temp);
    MyDatabaseLib dbconn = (MyDatabaseLib) request.getSession().getAttribute("dbconn");

    String fname=request.getParameter("first_name");
    String sr_no=request.getParameter("sr_no");
    String lname=request.getParameter("last_name");
    String phone=request.getParameter("phone");
    String height0=request.getParameter("height");
    int height=Integer.parseInt(height0);
    String weight0=request.getParameter("weight");
    int weight=Integer.parseInt(weight0);
    String ph=request.getParameter("ph");
    String nick_name=request.getParameter("nick_name");
    String address=request.getParameter("address");
    String gender=request.getParameter("gender");
    String middle_name=request.getParameter("middle_name");
    String fav_food=request.getParameter("fav_food");
    String dob=request.getParameter("dob");
    String email=request.getParameter("email");
    
    try{
String qry8="UPDATE children_record SET first_name='"+fname+"',middle_name='"+middle_name+"',last_name='"+lname+"',nick_name='"+nick_name+"',height="+height+",weight="+weight+",address='"+address+"',gender='"+gender+"',phone='"+phone+"',email='"+email+"',dob='"+dob+"',food='"+fav_food+"',ph='"+ph+"' WHERE sr_no="+sr_no;
dbconn.executorUpdate(qry8);
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", "view_childrens_record.jsp");

    }catch(Exception e){
        out.print("Error=="+e);
    }
%>