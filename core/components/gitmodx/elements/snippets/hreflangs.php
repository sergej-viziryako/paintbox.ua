<?php
$output = "";
$default = "ru"; // Указываем язык по умолчанию
$id = $modx->resource->get('id');
$start = $modx->getOption('site_start');
$protocol = $modx->getOption('server_protocol').'://';

$resources = $modx->runSnippet('pdoResources', [
  'loadModels' => 'localizator',
  'class' => 'localizatorLanguage',
  'sortby' => 'id',
  'limit' => '0',
  'sortdir' => 'asc',
  'where' => ['active' => 1],
  'return' => 'json',
]);

if($resources) {
  $resources = json_decode($resources);
  foreach($resources as $resource) {

    $key = $resource->key;
    $key_hreflang = $resource->description;
    if($id != $start) {
      $url = $resource->http_host.$modx->makeUrl($id);
    } else {
      $url = $resource->http_host;
    }
    if($key == $default) {
      //$output .= "<link rel='alternate' hreflang='x-default' href='{$protocol}{$resource->http_host}' />";
    }
    $output .= "<link rel='alternate' hreflang='{$key_hreflang}' href='{$protocol}{$url}'>";
  }
}

return $output;