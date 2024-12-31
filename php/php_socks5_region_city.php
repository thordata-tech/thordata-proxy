<?php
  $url = 'myip.thordata.net';
  $proxy = 't.pr.thordata.net';
  $port = 12233;
  $user = 'username';
  $psw = 'password';
  $country = 'us';
  $city = 'houston';
  $proxyuser = sprintf("user-%s-region-%s-city-%s",$user,$country,$city);

  $ch = curl_init($url);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

  curl_setopt($ch, CURLOPT_PROXYTYPE, CURLPROXY_SOCKS5);
  curl_setopt($ch, CURLOPT_PROXY, "$proxy:$port");
  curl_setopt($ch, CURLOPT_PROXYUSERPWD, "$proxyuser:$psw");
  $result = curl_exec($ch);
  curl_close($ch);

  if ($result)
  {
      echo $result . PHP_EOL;
  }
?>
