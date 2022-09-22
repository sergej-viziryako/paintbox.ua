<?php
@include(dirname(__FILE__) . '/config.core.php');
if (!defined('MODX_CORE_PATH')) define('MODX_CORE_PATH', dirname(__FILE__) . '/core/');

$name_export = 'export_product_epicentr';
$output = array();

$download = $_GET['download'];
/*if ($download == '') {
  return '';
}*/

//Download csv file
/*header("Pragma: public");
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Cache-Control: private",false);
header("Content-Type: application/octet-stream");
header("Content-Disposition: attachment; filename=\"$name_export.xml\";" );*/

//print $content;
set_time_limit(259200);

$fp = fopen('xml/' . $name_export.'.xml', 'w');

$category_id_epicentr = $modx->getOption('category_id_epicentr');

if ($category_id_epicentr == "") {
  $category_id_epicentr = 999999;
}

$pars_product_category = array('tpl'=>'tplExportEpicentrYML', 'parents' => $category_id_epicentr, 'depth' => 4, 'showLog' => 0, 'limit' => 0, 'showZeroPrice' => 0, 'includeContent' => 1, 'showDeleted' => 0, 'showUnpublished' => 0);
$output_offer_category = $modx->runSnippet('msProductsExport', $pars_product_category);

$file_product = '<?xml version="1.0" encoding="UTF-8"?>
<yml_catalog date="'.date("d.m.Y").'">
<offers>'.$output_offer_category.'</offers>
</yml_catalog>';

fwrite($fp, $file_product);
fclose($fp);

print $file_product;

//return implode('', $output);

