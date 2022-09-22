<?php
@include(dirname(__FILE__) . '/config.core.php');
if (!defined('MODX_CORE_PATH')) define('MODX_CORE_PATH', dirname(__FILE__) . '/core/');

if (!class_exists('ProductIndex')) {
  require_once MODX_CORE_PATH . '/components/msearch2/custom/index/productindex.class.php';
}
$page_id = $resource->get('id');
$productinndex = new ProductIndex($page_id);
//print $productinndex->id_product;
