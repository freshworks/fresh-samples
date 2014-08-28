<?php 

	$email="sample@freshdesk.com";
	$password="test";

	$eol = "\r\n";
	$mime_boundary = md5(time());

	$data .= '--' . $mime_boundary . $eol;
	$data .= 'Content-Disposition: form-data; name="helpdesk_ticket[email]"' . $eol . $eol;
	$data .= "sample@freshdesk.com" . $eol;

	$data .= '--' . $mime_boundary . $eol;
	$data .= 'Content-Disposition: form-data; name="helpdesk_ticket[subject]"' . $eol . $eol;
	$data .= "test" . $eol;

	$data .= '--' . $mime_boundary . $eol;
	$data .= 'Content-Disposition: form-data; name="helpdesk_ticket[description]"' . $eol . $eol;
	$data .= "test" . $eol;

	$data .= '--' . $mime_boundary . $eol;
	$data .= 'Content-Disposition: form-data; name="helpdesk_ticket[attachments][][resource]"; filename="error.rtf"' . $eol;
	$data .= 'Content-Type: text/plain' . $eol;
	$data .= 'Content-Transfer-Encoding: base64' . $eol . $eol;
	$data .= chunk_split(base64_encode("@./Users/sathish/Documents/error.rtf")) . $eol;
	
	$data .= '--' . $mime_boundary . $eol;
	$data .= 'Content-Disposition: form-data; name="helpdesk_ticket[attachments][][resource]"; filename="error.rtf"' . $eol;
	$data .= 'Content-Type: text/plain' . $eol;
	$data .= 'Content-Transfer-Encoding: base64' . $eol . $eol;
	$data .= chunk_split(base64_encode("@./Users/sathish/Documents/error.rtf")) . $eol;
	$data .= "--" . $mime_boundary . "--" . $eol . $eol;

	$header[] = "Content-type: multipart/form-data; boundary=" . $mime_boundary;

	$url = 'http://localhost:3000/helpdesk/tickets.json';
	$ch = curl_init ($url);

	curl_setopt($ch, CURLOPT_POST, true);
	curl_setopt($ch, CURLOPT_POSTFIELDS,$data);

	curl_setopt($ch, CURLOPT_USERPWD, "$email:$password");
	curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
	curl_setopt($connection, CURLOPT_HEADER, false);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
	$server_output = curl_exec ($ch);

	$response = json_decode($server_output);
	echo "RESPONSE:<br/>".var_dump($response);

	curl_close ($ch);

?>