<%@page import="java.sql.*,java.util.*,courtyard_shelter.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Courtyard Shelter</title>
	<link rel="stylesheet" type="text/css" href="css/paper.min.css">
        <link rel="stylesheet" type="text/css" href="css/animate.css">
            <link rel="shortcut icon" href="img/cs_ico.png" type="image/x-icon" />

</head>
<body>
    
    <%
    String officer_id = (String)session.getAttribute("officer_id");
    MyDatabaseLib dbconn = (MyDatabaseLib) request.getSession().getAttribute("dbconn");
if (officer_id == null){
	response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", "index.jsp");
}
else{ }
    %>
    <%!
        String fn="",mn="", ln="",nn="",ad="",ph="",em="",gn="",dob="",fd="",phone="";
        int ht=0,wt=0,roll_no=0;
      
    %>
<%
    String sr_no_temp=request.getParameter("sr_no");
    int sr_no=Integer.parseInt(sr_no_temp);
    

    try{
              ResultSet rs;

              rs=dbconn.executorSelect("SELECT * from children_record WHERE sr_no="+sr_no);
              while(rs.next()){
                 fn=rs.getString("first_name");
                 mn=rs.getString("middle_name");
                 ln=rs.getString("last_name");
                 nn=rs.getString("nick_name");
                 roll_no=rs.getInt("roll_no");
                 ht=rs.getInt("height");
                 wt=rs.getInt("weight");
                 ad=rs.getString("address");
                 ph=rs.getString("ph");
                 em=rs.getString("email");
                 gn=rs.getString("gender");
                 dob=rs.getString("dob");
                 fd=rs.getString("food");
                 phone=rs.getString("phone");
              }
    }catch(Exception e){
              out.print("errror"+e);
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
        <li><a href="#s">Update Record</a></li>
        <li><a href="view_childrens_record.jsp#actions">Delete Record</a></li>
        <li><a href="logout.jsp">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
<center>
<h1>Update Children Record</h1>
</center>
<div>


 <fieldset>
     <legend>Children Roll No:<% out.print(roll_no); %></legend>
    <form action="action_update.jsp" method="post">
        <center>
       <div class="row">
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child First Name</label>
      <input class="input-block" name="first_name" type="text" value="<% out.print(fn); %>" pattern="[A-Za-z]{3,32}" required>
      <input name="sr_no" type="text" value="<% out.print(sr_no); %>" style="display: none">
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child Middle Name</label>
      <input class="input-block" name="middle_name" type="text" pattern="[A-Za-z]{3,32}" value="<% out.print(mn); %>"  required>
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child Last Name</label>
      <input class="input-block" name="last_name" type="text" pattern="[A-Za-z]{3,32}" value="<% out.print(ln); %>" required>
    </div>
  </div>
</div>

<div class="row">
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child Nick Name</label>
      <input class="input-block" name="nick_name" type="text" pattern="[A-Za-z]{3,32}" value="<% out.print(nn); %>" required>
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child Height (cm)</label>
      <input class="input-block" name="height" type="tel" pattern="[0-9]{1,3}" value="<% out.print(ht); %>" required>
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child Weight (kg)</label>
      <input class="input-block" name="weight" type="tel" pattern="[0-9]{1,2}" value="<% out.print(wt); %>" required>
    </div>
  </div>
</div>

      <div class="form-group">
          <label for="paperInputs2">Child Full Address</label>
          <input class="input-block" name="address" type="text" pattern="{3,99}" value="<% out.print(ad); %>" required>
        </div>
 <div class="row">
 <div class="col sm-4">
    
    <div class="form-group" popover-top="Please Select Gender if you not select default is null">
  <fieldset>
  <legend>Child Gender</legend>
  <label for="paperRadios1" class="paper-radio">
      <input type="radio"  name="gender" value="Boy" id="paperRadios1" required> <span>Boy</span>
  </label>
  <label for="paperRadios2" class="paper-radio">
      <input type="radio"  name="gender" value="Girl" id="paperRadios2" required> <span>Girl</span>
  </label>
</fieldset>
</div>

  </div>
  <div class="col sm-4">
    <div class="form-group" popover-top="dont add country code">
      <label for="paperInputs2">Child Parent Mobile No.</label>
      <input class="input-block" name="phone" type="tel" value="<% out.print(phone); %>" pattern="(6|7|8|9)\d{9}" >
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child Parent E-mail</label>
      <input class="input-block" name="email" value="<% out.print(em); %>" type="email" >
    </div>
  </div>
  </div>

  <div class="row">
  <div class="col sm-4">
    <div class="form-group" popover-left="Please enter properly DOB">
      <label for="paperInputs2">Child Date of Birth</label>
      <input class="input-block" value="<% out.print(dob); %>" name="dob" type="date" required>
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group" popover-top="ie butterscotch icecream, mango juice">
      <label for="paperInputs2">Child favorate Food</label>
      <input class="input-block" name="fav_food" type="text" value="<% out.print(fd); %>" required>
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperSelects1">Physical Challenge</label>
      <select class="input-block" name="ph" id="paperSelects1" required>
          <option name="ph" value="No" <%if(ph.equals("No"))out.print("selected");%> >No</option>
    <option name="ph" value="Yes" <%if(ph.equals("Yes"))out.print("selected");%>>Yes</option>
  <select>
    </div>
  </div>
</div>

 <button type="submit" class="btn-success" >Update Data</button></center>
    </form>
    </fieldset>

	
</div>

</div>
<br><br><br><hr><br><br>
</body>
</html>