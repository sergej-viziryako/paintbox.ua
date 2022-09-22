<?php
//@include(dirname(__FILE__) . '/config.core.php');
//if (!defined('MODX_CORE_PATH')) define('MODX_CORE_PATH', dirname(__FILE__) . '/core/');

if ($resource_id == '') {
  return '';
}

//$resource_id = 105;
$output = array();

$sql_ms2_resource_files = "SELECT * FROM  modx_ms2_resource_files WHERE rank = 0 AND resource_id = ".$resource_id;
$q_ms2_resource_files = $modx->prepare($sql_ms2_resource_files);
$q_ms2_resource_files->execute();
$q_ms2_resource_files_all = $q_ms2_resource_files->fetchAll(PDO::FETCH_ASSOC);

foreach ($q_ms2_resource_files_all as $val) {
  //$output[] = $_SERVER['HTTP_HOST'].'/assets/images/resources/'.$resource_id.'/'.$val['file'];
  $output[] = '/assets/images/resources/'.$resource_id.'/'.$val['file'];
}

return $output['0'];