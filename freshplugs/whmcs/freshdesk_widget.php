<?php

define('APP_KEY', 'test12345');
define('WHMCS_PATH', 'http://mywhmcs.domain.com/whmcs');# URL to WHMCS APP
define('WHMCS_API_USER', 'admin');#API access username goes here
define('WHMCS_API_PASSWORD', 'test123'); #API access password goes here
define('AUTO_AUTH_KEY', 'abcXYZ123'); 
define('FRESHDESK_DOMAIN', 'http://mycompany.freshdesk.com');

define('WHMCS_API_ACCESS_KEY', 'abc123'); #Specify the apiaccesskey or whitelist the access machines ips for api calls in WHMCS app.

header('Access-Control-Allow-Origin: '.FRESHDESK_DOMAIN);
header('Access-Control-Allow-Headers: '.'x-csrf-token');
header('Content-Type: application/json; charset=utf-8');

check_proper_request();
define('AGENT_EMAIL', trim($_REQUEST['agent']));
define('REQ_EMAIL', trim($_REQUEST['email']));
$client = getClientDetails();

if (isset($client->result) && $client->result == 'success') {
	$result = array(
		'client' => $client,
		'products' => getProducts($client)->products,
		'domains' => getDomain($client)->domains,
		'invoices' => getInvoices($client)->invoices,
		'sso_url' => sso_url()
	);
	header('HTTP 1.0 200 OK');
	echo json_encode($result);

} else {
	header('HTTP 1.0 502 Bad Gateway');
	echo json_encode($client);
}

function check_proper_request() {
	if(!array_key_exists('app_key', $_REQUEST) || ($_REQUEST['app_key'] != APP_KEY)) {
		header('HTTP/1.0 401 Unauthorized');
		echo '{ "error": "Invalid App key" }';
		exit(0);
	}

	if(!array_key_exists('email',$_REQUEST) || !array_key_exists('agent',$_REQUEST)) {
		header('HTTP/1.0 400 Bad Request');
		echo '{ "error": "Both Agent email and Request email required." }';
		exit(0);
	}
	if(array_key_exists('email',$_REQUEST) &&  trim($_REQUEST['email'])==""){
		echo '{"result":"error","message": "Invalid/No requester email."}';
		exit(0);
	}

}

function sso_url() {
	$time = time();
	$sha_hash = sha1(AGENT_EMAIL."".$time."".AUTO_AUTH_KEY);
	return WHMCS_PATH . '/dologin.php?email=' . urlencode(AGENT_EMAIL) . '&timestamp=' . $time . '&hash=' . urlencode($sha_hash);
}

function call_api($fields = array()) {
	$fields['username']  = WHMCS_API_USER;
	$fields['password']  = md5(WHMCS_API_PASSWORD);
	$fields['accesskey'] = WHMCS_API_ACCESS_KEY;
	$fields['responsetype'] = 'json';

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, WHMCS_PATH . '/includes/api.php');
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_TIMEOUT, 1000);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
	//Uncomment the below line for SSL enabled freshdesk accounts
	//curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

	$response = curl_exec($ch);

	
	if (curl_error($ch)) {
		return array('error' => true);
	}
	curl_close($ch);
	$data = json_decode($response);
	
	if ($data->result == 'success') {
		return $data;	
	} else {
		return $data;
		//return array('error' => true);
	}	
}

function getClientDetails() {
	return call_api(array(
		'action' => 'getclientsdetails',
		'email' => REQ_EMAIL,
		'stats' => false
	));
}

function getProducts($client) {
	return call_api(array(
		'action' => 'getclientsproducts',
		'clientid' => $client->id
	));
}

function getDomain($client) {
	return call_api(array(
		'action' => 'getclientsdomains',
		'clientid' => $client->id
	));
}

function getInvoices($client) {
	return call_api(array(
		'action' => 'getinvoices',
		'userid' => $client->userid
	));
}
exit(0);
