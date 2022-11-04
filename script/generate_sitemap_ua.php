<?php
define('MODX_API_MODE', true);
require dirname(dirname(__FILE__)).'/api.php';
//$_SERVER['DOCUMENT_ROOT']

$name_export = 'sitemap-ua';

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
    'where' => '{"template:NOT IN":[45]}',
    'lang' => ''
);

$output_offer = $modx->runSnippet('pdoResources', $pars_product);

$file_product = '<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
'.$output_offer.'
</urlset>';
fwrite($fp, $file_product);
fclose($fp);
return 'The End';