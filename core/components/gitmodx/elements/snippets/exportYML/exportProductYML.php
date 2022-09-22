<?php
  @include(dirname(__FILE__) . '/config.core.php');
  if (!defined('MODX_CORE_PATH')) define('MODX_CORE_PATH', dirname(__FILE__) . '/core/');
  
  $name_export = 'export_product';
  $output = array();
  
  $download = $_GET['download'];
  /*if ($download == '') {
    return '';
  }*/
  
  //Download csv file
  header("Pragma: public");
  header("Expires: 0");
  header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
  header("Cache-Control: private",false);
  header("Content-Type: application/octet-stream");
  header("Content-Disposition: attachment; filename=\"$name_export.xml\";" );
  //print $content;
  set_time_limit(259200);
  
  /*if (!empty($download)) {
    $pars_product = array('tpl'=>'tplExportYML', 'includeThumbs' => 'thumbbig', 'parents' => 160, 'depth' => 4, 'showLog' => 0, 'limit' => 0, 'showZeroPrice' => 0, 'includeContent' => 1, 'showDeleted' => 0, 'showUnpublished' => 0);
    $output[] = $modx->runSnippet('msProductsExport', $pars_product);
    return implode('', $output);
  } else {
    return;
  }*/
  
  $pars_product = array('tpl'=>'tplExportYML', 'includeThumbs' => 'thumbbig', 'parents' => 160, 'depth' => 4, 'showLog' => 0, 'limit' => 0, 'showZeroPrice' => 0, 'includeContent' => 1, 'showDeleted' => 0, 'showUnpublished' => 0);
  $output[] = $modx->runSnippet('msProductsExport', $pars_product);
  return implode('', $output);
  
  