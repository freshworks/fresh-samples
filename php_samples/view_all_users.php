<?php
  $API_KEY="API_KEY";
  
  $url = 'http://YOUR_DOMAIN.freshdesk.com/contacts.json?state=all';
  $ch = curl_init ($url);
  
  curl_setopt($ch, CURLOPT_USERPWD, "$API_KEY:X");
  curl_setopt($ch, CURLOPT_HEADER, false);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
  curl_setopt($ch, CURLOPT_VERBOSE, 1);
  $server_output = curl_exec ($ch);
  
  $contacts = json_decode($server_output);
  
  var_dump($contacts);
  curl_close ($ch);
?>

