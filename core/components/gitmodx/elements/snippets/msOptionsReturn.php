<?php

//@include(dirname(__FILE__) . '/config.core.php');
//if (!defined('MODX_CORE_PATH')) define('MODX_CORE_PATH', dirname(__FILE__) . '/core/');

$sql = "SELECT * FROM modx_ms2_options";
$q = $modx->prepare($sql);
$q->execute();
$res = $q->fetchAll(PDO::FETCH_ASSOC);

foreach ($res as $v) {
    if ($v['key'] != 'artikul') {
        $_options[] = '"option.' . $v['key'] . '"';
    }
}

//return '{"default":["price","article","vendor.name","color","size",'.implode(',',$_options).']}';
return '{"default":["price","article","vendor.name",'.implode(',',$_options).']}';