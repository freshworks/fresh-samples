<?php 

$api_key = "API_KEY";
$password = "x";
$yourdomain = "YOUR_DOMAIN";

$url = "https://$yourdomain.freshdesk.com/api/v2/tickets";

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
$data .= 'Content-Disposition: form-data; name="email"' . $eol . $eol;
$data .= "sample@example.com" . $eol;

$data .= '--' . $mime_boundary . $eol;
$data .= 'Content-Disposition: form-data; name="subject"' . $eol . $eol;
$data .= "Sample Subject" . $eol;

$data .= '--' . $mime_boundary . $eol;
$data .= 'Content-Disposition: form-data; name="priority"' . $eol . $eol;
$data .= "2" . $eol;


$data .= '--' . $mime_boundary . $eol;
$data .= 'Content-Disposition: form-data; name="status"' . $eol . $eol;
$data .= "a" . $eol;


$data .= '--' . $mime_boundary . $eol;
$data .= 'Content-Disposition: form-data; name="description"' . $eol . $eol;
$data .= "test" . $eol;

$data .= '--' . $mime_boundary . $eol;
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