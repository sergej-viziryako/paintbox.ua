<?php
if ($modx->event->name == "OnPageNotFound") {
    if ($modx->context->get('key') == 'mgr') {
        return;
    }

    if ($_GET['q'] == 'msfavoriter') {
        return;
    }

    if(stripos($_REQUEST['q'],'sitemap_') !== FALSE){
        return;
    }

    $url = $modx->makeUrl(9);
    //$modx->sendRedirect($url);
    $modx->sendRedirect($url,array('responseCode' => 'HTTP/1.1 301 Moved Permanently'));
}