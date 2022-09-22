<?php
if ($modx->event->name == "OnLoadWebDocument") {
    if ($modx->context->get('key') == 'mgr') {
        return;
    }

    if (strpos($_SERVER['HTTP_USER_AGENT'],'Chrome-Lighthouse') !== false) {
        $modx->setPlaceholders(array('check_user' => 1,),'');
    } else {
        $modx->setPlaceholders(array('check_user' => 0,),'');
    }
}
