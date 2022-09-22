<?php
$eventName = $modx->event->name;
switch($eventName) {
    case 'OnWebPageInit':
        if ($modx->context->get('key') == 'mgr') {return;}
        break;
    case 'OnParseDocument':
        if ($modx->context->get('key') == 'mgr') {return;}
        $lang = $_SESSION['output'];
        $modx->setOption('cultureKey', $lang);
        $modx->setOption('localizator_key', $lang);
        $modx->lexicon->load($lang.':minishop2:default', $lang.':minishop2:cart', $lang.':localizator:site');
        $modx->lexicon->load($lang.':localizator:site');
        //$modx->log(xPDO::LOG_LEVEL_ERROR,'OnParseDocument - ' . $lang);
        $modx->lexicon->load($lang.':office:auth');

        $modx->lexicon->load($lang.':tickets:default');
        $modx->lexicon->load($lang.':tickets:permissions');
        $modx->lexicon->load($lang.':tickets:properties');
        $modx->lexicon->load($lang.':tickets:setting');

        break;
    case 'OnLoadWebDocument':
        if ($modx->context->get('key') == 'mgr') {return;}
        $lang = $modx->getOption('cultureKey');
        //$modx->log(xPDO::LOG_LEVEL_ERROR,'OnLoadWebDocument - ' . $lang);
        $_SESSION['output'] = $lang;
        $modx->setOption('cultureKey', $lang);
        $modx->setOption('localizator_key', $lang);
        $modx->lexicon->load($lang.':localizator:site');
        $modx->lexicon->load($lang.':minishop2:cart');
        $modx->lexicon->load($lang.':office:auth');

        $modx->lexicon->load($lang.':tickets:default');
        $modx->lexicon->load('uk:tickets:default');
        $modx->lexicon->load($lang.':tickets:permissions');
        $modx->lexicon->load($lang.':tickets:properties');
        $modx->lexicon->load($lang.':tickets:setting');

        break;
    case 'msOnBeforeAddToCart':
        if ($modx->context->get('key') == 'mgr') {return;}
        $lang = $_SESSION['output'];
        //$modx->log(xPDO::LOG_LEVEL_ERROR,'msOnBeforeAddToCart - ' . $lang);
        $modx->setOption('cultureKey', $lang);
        $modx->lexicon->load($lang.':minishop2:default', $lang.':minishop2:cart');
        break;
    case 'msOnBeforeRemoveFromCart':
        if ($modx->context->get('key') == 'mgr') {return;}
        $lang = $_SESSION['output'];
        //$modx->log(xPDO::LOG_LEVEL_ERROR,'Lang - ' . $lang);
        $modx->setOption('cultureKey', $lang);
        $modx->lexicon->load($lang.':minishop2:default', $lang.':minishop2:cart');
        break;
    case 'msOnBeforeChangeInCart':
        if ($modx->context->get('key') == 'mgr') {return;}
        $lang = $_SESSION['output'];
        //$modx->log(xPDO::LOG_LEVEL_ERROR,'Lang - ' . $lang);
        $modx->setOption('cultureKey', $lang);
        $modx->lexicon->load($lang.':minishop2:default', $lang.':minishop2:cart');
        break;
    case 'msOnSubmitOrder':
        /*$request = $_SERVER['HTTP_REFERER'];
        $host = $find = $_SERVER['HTTP_HOST'];
        if($request) {
          if(strpos($request, '/') !== false) {
            $request = str_replace($_SERVER['HTTP_ORIGIN'] . '/', '', $request);
            $tmp = explode('/', $request);
            $find = $host . '/' . $tmp[0] . '/';
          } else {
            $find = $host . '/' . $request;
          }
        }
        $q = $modx->newQuery('localizatorLanguage', array(
          array('http_host' => $find),
          array('OR:http_host:=' => $host)
        ));
        $q->select('cultureKey');
        $lang = $modx->getValue($q->prepare());*/

        //$lang = $modx->getOption('cultureKey');

        $lang = $_SESSION['output'];
        //$modx->log(xPDO::LOG_LEVEL_ERROR,'msOnSubmitOrder - ' . $lang);
        $modx->setOption('cultureKey', $lang);
        //$modx->setOption('cultureKey', 'ua');
        $modx->lexicon->load($lang.':minishop2:default', $lang.':minishop2:cart');
        break;
    case 'msOnChangeOrderStatus':
        $address = $modx->getObject('msOrderAddress', $order->get('id'));
        $properties = $address->get('properties');
        if ($properties) {
            $lang = $properties[extfld_lang];
            if ($lang) {
                $modx->lexicon->load($lang.':minishop2:default', $lang.':minishop2:cart', $lang.':localizator:site');
            }
        }
        break;
    case 'OnBeforeUserFormSave':
        if ($modx->context->get('key') == 'mgr') {return;}

        //$modx->log(xPDO::LOG_LEVEL_ERROR,'OnBeforeUserFormSave - ' . $lang);
        $modx->lexicon->load('en:office:auth');



        break;
}
return;