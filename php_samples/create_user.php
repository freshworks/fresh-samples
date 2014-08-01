<?php

	$email="sample@freshdesk.com";//username or apiKey
	$password="test";//pwd or X

	$data = array(
		 "user" => array("email"=>"me@abc.com","name"=>"Me")
	);

	//encoding to json format
	$jsondata= json_encode($data);

	echo "START....<br /> ";

	$header[] = "Content-type: application/json";
	$connection = curl_init();
	curl_setopt($connection, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($connection, CURLOPT_HTTPHEADER, $header);
	curl_setopt($connection, CURLOPT_FOLLOWLOCATION, true);
	curl_setopt($connection, CURLOPT_HEADER, false);
	curl_setopt($connection, CURLOPT_USERPWD, "sample@freshdesk.com:test");

	curl_setopt($connection, CURLOPT_POST, 1);
	curl_setopt($connection, CURLOPT_POSTFIELDS, $jsondata);
	curl_setopt($connection, CURLOPT_VERBOSE, 1);

	//replace your domain url below.
	curl_setopt($connection, CURLOPT_URL, "http://yourcompany.freshdesk.com/contacts.json");
	$response = curl_exec($connection);

	echo 'RESULT:'.$response;
?>