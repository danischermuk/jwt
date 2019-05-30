<?php 
if(isset($_POST['user']) && $_POST['user'] !='' && isset($_POST['pass']) && $_POST['pass']!=''){ 

require_once('./Connections/drihm.php'); 
require_once('jwt.php');

if (!function_exists("GetSQLValueString")) {
function GetSQLValueString($drihm, $theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "") 
{
  if (PHP_VERSION < 6) {
    $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
  }

  $theValue = function_exists("mysqli_real_escape_string") ? mysqli_real_escape_string($drihm, $theValue) : mysqli_escape_string($theValue);

  switch ($theType) {
    case "text":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;    
    case "long":
    case "int":
      $theValue = ($theValue != "") ? intval($theValue) : "NULL";
      break;
    case "double":
      $theValue = ($theValue != "") ? doubleval($theValue) : "NULL";
      break;
    case "date":
      $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
      break;
    case "defined":
      $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
      break;
  }
  return $theValue;
}
}
if (!isset($_SESSION)) {  session_start();}

$loginFormAction = $_SERVER['PHP_SELF'];
if (isset($_GET['accesscheck'])) {
  $_SESSION['PrevUrl'] = $_GET['accesscheck'];
}

if (isset($_POST['user'])) {
  $loginUsername=$_POST['user'];
  $password=$_POST['pass'];
  $MM_fldUserAuthorization = "";
  $MM_redirectLoginSuccess = "index.html#/home/";
  $MM_redirectLoginFailed = "index.html#/login";
  $MM_redirecttoReferrer = false;
  mysqli_select_db( $drihm,$database_drihm);
  
  $LoginRS__query=sprintf("SELECT `username`, `password` FROM usuario WHERE `username`=%s AND `password`=%s",
  GetSQLValueString($drihm, $loginUsername, "text"), GetSQLValueString($drihm, $password, "text")); 
     
  $LoginRS = mysqli_query($drihm, $LoginRS__query) or die(mysqli_error($drihm));
  $loginFoundUser = mysqli_num_rows($LoginRS);
  mysqli_close($drihm);
  if ($loginFoundUser) {
     
    /** 
             * Create some payload data with user data we would normally retrieve from a
             * database with users credentials. Then when the client sends back the token,
             * this payload data is available for us to use to retrieve other data 
             * if necessary.
             */
            $userId = $loginUsername;

            /**
             * Uncomment the following line and add an appropriate date to enable the 
             * "not before" feature.
             */
            // $nbf = strtotime('2021-01-01 00:00:01');

            /**
             * Uncomment the following line and add an appropriate date and time to enable the 
             * "expire" feature.
             */
            $expdate = date('Y-m-d H:i:s');
            
            $exp = strtotime($expdate . ' +1 day');

            // Get our server-side secret key from a secure location.
            $serverKey = '5f2b5cdbe5194f10b3241568fe4e2b24';

            // create a token
            $payloadArray = array();
            $payloadArray['userId'] = $userId;
            if (isset($nbf)) {$payloadArray['nbf'] = $nbf;}
            if (isset($exp)) {$payloadArray['exp'] = $exp;}
            $token = JWT::encode($payloadArray, $serverKey);

            // return to caller
            $returnArray = array('token' => $token);
            $jsonEncodedReturnArray = json_encode($returnArray, JSON_PRETTY_PRINT);
            echo $jsonEncodedReturnArray;
            header("Location: " . $MM_redirectLoginSuccess .$token );


  }
  else {
    header("Location: ". $MM_redirectLoginFailed );
  }
}

} else {
	
	    header("Location: index.php?error" );
	
}
?>