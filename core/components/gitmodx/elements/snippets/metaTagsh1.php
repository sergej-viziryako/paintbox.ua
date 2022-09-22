<?php
$culture_key = $modx->getOption('cultureKey');
$id = $modx->resource->get('id');
$res = $modx->getObject('modResource', array('id' => $id));
if ($culture_key == 'ru') {
  return !empty($res->getTVValue('h1')) ? $res->getTVValue('h1') : $modx->resource->get('pagetitle');
}

elseif ($culture_key == 'ua') {
  return !empty($res->getTVValue('h1Ua')) ? $res->getTVValue('h1Ua') : $modx->resource->get('pagetitle');
}