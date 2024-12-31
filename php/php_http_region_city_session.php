<?php
  $url = 'ipinfo.thordata.com';
  $proxy = 't.pr.thordata.net';
  $port = 12233;
  $user = 'username';
  $psw = 'password';
  $country = 'us';
  $city = 'houston';
  $sessid = 'a123123'
  $sesstime = 10
  $proxyuser = sprintf("user-%s-region-%s-city-%s-sessid-%s-sesstime-%s",$user,$country,$city,$sessid,$sesstime);


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
