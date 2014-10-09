<?php 

$API_KEY = "YOUR_API_KEY";
$FD_ENDPOINT = "http://YOUR_DOMAIN.freshdesk.com"; // verify if you are using https, and change accordingly!

$payload = array(
  'helpdesk_ticket[email]' => 'test@example.com',
  'helpdesk_ticket[subject]' => 'test',
  'helpdesk_ticket[description]' => 'testing description content',
  // php5.4 & below: 'helpdesk_ticket[attachments][][resource]' =>  "@data/x.png"
  'helpdesk_ticket[attachments][][resource]' =>  curl_file_create("data/x.png", "image/png", "x.png")
);
$header[] = "Content-type: multipart/form-data";

$url = "$FD_ENDPOINT/helpdesk/tickets.json";

$ch = curl_init ($url);

curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);

curl_setopt($ch, CURLOPT_USERPWD, "$API_KEY:X");
curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
curl_setopt($ch, CURLOPT_HEADER, false);

curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
$server_output = curl_exec($ch);

$response = json_decode($server_output);
var_dump($response);

curl_close ($ch);

?>
