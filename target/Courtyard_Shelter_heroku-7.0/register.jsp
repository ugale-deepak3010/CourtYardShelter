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
<div class="container ">
        <center>
    <h3>Register Your Account</h3>
    </center>
    <div class="child-borders">
    	<legend class="shadow border-6 animated fadeInDownBig background-danger shadow-hover border-dotted">Please Fill the Form ~ Courtyard Shelter</legend>
        
    <form  action="action_register.jsp" method="post">
    	
        <center>
       <div class="row">
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">First Name</label>
      <input class="input-block border-4" name="first_name" type="text" pattern="[A-Za-z]{3,32}" id="paperInputs2" required>
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Middle Name</label>
      <input class="input-block" name="middle_name" type="text" pattern="[A-Za-z]{3,32}" id="paperInputs2" required>
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Last Name</label>
      <input class="input-block" name="last_name" type="text" pattern="[A-Za-z]{3,32}" id="paperInputs2" required>
    </div>
  </div>
</div>
            <div class="row">
            <div class="col sm-8">
      <div class="form-group" style="padding-left: 20px;padding-right: 20px;">
      		<label for="paperInputs2">Courtyard Shelter Full Address</label>
      		<input class="input-block"  name="address" type="text" pattern="{3,32}" id="paperInputs2" required>
      </div>
            </div>
            <div class="col sm-4">
      <div class="form-group" popover-top="Min 1number,1 Symbol, 1 lowercase char,1 UPPERCASE char And Total=8 or more" style="padding-left: 20px;padding-right: 20px;">
      		<label for="paperInputs2">Password</label>
      		<input class="input-block"  name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" type="password" id="paperInputs2" required>
      </div>
            </div>
            </div>
 <div class="row">
 <div class="col sm-4">
    
    <div class="border-6 border border-danger animated wow jello form-group shadow shadow-hover">
 	
  <legend>Your Gender</legend>
  <label for="paperRadios1" class="paper-radio">
    <input type="radio" name="gender" id="paperRadios1" value="Male" required> <span>Male</span>
  </label>
  <label for="paperRadios2" class="paper-radio">
    <input type="radio" name="gender" id="paperRadios2" value="Female" required> <span>Female</span>
  </label>
</div>

  </div>
  <div class="col sm-4">
    <div class="form-group" popover-right="Dont add Country Code">
      <label for="paperInputs2">Your Mobile No.</label>
      <input class="input-block" type="tel" pattern="(6|7|8|9)\d{9}" name="phone" id="paperInputs2">
    </div>
  </div>
  <div class="col sm-4">
    <div class="form-group">
      <label for="paperInputs2">Your E-mail</label>
      <input class="input-block" name="email" type="email" id="paperInputs2">
    </div>
  </div>
  </div>
 <button type="submit" class="btn-success animated wow fadeInDownBig" >Create Account</button></center><br>
    </form>
    </div>
</div>
<br><br><br><hr><br><br>
</body>
</html>