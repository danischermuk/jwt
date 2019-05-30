<?php 
  class Autho {


    public static function checkJWT($token) {
        if (!is_null($token)) {

            require_once('jwt.php');

            // Get our server-side secret key from a secure location.
            $serverKey = '5f2b5cdbe5194f10b3241568fe4e2b24';

            try {
                $payload = JWT::decode($token, $serverKey, array('HS256'));
                $returnArray = array('userId' => $payload->userId);
                if (isset($payload->exp)) {
                    $returnArray['exp'] = date(DateTime::ISO8601, $payload->exp);;
                }
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
        return $jsonEncodedReturnArray;

  }

}