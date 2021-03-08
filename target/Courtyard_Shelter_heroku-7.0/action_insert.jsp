<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,courtyard_shelter.*" %>
<%
    try{
    String officer_id_temp= (String)session.getAttribute("officer_id");
    int officer_id=Integer.parseInt(officer_id_temp);
    MyDatabaseLib dbconn = (MyDatabaseLib) request.getSession().getAttribute("dbconn");

    String fname=request.getParameter("first_name");
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
    
    /*
 
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/courtyard_shelter","root","");

        Class.forName("org.postgresql.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:postgresql://ec2-52-87-135-240.compute-1.amazonaws.com:5432/d1lrfkqiaqk60a?sslmode=require","ypnmjntbyscsnm","26c2268eb163c8fc025b87d9b5809c4deb3954a18d0d871beb5dedc22021b32c");

Statement st= con.createStatement();

*/
              ResultSet rs;
              ResultSet rs2;
              int count=0;
              String qry2="SELECT COUNT(officer_id) FROM children_record WHERE officer_id="+officer_id;
              rs=dbconn.executorSelect(qry2);//rs=st.executeQuery(qry2);
              //rs.next();
              //
              while(rs.next()){
                count=rs.getInt(1);  //Very Important
              }
             int roll_no=count+1;
             
              int max=0;
              rs2=dbconn.executorSelect("SELECT MAX(sr_no) from children_record");
              //rs.next();
              //
              while(rs2.next()){
                max=rs2.getInt(1);  //Very Important
              }

String qry8="INSERT INTO children_record VALUES("+(max+1)+","+roll_no+",'"+fname+"','"+middle_name+"','"+lname+"','"+nick_name+"','"+height+"','"+weight+"','"+address+"','"+gender+"','"+phone+"','"+email+"','"+dob+"','"+fav_food+"','"+ph+"',"+officer_id+")";
dbconn.executorUpdate(qry8);
         response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", "view_childrens_record.jsp");
    }catch(Exception e){
        out.print("Error=="+e);
    }
%>