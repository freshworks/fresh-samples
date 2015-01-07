<?php
$fd_domain = "https://YOURDOMAIN.freshdesk.com";
$token = "YOUR_FRESHDESK_API_TOKEN";
$password = "X";

$custom_field = array(
          "weapon_1" => "Laser Gun" );

$data = array(
    "helpdesk_ticket" => array(
        "priority" => 4,
        "status" => 3,
        "custom_field" => $custom_field
    )
);

$json_body = json_encode($data, JSON_FORCE_OBJECT | JSON_PRETTY_PRINT);

$header[] = "Content-type: application/json";
$connection = curl_init("$fd_domain/helpdesk/tickets/[ticket_id].json");
curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
curl_setopt($connection, CURLOPT_HEADER, false);
curl_setopt($connection, CURLOPT_USERPWD, "$token:$password");
curl_setopt($connection, CURLOPT_POSTFIELDS, $json_body);
curl_setopt($connection, CURLOPT_CUSTOMREQUEST, 'PUT');
curl_setopt($connection, CURLOPT_VERBOSE, 1);

$response = curl_exec($connection);
echo $response;
?>
