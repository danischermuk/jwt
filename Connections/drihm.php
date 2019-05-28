<?php
# FileName="Connection_php_mysqli.htm"
# Type="mysqli"
# HTTP="true"
$hostname_drihm = "localhost";
$database_drihm = "ajdutdb";
$username_drihm = "root";
$password_drihm = "";
$drihm = mysqli_connect($hostname_drihm, $username_drihm, $password_drihm); 
if (!$drihm) {
    echo "Error: Unable to connect to mysqli." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    exit;
}
else {
    mysqli_select_db($drihm, $database_drihm);
}




?>