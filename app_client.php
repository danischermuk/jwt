<?php
/**
 * This file processes the login request and sends back a token response
 * if successful.
 */

require_once('Autho.php');

$requestMethod = $_SERVER['REQUEST_METHOD'];
// retrieve the inbound parameters based on request type.
switch($requestMethod) {

    case 'GET':
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

