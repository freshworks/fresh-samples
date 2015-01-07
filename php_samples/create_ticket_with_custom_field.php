<?php
$fd_domain = "http://YOUR_DOMAIN.freshdesk.com";
$token = "YOUR_API_KEY";
$password = "X";

$custom_field = array(
          "weapon_1" => "Laser Gun" );

$data = array(
    "helpdesk_ticket" => array(
        "description" => "Some details on the issue ...",
        "subject" => "Support needed..",
        "email" => "tom@outerspace.com",
        "priority" => 1,
        "status" => 2,
        "custom_field" => $custom_field
    ),
    "cc_emails" => "ram@freshdesk.com,diana@freshdesk.com"
);

$json_body = json_encode($data, JSON_FORCE_OBJECT | JSON_PRETTY_PRINT);

$header[] = "Content-type: application/json";
$connection = curl_init("$fd_domain/helpdesk/tickets.json");
curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
curl_setopt($connection, CURLOPT_HEADER, false);
curl_setopt($connection, CURLOPT_USERPWD, "$token:$password");
curl_setopt($connection, CURLOPT_POST, true);
curl_setopt($connection, CURLOPT_POSTFIELDS, $json_body);
curl_setopt($connection, CURLOPT_VERBOSE, 1);

$response = curl_exec($connection);
echo $response;
?>
