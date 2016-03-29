<?php 

$api_key = "API_KEY";
$password = "x";
$yourdomain = "YOUR_DOMAIN";

// Reply will be added to the ticket with the following id
$ticket_id = 57;

$note_payload = array(
  'body' => 'This is a sample reply',
  'attachments[]' =>  curl_file_create("data/x.png", "image/png", "x.png")
);

$url = "https://$yourdomain.freshdesk.com/api/v2/tickets/$ticket_id/notes";

$ch = curl_init($url);

curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_HEADER, true);
curl_setopt($ch, CURLOPT_USERPWD, "$api_key:$password");
curl_setopt($ch, CURLOPT_POSTFIELDS, $note_payload);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$server_output = curl_exec($ch);
$info = curl_getinfo($ch);
$header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
$headers = substr($server_output, 0, $header_size);
$response = substr($server_output, $header_size);

if($info['http_code'] == 201) {
  echo "Note added to the ticket, the response is given below \n";
  echo "Response Headers are \n";
  echo $headers."\n";
  echo "Response Body \n";
  echo "$response \n";
} else {
    if($info['http_code'] == 404) {
    echo "Error, Please check the end point \n";
  } else {
    echo "Error, HTTP Status Code : " . $info['http_code'] . "\n";
    echo "Headers are ".$headers."\n";
    echo "Response is ".$response;
  }
}

curl_close($ch);

?>
