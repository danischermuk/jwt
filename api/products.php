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
                    mysqli_set_charset($drihm, 'utf8');
                    $query = "SELECT producto.id, producto.descripcion, producto.marca, producto.rubroId, codigo.nombre AS codigoNombre, codigo.codigo AS codigoCodigo , lecheparve.nombre AS lecheparve, lecheparve.codigo AS lecheparveCodigo, rubro.nombre AS rubro FROM producto JOIN codigo ON producto.nivelId = codigo.id JOIN lecheparve ON producto.lecheparveId = lecheparve.id JOIN rubro ON producto.rubroId = rubro.id ORDER BY rubro, producto.descripcion";
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
                    // CAMBIAR PARA PRODUCTO

                    if (isset($_POST['id'])) {$id = $_POST['id'];} else return false;
                    if (isset($_POST['marca'])) {$marca = $_POST['marca'];} else return false;
                    if (isset($_POST['imagen'])) {$imagen = $_POST['imagen'];} else return false;
                    if (isset($_POST['rubroId'])) {$rubroId = $_POST['rubroId'];} else return false;
                    if (isset($_POST['nivelId'])) {$nivelId = $_POST['nivelId'];} else return false;
                    if (isset($_POST['lecheparveId'])) {$lecheparveId = $_POST['lecheparveId'];} else return false;
                    if (isset($_POST['descripcion'])) {$descripcion = $_POST['descripcion'];} else return false;

                                        
                    mysqli_select_db( $drihm,$database_drihm);
                    
                    $query = sprintf("INSERT INTO `producto` (`id`, `marca`, `imagen`, `rubroId`, `nivelId`, `lecheparveId`, `descripcion`) VALUES( \"%s\", \"%s\", \"%s\", \"%s\", \"%s\", \"%s\", \"%s\") 
                    ON DUPLICATE KEY UPDATE  `marca`= \"%s\", `imagen`= \"%s\", `rubroId`= \"%s\", `nivelId`= \"%s\", `lecheparveId`= \"%s\", `descripcion` = \"%s\"",
                    
                    $id, $marca, $imagen, $rubroId, $nivelId, $lecheparveId, $descripcion, $marca, $imagen, $rubroId, $nivelId, $lecheparveId, $descripcion);

                    $result = mysqli_query($drihm, $query) or die(mysqli_error($drihm));
                    mysqli_close($drihm);
                    echo $result;
                    
                break;
                
                
                case 'DELETE':
                    if (isset($_GET['id'])) {$id = $_GET['id'];} else return false;
                    mysqli_select_db( $drihm,$database_drihm);
                    
                    $query = sprintf("DELETE FROM `producto` WHERE `id` = \"%s\"",
                    $id);
                    
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