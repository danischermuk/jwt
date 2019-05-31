<?php 

require_once('../Connections/drihm.php'); 
require_once('../Autho.php');
$token = null;
        $token = "";
        if (isset($_GET['token'])) {$token = $_GET['token']; }
        if (isset($_POST['token'])) {$token = $_POST['token'];}
        
        
        if (Autho::verifyJWT($token)) {
            $requestMethod = $_SERVER['REQUEST_METHOD'];
            // retrieve the inbound parameters based on request type.
            switch($requestMethod) {
                
                case 'GET':
                    mysqli_select_db( $drihm,$database_drihm);
                    $query = "SELECT * FROM usuario ";
                    $result = mysqli_query($drihm, $query) or die(mysqli_error($drihm));
                    $loginFoundUser = mysqli_num_rows($result);
                    mysqli_close($drihm);
                    $myArray = array();
                    while($row = mysqli_fetch_assoc($result)) {
                        $myArray[] = $row;
                    }
                    echo json_encode($myArray);

                break;

                case 'POST':
                    // EJEMPLO DE QUERY PARA INSERTAR O ACTUALIZAR DE UNA:
                    // INSERT INTO `usuario` (`password`, `username`) VALUES( 'DANIEL', 'DANDANIEL3') ON DUPLICATE KEY UPDATE `password` = "DANDANIEL3"

                    if (isset($_POST['token'])) {$token = $_POST['token'];} else return false;
                    if (isset($_POST['username'])) {$username = $_POST['username'];} else return false;
                    if (isset($_POST['password'])) {$password = $_POST['password'];} else return false;
                                        
                    mysqli_select_db( $drihm,$database_drihm);
                    
                    $query = sprintf("INSERT INTO `usuario` (`username`, `password`) VALUES( \"%s\", \"%s\") ON DUPLICATE KEY UPDATE `password` = \"%s\"",
                    $username, $password, $password);

                    $result = mysqli_query($drihm, $query) or die(mysqli_error($drihm));
                    mysqli_close($drihm);
                    echo $result;
                    
                break;
                
                
                case 'DELETE':
                    if (isset($_GET['username'])) {$username = $_GET['username'];} else return false;
                    mysqli_select_db( $drihm,$database_drihm);
                    
                    $query = sprintf("DELETE FROM `usuario` WHERE `username` = \"%s\"",
                    $username);
                    
                    $result = mysqli_query($drihm, $query) or die(mysqli_error($drihm));
                    mysqli_close($drihm);
                    echo $result;
                    
                break;


            default:
                $returnArray = array('error' => 'You have requested an invalid method.');
                $jsonEncodedReturnArray = json_encode($returnArray, JSON_PRETTY_PRINT);
                echo $jsonEncodedReturnArray;
            }
        } 
        else {
            $returnArray = array('error' => 'You are not logged in with a valid token. userId not available');
            echo  json_encode($returnArray, JSON_PRETTY_PRINT);
        }

?>