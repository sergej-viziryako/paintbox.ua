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

if (isset($_POST['mfa_id']) AND isset($_POST['mod_id'])) {
    $modx->log(modX::LOG_LEVEL_ERROR, 'mfa_id - ' . $_POST['mfa_id']);
    $modx->log(modX::LOG_LEVEL_ERROR, 'mod_id - ' . $_POST['mod_id']);
    $modx->log(modX::LOG_LEVEL_ERROR, 'type_id - ' . $_POST['type_id']);
    $list_page = array();
    $mfa_id = $_POST['mfa_id'];
    $mod_id = $_POST['mod_id'];
    $type_id = $_POST['type_id'];

    if ($type_id != '' AND is_numeric($type_id)) {
        $resources = $modx->getObject('modResource',$type_id);
        $list_page['url'] = $resources->alias;
    } elseif ($mod_id != '' AND is_numeric($mod_id)) {
        $resources = $modx->getObject('modResource',$mod_id);
        $list_page['url'] = $resources->alias;
    } else {
        $list_page['url'] = '';
    }
    echo json_encode($list_page);
}

if (isset($_POST['sup_id'])) {
    $modx->log(modX::LOG_LEVEL_ERROR, 'sup_id - ' . $_POST['sup_id']);
    $modx->log(modX::LOG_LEVEL_ERROR, 'series_id - ' . $_POST['series_id']);
    $modx->log(modX::LOG_LEVEL_ERROR, 'fit_id - ' . $_POST['fit_id']);
    $modx->log(modX::LOG_LEVEL_ERROR, 'autobrush_id - ' . $_POST['autobrush_id']);
    $modx->log(modX::LOG_LEVEL_ERROR, 'location_type_id - ' . $_POST['location_type_id']);
    $list_page = array();
    $main_url = "search-param?";

    $sup_id = $_POST['sup_id'];
    $series_id = $_POST['series_id'];
    $fit_id = $_POST['fit_id'];
    $len_id = $_POST['len_id'];
    $autobrush_id = $_POST['autobrush_id'];
    $location_type_id = $_POST['location_type_id'];

    if ($sup_id != ''){
        $main_url .= 'vendor='.$sup_id;
    }
    if ($series_id != ''){
        $main_url .= '&msoption|series='.$series_id;
    }
    if ($fit_id != ''){
        $main_url .= '&msoption|fastening='.$fit_id;
    }
    if ($len_id != ''){
        $main_url .= '&msoption|length='.$len_id;
    }
    if ($autobrush_id != ''){
        $main_url .= '&msoption|type_autobrush='.$autobrush_id;
    }
    if ($location_type_id != ''){
        $main_url .= '&msoption|location_type='.$location_type_id;
    }
    $list_page['url'] = $main_url;
    echo json_encode($list_page);
}

