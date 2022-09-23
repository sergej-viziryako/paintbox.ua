<?php
//https://github.com/TrywaR/msFavoriter
//https://bezumkin.ru/sections/tips_and_tricks/2918/

require_once dirname(dirname(dirname(dirname(__FILE__)))) . '/config.core.php';
require_once MODX_CORE_PATH.'model/modx/modx.class.php';
$modx = new modX();
$modx->initialize('web');
$modx->getService('error','error.modError', '', '');

/*if ($res = $modx->getObject('modResource', 1)) {
  print_r($res->toArray());
}*/

if (isset($_POST['id'])) {
    $modx->log(modX::LOG_LEVEL_ERROR, 'id - ' . $_POST['id']);
    $parent  = $_POST['id'];
    $list_page = array();
    $pdo = $modx->getService('pdoTools');
    $q = $modx->prepare("SELECT `id`, `uri`, `pagetitle`, `content` FROM modx_site_content WHERE parent = {$parent} ORDER BY id ASC ");
    $q->execute();
    while($row = $q->fetch(PDO::FETCH_ASSOC)) {
        $list_page[$row['id']] = $row['pagetitle'];
    }
    //print '<pre>'; print_r($pdo->getTime()); print '</pre>';
    echo json_encode($list_page);
}

if (isset($_POST['mod_id'])) {
    $modx->log(modX::LOG_LEVEL_ERROR, 'mod_id - ' . $_POST['mod_id']);
    $parent  = $_POST['mod_id'];
    $list_page = array();
    $pdo = $modx->getService('pdoTools');
    $q = $modx->prepare("SELECT `id`, `uri`, `pagetitle`, `content` FROM modx_site_content WHERE parent = {$parent} ORDER BY id ASC ");
    $q->execute();
    while($row = $q->fetch(PDO::FETCH_ASSOC)) {
        $list_page[$row['id']] = $row['pagetitle'];
    }
    //print '<pre>'; print_r($pdo->getTime()); print '</pre>';
    echo json_encode($list_page);
}

if (isset($_POST['sup_id'])) {
    $vendor  = $_POST['sup_id'];
    $modx->log(modX::LOG_LEVEL_ERROR, 'sup_id - ' . $_POST['sup_id']);
    $list_page = array();
    $pdo = $modx->getService('pdoTools');
    $q = $modx->prepare("SELECT modx_ms2_products.id,modx_ms2_products.vendor, p_option.product_id, p_option.key, p_option.value FROM modx_ms2_products LEFT JOIN modx_ms2_product_options p_option ON p_option.product_id = modx_ms2_products.id WHERE p_option.key = 'series' AND modx_ms2_products.vendor = {$vendor} GROUP BY p_option.value");
    $q->execute();
    while($row = $q->fetch(PDO::FETCH_ASSOC)) {
        if ($row['value']) {
            $list_page[$row['id']] = $row['value'];
        }
    }
    echo json_encode($list_page);
}

