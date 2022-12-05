<?php
/*
 * This file is part of MODX Revolution.
 *
 * Copyright (c) MODX, LLC. All Rights Reserved.
 *
 * For complete copyright and license information, see the COPYRIGHT and LICENSE
 * files found in the top-level directory of this distribution.
 */

$tstart= microtime(true);

/*if ($_SERVER['REQUEST_URI'] != strtolower($_SERVER['REQUEST_URI'])) {
  header("HTTP/1.1 301 Moved Permanently");
  header('Location: //' . $_SERVER['HTTP_HOST'] . strtolower($_SERVER['REQUEST_URI']));
}*/

$uri_indication['remarketing'] = '?gclid';
$request_url_reamrketing = strpos($_SERVER['REQUEST_URI'], $uri_indication['remarketing']);
//print $_SERVER['REQUEST_URI'];
if ($request_url_reamrketing != '') {
  $request_uri_page = substr(strtolower($_SERVER['REQUEST_URI']), 0, $request_url_reamrketing);
  //print $_SERVER['REQUEST_URI'].'---'.strtolower($_SERVER['REQUEST_URI']);
  if ($request_uri_page != strtolower($_SERVER['REQUEST_URI'])) {
    print $request_url_reamrketing;
    header("HTTP/1.1 301 Moved Permanently");
    header('Location: //' . $_SERVER['HTTP_HOST'] . $request_uri_page);
  }
}

//Redirect slesh to no slesh
$uri = preg_replace("/\?.*/i",'', $_SERVER['REQUEST_URI']);
if (strlen($uri)>4) {
  //print $uri.'<br>';
  if (rtrim($uri,'/')."/" == $uri) {
    print 'https://'.$_SERVER['SERVER_NAME'].str_replace($uri, substr($uri,0,-1), $_SERVER['REQUEST_URI']);
    header("HTTP/1.1 301 Moved Permanently");
    header('Location: http://'.$_SERVER['SERVER_NAME'].str_replace($uri, substr($uri,0,-1), $_SERVER['REQUEST_URI']));
    exit();
  }
}
//Redirect page
if (is_readable($_SERVER['DOCUMENT_ROOT']."/r301.csv")) {
  $handle = fopen($_SERVER['DOCUMENT_ROOT']."/r301.csv", "r");
  while (!feof($handle)) {
    $buffer = fgets($handle, 9999);
    $data = explode(";", $buffer);

    if (strtolower($data[0]) == $_SERVER['REQUEST_URI']) {
      header("HTTP/1.1 301 Moved Permanently");
      header("Location: //".$_SERVER['HTTP_HOST'].'/'.trim($data[1]));
      exit();
    }

  }
  fclose($handle);
}


/*if(empty($_SERVER['HTTPS']) || $_SERVER['HTTPS'] == "off"){
  $redirect = 'https://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
  header('HTTP/1.1 301 Moved Permanently');
  header('Location: ' . $redirect);
  exit();
}*/


/* define this as true in another entry file, then include this file to simply access the API
 * without executing the MODX request handler */
if (!defined('MODX_API_MODE')) {
  define('MODX_API_MODE', false);
}

/* include custom core config and define core path */
@include(dirname(__FILE__) . '/config.core.php');
if (!defined('MODX_CORE_PATH')) define('MODX_CORE_PATH', dirname(__FILE__) . '/core/');

/* include the modX class */
if (!@include_once (MODX_CORE_PATH . "components/gitmodx/model/gitmodx/gitmodx.class.php")) {
  $errorMessage = 'Site temporarily unavailable';
  @include(MODX_CORE_PATH . 'error/unavailable.include.php');
  header($_SERVER['SERVER_PROTOCOL'] . ' 503 Service Unavailable');
  echo "<html><title>Error 503: Site temporarily unavailable</title><body><h1>Error 503</h1><p>{$errorMessage}</p></body></html>";
  exit();
}

/* start output buffering */
ob_start();

/* Create an instance of the modX class */
$modx= new gitModx();
if (!is_object($modx) || !($modx instanceof modX)) {
  ob_get_level() && @ob_end_flush();
  $errorMessage = '<a href="setup/">MODX not installed. Install now?</a>';
  @include(MODX_CORE_PATH . 'error/unavailable.include.php');
  header($_SERVER['SERVER_PROTOCOL'] . ' 503 Service Unavailable');
  echo "<html><title>Error 503: Site temporarily unavailable</title><body><h1>Error 503</h1><p>{$errorMessage}</p></body></html>";
  exit();
}

/* Set the actual start time */
$modx->startTime= $tstart;

/* Initialize the default 'web' context */
$modx->initialize('web');

/* execute the request handler */
if (!MODX_API_MODE) {
  $modx->handleRequest();
}
