<!DOCTYPE html>
<html>
<head>
    <title>Courtyard Shelter</title>
    <link rel="stylesheet" type="text/css" href="css/paper.min.css">
    <link rel="stylesheet" type="text/css" href="css/animated.css">
    <link rel="shortcut icon" href="img/cs_ico.png" type="image/x-icon" />
    <script src="js/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>
</head>
<body>
    <div class="container">
        <center>
    <h3>WelCome in Courtyard Shelter in Children Record </h3>
    </center>
     

    <form class="border child-borders"  action="action_login.jsp" method="post">
        <center>

        <div class="form-group">
            <label>Your ID</label>
            <input type="text"  placeholder="Your ID" name="officer_id" required>
        </div>
        <div>
            <label>Your Password</label>
            <input type="password" placeholder="Your Password" name="password" required>
        </div><br>
            <button type="submit" class="btn-success" >Login</button><br><br>
            <a href="register.jsp">I have no Account.!</a><br>
        </center>
    </form>
</div>
</body>
</html>