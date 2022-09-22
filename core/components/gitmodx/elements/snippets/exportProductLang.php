<?php

/*$_modx->runSnippet('!exportProductLang',['parent' => '2,160,164', 'where' => '{"template:IN":[1,35,37,21,39,24,6,29,20,33,30,25,38,34,32]}'])*/

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

/*
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
*/

$sql_key = "SELECT sc.id, sc.pagetitle as title, sc.parent, sc.content, lc.resource_id, lc.key, lc.pagetitle FROM modx_site_content sc LEFT JOIN modx_localizator_content lc ON sc.id = lc.resource_id WHERE lc.pagetitle IS NULL AND sc.parent NOT IN (29296) AND sc.id NOT IN (29302,66,29296)";
$q_key = $modx->prepare($sql_key);
$q_key->execute();
$localizator_content = $q_key->fetchAll(PDO::FETCH_ASSOC);

$count = 0;
foreach ($localizator_content as $content) {
    $localizator_str .= '"'.$content['id'].'";"ru";"'.$content['title'].'";"'.$content['introtext'].'";"'.$content['content'].'";'.PHP_EOL;
    $count++;
}

$header = 'id;key;pagetitle;introtext;content;metaTitle;metaDescription;metaKeywords;h1';
return  $header.PHP_EOL.$localizator_str;
