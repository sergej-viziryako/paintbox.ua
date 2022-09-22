<?php
$tags = $modx->getOption('tags', $scriptProperties);
$get = $modx->getOption('get', $scriptProperties, '0');
$base = $modx->config['base_url'];

$content_type = $modx->getObject('modContentType', array('mime_type' => 'text/html'));
if(substr_count($_SERVER["REQUEST_URI"], $content_type->get('file_extensions'))) {
  $url = $modx->makeUrl($modx->resource->parent);
}else{
  $url = $modx->resource->uri;
}

if(!$get){
  if(!$tags) {return '';}
  $tags = explode(',',$tags);
  foreach($tags as $value) {
    $output[] = "<a href='{$base}{$url}?tag={$value}'>{$value}</a>";
  }

  return implode(' ',$output);
}else{
  return (!empty($_GET['tag']))? "tags==%{$_GET['tag']}%" : '';
}