<?php
//@include(dirname(__FILE__) . '/config.core.php');
//if (!defined('MODX_CORE_PATH')) define('MODX_CORE_PATH', dirname(__FILE__) . '/core/');

$culture_key = $modx->getOption('cultureKey');
//$id = $modx->resource->get('id');

if ($id == '') { return ''; } // Вывод если key пустой
if ($content == '') { return ''; } // Вывод если key пустой

if (!$res = $modx->getObject('modResource', array('id' => $id))) {
    return;
}

if (!$localContent = $modx->getObject('localizatorContent', array('resource_id' => $id, 'key' => $culture_key))) {
    return;
}

if ($culture_key != 'ru') {
  if (!empty($localContent)) {
    return $localContent->get($content);
  }
} else {
  return $res->get($content);
}

