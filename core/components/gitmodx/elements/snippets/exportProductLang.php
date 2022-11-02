<?php
//@include(dirname(__FILE__) . '/config.core.php');
//if (!defined('MODX_CORE_PATH')) define('MODX_CORE_PATH', dirname(__FILE__) . '/core/');

$name_export = 'export_product_'.date('Ymd_His');
$output = array();

//Download csv file
header("Pragma: public");
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Cache-Control: private",false);
header("Content-Type: application/octet-stream");
header("Content-Disposition: attachment; filename=".$name_export.".csv;" );

set_time_limit(259200);

$pars_product = array(
    'tpl'=>'tplExport',
    'parents' => $parent,
    'where' => $where,
    'depth' => 4,
    'showLog' => 0,
    'tvPrefix' => '',
    'includeTVs' => 'metaTitle,metaDescription,metaKeywords,h1',
    'limit' => 0,
    'includeContent' => 1,
    'showDeleted' => 0,
    'showUnpublished' => 0);

$output[] = $modx->runSnippet('pdoResources', $pars_product);

//print_r($output);
$header = 'id;key;pagetitle;introtext;content;metaTitle;metaDescription;metaKeywords;h1';
return $header.PHP_EOL.''.implode('', $output);





