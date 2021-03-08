<%@page import="java.sql.*,java.util.*,courtyard_shelter.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Courtyard Shelter</title>
	<link rel="stylesheet" type="text/css" href="css/paper.min.css">
        <link rel="stylesheet" type="text/css" href="css/animate.css">
            <link rel="shortcut icon" href="img/cs_ico.png" type="image/x-icon" />

        <script src="js/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>
</head>
<body>
    <%
    String officer_id = (String)session.getAttribute("officer_id");
    MyDatabaseLib dbconn = (MyDatabaseLib) request.getSession().getAttribute("dbconn");

if (officer_id == null){
response.setStatus(response.SC_MOVED_TEMPORARILY);
response.setHeader("Location","index.jsp");
}
else{
}
    %>
<div class="container">
<nav class="border fixed">
  
  <div class="collapsible">
    <input id="collapsible2" type="checkbox" name="collapsible2">
    <button>
      <label for="collapsible2">
        <div class="bar1"></div>
        <div class="bar2"></div>
        <div class="bar3"></div>
      </label>
    </button>
    <div class="collapsible-body">
      <ul class="inline animated bounceInRight">
        <li><a href="insert.jsp">Insert&nbsp;Record</a></li>
        <li><a href="view_childrens_record.jsp">View&nbsp;Record</a></li>
        <li><a href="view_childrens_record.jsp#actions">Update Record</a></li>
        <li><a href="view_childrens_record.jsp#actions">Delete Record</a></li>
        <li><a href="logout.jsp">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
</div>
<div class="">
  <br>
  <center><h1>View Childrens Record</h1></center>
<div>

    <div class="" style="padding-left: 20px; padding-right: 40px">
 <table class="table-hover border-danger border-dashed border-thick border-5 table-alternating" style="padding-right: 100px;padding-left: 20px">
     <thead>
         <tr class="child-borders">
             <th class="shadow shadow-hover">Roll&nbsp;No.</th>
      <th>First&nbsp;Name</th>
      <th class="shadow animated wow slideInUp shadow-hover">Middle&nbsp;Name</th>
      <th>Last&nbsp;Name</th>
      <th class="shadow shadow-hover">Nick&nbsp;Name</th>
      <th>Height</th>
      <th class="shadow shadow-hover">Weight</th>
      <th>Address</th>
      <th class="shadow shadow-hover">Gender</th>
      <th>Parent&nbsp;Mobile</th>
      <th class="shadow shadow-hover">Parent&nbsp;Email</th>
      <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DOB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      <th class="shadow shadow-hover">Faverate&nbsp;Food</th>
      <th>PH</th>
      <th class="shadow animated wow slideInLeft shadow-hover" id="actions">Actions</th>
    </tr>
  </thead>
  <tbody>
    
      <%
          try{

              ResultSet rs;
              int sr_no=0;
              rs=dbconn.executorSelect("SELECT * from children_record WHERE officer_id="+officer_id+" ORDER BY roll_no");
              while(rs.next()){
                out.print("<tr>");
                out.print("<td>"+rs.getInt("roll_no")+"</td>");
                sr_no=rs.getInt("sr_no");
                out.print("<td>"+rs.getString("first_name")+"</td>");
                out.print("<td>"+rs.getString("middle_name")+"</td>");
                out.print("<td>"+rs.getString("last_name")+"</td>");
                out.print("<td>"+rs.getString("nick_name")+"</td>");
                out.print("<td>"+rs.getInt("height")+"</td>");
                out.print("<td>"+rs.getInt("weight")+"</td>");
                out.print("<td>"+rs.getString("address")+"</td>");
                out.print("<td>"+rs.getString("gender")+"</td>");
                out.print("<td>"+rs.getString("phone")+"</td>");
                out.print("<td>"+rs.getString("email")+"</td>");
                out.print("<td>"+rs.getString("dob")+"</td>");
                out.print("<td>"+rs.getString("food")+"</td>");
                out.print("<td>"+rs.getString("ph")+"</td>");
               
                out.print("<td><div class='btn-group-sm'><a href='update_cr.jsp?sr_no="+sr_no+"' class='btn btn-small'>Update</a>&nbsp;&nbsp;&nbsp;<a href='delete_cr.jsp?sr_no="+sr_no+"'  class='btn btn-danger'>Delete</a></div></td>");
                out.print("</tr>");
              }
              //out.print(max+1);
          }catch(Exception e){
              out.print("errror"+e);
          }
        %>
      
  </tbody>
</table>
    </div>
<!-- Add table-hover or table-alternating to change the style of the table -->


	
</div>

</div>
<br><br><br><hr><br><br>
</body>
</html>