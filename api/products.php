<?php 

require_once('../Connections/drihm.php'); 
require_once('jwt.php');

$token = null;
        
        if (isset($_GET['token'])) {$token = $_GET['token'];}

        if (!is_null($token)) {

            require_once('jwt.php');

            // Get our server-side secret key from a secure location.
            $serverKey = '5f2b5cdbe5194f10b3241568fe4e2b24';

            try {
                $payload = JWT::decode($token, $serverKey, array('HS256'));
                
                    
                    mysqli_select_db( $drihm,$database_drihm);
                     
                    $LoginRS__query=sprintf("SELECT * FROM products "); 
                         
                    $LoginRS = mysqli_query($drihm, $LoginRS__query) or die(mysqli_error());
                    $loginFoundProducts = mysqli_num_rows($LoginRS);
                    mysqli_close($drihm);

                    return json_encode($LoginRS, JSON_PRETTY_PRINT);
                    
            }
            catch(Exception $e) {
                $returnArray = array('error' => $e->getMessage());
            }
        } 
        else {
            $returnArray = array('error' => 'You are not logged in with a valid token.');
        }
        
        // return to caller
        $jsonEncodedReturnArray = json_encode($returnArray, JSON_PRETTY_PRINT);
        echo $jsonEncodedReturnArray;






?>