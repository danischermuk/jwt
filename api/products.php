<?php 

require_once('../Connections/drihm.php'); 
require_once('Autho.php');
$token = null;
        
        if (isset($_GET['token'])) {$token = $_GET['token'];}

        $user = Autho::checkJWT($token);
        
        if (!is_null($token.userId)) {
            $requestMethod = $_SERVER['REQUEST_METHOD'];
            // retrieve the inbound parameters based on request type.
            switch($requestMethod) {
                
                case 'GET':
                    $query = 'SELECT ';
                break;

                case 'POST':
                    $token = null;
                    if (isset($_GET['token'])) {$token = $_GET['token'];}
                    $jsonEncodedReturnArray = Autho::checkJWT($token);
                    echo $jsonEncodedReturnArray;
                break;
                
            default:
                $returnArray = array('error' => 'You have requested an invalid method.');
                $jsonEncodedReturnArray = json_encode($returnArray, JSON_PRETTY_PRINT);
                echo $jsonEncodedReturnArray;
            }
        } 
        else {
            $returnArray = array('error' => 'You are not logged in with a valid token.');
        }
        
        // return to caller
        $jsonEncodedReturnArray = json_encode($returnArray, JSON_PRETTY_PRINT);
        echo $jsonEncodedReturnArray;






?>