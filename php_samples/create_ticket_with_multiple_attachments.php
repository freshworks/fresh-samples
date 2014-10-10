<?php 

## Configuration:

$API_KEY = "YOUR_API_KEY";
$FD_ENDPOINT = "http://YOUR_DOMAIN.freshdesk.com"; // verify if you are using https, and change accordingly!

# Requestor details:
$email = "sample@example.com";
$password = "test";

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

$file1 = new FileDetail("data/x.png", "x.png", "image/png");
$file2 = new FileDetail("data/y.txt", "y.txt", "text/plain");

## Code starts:

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
$data .= 'Content-Disposition: form-data; name="helpdesk_ticket[attachments][][resource]"; filename="' . $file1->name . '"' . $eol;
$data .= "Content-Type: $file1->contentType" . $eol . $eol;
$data .= file_get_contents($file1->path) . $eol;

$data .= '--' . $mime_boundary . $eol;
$data .= 'Content-Disposition: form-data; name="helpdesk_ticket[attachments][][resource]"; filename="' . $file2->name . '"' . $eol;
$data .= "Content-Type: $file2->contentType" . $eol . $eol;
$data .= file_get_contents($file2->path) . $eol;
$data .= "--" . $mime_boundary . "--" . $eol . $eol;

$header[] = "Content-type: multipart/form-data; boundary=" . $mime_boundary;

$url = "$FD_ENDPOINT/helpdesk/tickets.json";
$ch = curl_init ($url);

curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS,$data);

curl_setopt($ch, CURLOPT_USERPWD, "$API_KEY:X");
curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
curl_setopt($ch, CURLOPT_HEADER, false);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
$server_output = curl_exec ($ch);

$response = json_decode($server_output);
var_dump($response);

curl_close ($ch);
echo "\n";

?>