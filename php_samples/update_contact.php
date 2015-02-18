 
<?php

    $email="user@company.com";//username or apiKey
    $password="test";//pwd or X
    $domain = "http://domain.freshdesk.com";

    $header[] = "Content-type: application/json";
    $data = array(
        		 "user" => array("tags"=>"tags1", "job_title"=>"Super man")
        	);
        
    $json_body = json_encode($data);
    $header[] = "Content-type: application/json";
    $connection = curl_init();
    curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($connection, CURLOPT_HTTPHEADER, $header);   
    curl_setopt($connection, CURLOPT_HEADER, false);
    curl_setopt($connection, CURLOPT_USERPWD, "$email:$password");
    curl_setopt($connection, CURLOPT_POSTFIELDS, $json_body);
    curl_setopt($connection, CURLOPT_CUSTOMREQUEST, 'PUT');
    curl_setopt($connection, CURLOPT_VERBOSE, 1);
    curl_setopt($connection, CURLOPT_URL, $domain."/contacts/1.json");
    $response = curl_exec($connection);
    curl_close($connection); 
        
    echo $response;

?>    