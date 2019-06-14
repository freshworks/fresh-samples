<?php 
$api_key = "API_KEY";
$password = "x";
$yourdomain = "YOUR_DOMAIN";
$url = "https://$yourdomain.freshdesk.com/api/v2/tickets/outbound_email";

# Attachment details:
class FileDetail {
  public $path;
  public $name;
  public $contentType;
  
  function __construct($path, $name, $contentType) {
    $this->path = $path;
    $this->name = $name;
    $this->contentType = $contentType;
  }
}

// List of attachments with path, file name and content-type
$file1 = new FileDetail("data/x.png", "x.png", "image/png");
$file2 = new FileDetail("data/y.txt", "y.txt", "text/plain");

$cc_email1 = '1@gmail.com';
$cc_email2 = '2@gmail.com';

## Code starts:
$eol = "\r\n";
$mime_boundary = md5(time());
$data .= '--' . $mime_boundary . $eol;
$data .= 'Content-Disposition: form-data; name="email"' . $eol . $eol;
$data .= "sample@example.com" . $eol;
$data .= '--' . $mime_boundary . $eol;
$data .= 'Content-Disposition: form-data; name="subject"' . $eol . $eol;
$data .= "Testing outbound email" . $eol;
$data .= '--' . $mime_boundary . $eol;
$data .= 'Content-Disposition: form-data; name="priority"' . $eol . $eol;
$data .= "2" . $eol;
$data .= '--' . $mime_boundary . $eol;
// status should be a number
$data .= 'Content-Disposition: form-data; name="status"' . $eol . $eol;
$data .= "2" . $eol;
$data .= '--' . $mime_boundary . $eol;
$data .= 'Content-Disposition: form-data; name="description"' . $eol . $eol;
$data .= "test" . $eol;
// email_config_id is a mandatory field and it's value can be found using the api listed in https://developers.freshdesk.com/api/#email-configs
$data .= '--' . $mime_boundary . $eol;
$data .= 'Content-Disposition: form-data; name="email_config_id"' . $eol . $eol;
$data .= "1" . $eol;
$data .= '--' . $mime_boundary . $eol;

// For custom dropdown field named 'cf_test_service_worker' and having a choice 'First Choice'
$data .= 'Content-Disposition: form-data; name="custom_fields[cf_test_service_worker]"' . $eol . $eol;
$data .= "First Choice" . $eol;
$data .= '--' . $mime_boundary . $eol;

// list of cc_emails goes here. You can also add a loop here in case of multiple css_emails
$data .= 'Content-Disposition: form-data; name="cc_emails[]"' . $eol . $eol;
$data .= $cc_email1 . $eol;
$data .= '--' . $mime_boundary . $eol;
$data .= 'Content-Disposition: form-data; name="cc_emails[]"' . $eol . $eol;
$data .= $cc_email2 . $eol;
$data .= '--' . $mime_boundary . $eol;

// list of attachments goes here. You can also add a loop here in case of multiple css_emails
$data .= 'Content-Disposition: form-data; name="attachments[]"; filename="' . $file1->name . '"' . $eol;
$data .= "Content-Type: $file1->contentType" . $eol . $eol;
$data .= file_get_contents($file1->path) . $eol;
$data .= '--' . $mime_boundary . $eol;
$data .= 'Content-Disposition: form-data; name="attachments[]"; filename="' . $file2->name . '"' . $eol;
$data .= "Content-Type: $file2->contentType" . $eol . $eol;
$data .= file_get_contents($file2->path) . $eol;
$data .= "--" . $mime_boundary . "--" . $eol . $eol;

$header[] = "Content-type: multipart/form-data; boundary=" . $mime_boundary;
$ch = curl_init($url);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
curl_setopt($ch, CURLOPT_USERPWD, "$api_key:$password");
curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
curl_setopt($ch, CURLOPT_HEADER, true);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$server_output = curl_exec($ch);
$info = curl_getinfo($ch);
$header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
$headers = substr($server_output, 0, $header_size);
$response = substr($server_output, $header_size);
if($info['http_code'] == 201) {
  echo "Ticket created successfully, the response is given below \n";
  echo "Response Headers are \n";
  echo $headers."\n";
  echo "Response Body \n";
  echo "$response \n";
} else {
  if($info['http_code'] == 404) {
    echo "Error, Please check the end point \n";
  } else {
    echo "Error, HTTP Status Code : " . $info['http_code'] . "\n";
    echo "Headers are ".$headers;
    echo "Response are ".$response;
  }
}
curl_close($ch);
?>