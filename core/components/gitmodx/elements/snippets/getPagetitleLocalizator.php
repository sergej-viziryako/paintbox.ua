<?php
//@include(dirname(__FILE__) . '/config.core.php');
//if (!defined('MODX_CORE_PATH')) define('MODX_CORE_PATH', dirname(__FILE__) . '/core/');

$culture_key = $modx->getOption('cultureKey');
//$id = $modx->resource->get('id');

if ($id == '') { return ''; } // Вывод если key пустой
if ($content == '') { return ''; } // Вывод если key пустой

if ($culture_key != 'ua') {
  if ($localContent = $modx->getObject('localizatorContent', array('resource_id' => $id, 'key' => $culture_key))){
    return $localContent->get($content);
  }

} else {
  if ($res = $modx->getObject('modResource', array('id' => $id))){
    return $res->get($content);
  }
}
