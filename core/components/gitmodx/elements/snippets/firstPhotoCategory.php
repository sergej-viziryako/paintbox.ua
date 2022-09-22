<?php
//@include(dirname(__FILE__) . '/config.core.php');
//if (!defined('MODX_CORE_PATH')) define('MODX_CORE_PATH', dirname(__FILE__) . '/core/');

if ($parent_id == '') {
  return '';
}

$depth = 5;
$childs = $modx->getChildIds($parent_id,$depth,array('context' => 'web'));
$sortby = 'price';
$c = $modx->newQuery('msProductData');
$c->where(array('thumb:!=' =>''));
$c->where(array('id:IN'=>$childs));
$c->limit(1);
$c->sortby($sortby);
$collection = $modx->getCollection('msProductData',$c);
foreach ($collection as $o){
  $output .= $o->get('thumb');
}
return $output;
