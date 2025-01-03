<?php
  $url = 'ipinfo.thordata.com';
  $proxy = 't.pr.thordata.net';
  $port = 12233;
  
  $ch = curl_init($url);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
  
  curl_setopt($ch, CURLOPT_PROXY, "$proxy:$port");
  $result = curl_exec($ch);
  curl_close($ch);
  
  if ($result)
  {
      echo $result . PHP_EOL;
  }
?>
