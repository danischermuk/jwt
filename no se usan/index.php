<!DOCTYPE html>
<html class="bootstrap-admin-vertical-centered">
    <head>
        <title>Drihm</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="../favicon.png">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet" media="screen">

        <!-- Bootstrap Admin Theme -->
        <link href="css/bootstrap-admin-theme.css" rel="stylesheet" media="screen">

        <!-- Custom styles -->
        <style type="text/css">
            .alert{
                margin: 0 auto 20px;
            }
        </style>

<body class="bootstrap-admin-without-padding"  onload="document.formlog.user.focus();">
  <div class="container">
    <div class="row">
    <?php if(isset($_GET['error'])){ ?>
        <div class="alert alert-info">
            <a class="close" data-dismiss="alert" href="#">&times;</a>
            Usuario/Password incorrectos
        </div>
    <?php } ?>    
        <form method="post" name="formlog" action="log.php" class="bootstrap-admin-login-form">
            <h1>Login</h1>
            <div class="form-group">
                <input class="form-control" type="text" name="user" placeholder="Usuario">
            </div>
            <div class="form-group">
                <input class="form-control" type="password" name="pass" placeholder="Password">
            </div>
            <div class="form-group">
               <!-- <label>
                    <input type="checkbox" name="remember_me">
                    Remember me
                </label>-->
            </div>
            <button class="btn btn-lg btn-primary" type="submit">Entrar</button>
        </form>
    </div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function() {
        // Setting focus
        $('input[name="email"]').focus();

        // Setting width of the alert box
        var formWidth = $('.bootstrap-admin-login-form').innerWidth();
        var alertPadding = parseInt($('.alert').css('padding'));
        $('.alert').width(formWidth - 2 * alertPadding);
    });
</script>
<link rel="stylesheet" href="responsive-sidebar-navigation-master/css/style.css"> <!-- Resource style -->
  
  <div>
    <button id="test">Test if Logged In</button>
    <button id="goodLogin">Good Login</button>
    <button id="badLogin">Bad Login</button>
    <button id="logout">Logout and Clear Token</button>
  </div>
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function() {
    $('#test').click(function() {
      $.ajax({
        type: 'GET',
        url: 'app_client.php',
        dataType: "json",
        data: {
          token: localStorage.token
        },
        success: function(data) {
          if (typeof data['userId'] !== 'undefined') {
            var alertMessage = 'You have a valid token! Here is your user Id: ' + data['userId'];

            if (typeof data['exp'] !== 'undefined') {
              alertMessage = alertMessage + ' and your token expires: ' + data['exp'];
            }

            alert(alertMessage);

          } 
          else if (typeof data['error'] !== 'undefined') {
            alert('Error: ' + data['error']);
          }
          else {
            alert('Error: Your request has failed.');
          }
        }
      });
    });
    $('#goodLogin').click(function() {
      $.ajax({
        type: "POST",
        url: "app_client.php",
        dataType: "json",
        data: {
          username: "john.doe",
          password: "foobar"
        },
        success: function(data) {
          localStorage.token = data['token'];
          alert('Successfully retrieved token from the server! Token: ' + data['token']);
        },
        error: function() {
          alert("Error: Login Failed");
        }
      });
    });
    $('#badLogin').click(function() {
      $.ajax({
        type: "POST",
        url: "app_client.php",
        dataType: "json",
        data: {
          username: "john.doe",
          password: "foobarfoobar"
        },
        success: function(data) {
          if (typeof data['error'] !== 'undefined') {
            alert('Error: ' + data['error']);
            localStorage.clear();
          }
        },
        error: function() {
          alert('Error: Your request has failed.');
        }
      });
    });
    $('#logout').click(function() {
      localStorage.clear();
    });
  });
  </script>
</body>

</html>