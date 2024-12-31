<?php
  $url = 'myip.thordata.net';
  $proxy = 't.pr.thordata.net';
  $port = 12233;
  $user = 'username';
  $psw = 'password';
  $country = 'us';
  $state = 'alabama';
  $proxyuser = sprintf("user-%s-region-%s-st-%s",$user,$country,$state);


  $ch = curl_init($url);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
  
  curl_setopt($ch, CURLOPT_PROXY, "$proxy:$port");
  curl_setopt($ch, CURLOPT_PROXYUSERPWD, "$proxyuser:$psw");
  $result = curl_exec($ch);
  curl_close($ch);
  
  if ($result)
  {
      echo $result . PHP_EOL;
  }
?>