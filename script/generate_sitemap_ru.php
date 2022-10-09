<?php
define('MODX_API_MODE', true);
require dirname(dirname(__FILE__)).'/index.php';

$name_export = 'sitemap-ru';

//Download csv file
/*header("Pragma: public");
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Cache-Control: private",false);
header("Content-Type: application/octet-stream");
header("Content-Disposition: attachment; filename=\"$name_export.xml\";" );*/

set_time_limit(259200);
$fp = fopen(dirname(dirname(__FILE__)).'/xml/' . $name_export . '.xml', 'w');

/*if ($res = $modx->getObject('modResource', 1)) {
  print_r($res->toArray());
}*/

$pars_product = array(
    'tpl' => 'tplSitemapXml',
    'parents' => '2,160,29312',
    'depth' => 4,
    'limit' => 0,
    'showDeleted' => 0,
    'showUnpublished' => 0,
    'leftJoin' => '{"localizator" : {"class" : "localizatorContent","alias" : "localizator","on" : "localizator.resource_id = modResource.id"}}',
    'select' => '{"localizator" : "modResource.*, localizator.*, modResource.id"}',
    'where' => '{"localizator.key" : "ru","template:NOT IN":[45]}',
    'lang' => 'ru/'
);

$output_offer = $modx->runSnippet('pdoResources', $pars_product);
$file_product = '<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
'.$output_offer.'
</urlset>';
fwrite($fp, $file_product);
fclose($fp);