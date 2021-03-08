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
<body style="background-image: url('img/bg1.jpg');background-repeat: repeat;background-attachment: scroll;" >
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
<center>
<h1>Insert Children Record</h1>
</center>
<div>


 <fieldset>
      <legend>Children Roll No:<%
          String officer_id = (String)session.getAttribute("officer_id");
          MyDatabaseLib dbconn = (MyDatabaseLib) request.getSession().getAttribute("dbconn");

if (officer_id == null){
	response.setStatus(response.SC_MOVED_TEMPORARILY);
         response.setHeader("Location", "index.jsp");
}
else{ }

          try{
        
              ResultSet rs;
              int max=0;
              rs=dbconn.executorSelect("SELECT MAX(roll_no) from children_record WHERE officer_id="+officer_id);
              //rs.next();
              //
              while(rs.next()){
                max=rs.getInt(1);  //Very Important
              }
              out.print(max+1);

              out.print(dbconn.errorDisplay());//connections
             // out.print(MyDatabaseLib.connections);
          }catch(Exception e){
              out.print("errror"+e);
              
          }finally{
            }
        %></legend>
    <form action="action_insert.jsp" method="post">
        <center>
       <div class="row">
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child First Name</label>
      <input class="input-block" name="first_name" type="text" pattern="[A-Za-z]{3,32}"  required>
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child Middle Name</label>
      <input class="input-block" name="middle_name" type="text" pattern="[A-Za-z]{3,32}"  required>
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child Last Name</label>
      <input class="input-block" name="last_name" type="text" pattern="[A-Za-z]{3,32}"  required>
    </div>
  </div>
</div>

<div class="row">
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child Nick Name</label>
      <input class="input-block" name="nick_name" type="text" pattern="[A-Za-z]{3,32}" >
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child Height (cm)</label>
      <input class="input-block" name="height" type="tel" pattern="[0-9]{1,3}" required>
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child Weight (kg)</label>
      <input class="input-block" name="weight" type="tel" pattern="[0-9]{1,2}"  required>
    </div>
  </div>
</div>

      <div class="form-group">
          <label for="paperInputs2">Child Full Address</label>
          <input class="input-block" name="address" type="text" pattern="{3,99}"  >
        </div>
 <div class="row">
 <div class="col sm-4">
    
    <div class="form-group">
  <fieldset>
  <legend>Child Gender</legend>
  <label for="paperRadios1" class="paper-radio">
    <input type="radio"  name="gender" id="paperRadios1" value="Boy" required> <span>Boy</span>
  </label>
  <label for="paperRadios2" class="paper-radio">
    <input type="radio"  name="gender" id="paperRadios2" value="Girl" required> <span>Girl</span>
  </label>
</fieldset>
</div>

  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child Parent Mobile No.</label>
      <input class="input-block" name="phone" type="tel" pattern="(6|7|8|9)\d{9}" >
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child Parent E-mail</label>
      <input class="input-block" name="email"  type="email" >
    </div>
  </div>
  </div>

  <div class="row">
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child Date of Birth</label>
      <input class="input-block" name="dob" type="date" required>
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Child favorate Food</label>
      <input class="input-block" name="fav_food" type="text" >
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperSelects1">Physical Challenge</label>
      <select class="input-block" name="ph" id="paperSelects1" required>
    <option name="ph" value="No" >No</option>
    <option name="ph" value="Yes">Yes</option>
  </select>
    </div>
  </div>
</div>

 <button type="submit" class="animated slideInUp wow btn-success" >Insert Data</button></center>
    </form>
    </fieldset>

	
</div>

</div>
<br><br><br><hr><br><br>
<div  ><hr><br><br><hr></div>
</body>
</html>