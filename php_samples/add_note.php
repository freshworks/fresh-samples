<?php 

$API_KEY = "API_KEY";
$FD_ENDPOINT = "http://YOUR_DOMAIN.freshdesk.com"; // verify if you are using https, and change accordingly!

$payload = array(
  'helpdesk_note[body]' => 'Note Content',
  'helpdesk_ticket[private]' => 'false',
  // php5.4 & below: 'helpdesk_note[attachments][][resource]' =>  "@x.png"
  'helpdesk_note[attachments][][resource]' =>  curl_file_create("data/x.png", "image/png", "x.png")
);
$header[] = "Content-type: multipart/form-data";

$url = "$FD_ENDPOINT/helpdesk/tickets/[id]/conversations/note.json";

$ch = curl_init($url);

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

var_dump($server_output);
$response = json_decode($server_output);
var_dump($response);

curl_close($ch);

?>
