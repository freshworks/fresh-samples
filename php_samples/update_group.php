<?php

  $email="user@company.com";
  $password = "test";
  $url = 'http://domain.freshdesk.com/groups/[group_id].json';
  // Example : 'http://domain.freshdesk.com/groups/1.json'; 
  // use https if ssl enabled for the account.

  $data = array(
    "group" => array(
      "description" => "Sample Description",
      "name" => "Sample",
      "agent_list" => "1,2,4"
    )
  );

  $update_json = json_encode($data, JSON_FORCE_OBJECT | JSON_PRETTY_PRINT);
  $header[] = "Content-type: application/json";
  
  $ch = curl_init($url);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
  curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
  curl_setopt($ch, CURLOPT_HEADER, false);
  curl_setopt($ch, CURLOPT_USERPWD, "$email:$password");
  curl_setopt($ch, CURLOPT_POSTFIELDS, $update_json);
  curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'PUT');
  curl_setopt($ch, CURLOPT_VERBOSE, 1);
  $response = curl_exec($ch);
  curl_close($ch);

?>
