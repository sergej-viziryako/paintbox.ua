<?php
//https://learn.javascript.ru/cookie
session_start();
$default_culture_key = 'ua';
$resource_id = $modx->resource->id;
$culture_key = $modx->getOption('cultureKey');
$ukr_redirect_default = $modx->getOption('ukr_redirect_default');
$site_url = str_replace($modx->getOption('cultureKey').'/', '', $modx->getOption('site_url'));
//$culture_key_form = $_POST['culture_key'];
//print htmlspecialchars($_COOKIE["langkey"]);
//print $_COOKIE["langkey"];
$culture_key_form = htmlspecialchars($_COOKIE["langkey"]);
$url = $modx->makeUrl($resource_id);
if (!empty($culture_key_form)) {
    $_SESSION['langsite'] = $culture_key_form;
}
/*print '$culture_key_form -'.$culture_key_form.PHP_EOL;
print '$culture_key -'.$culture_key.PHP_EOL;
print 'session -'.$_SESSION['langsite'].PHP_EOL;
print '$site_url -'.$site_url.PHP_EOL;
$modx->log(modX::LOG_LEVEL_ERROR, '$culture_key_form - '.$culture_key_form);
$modx->log(modX::LOG_LEVEL_ERROR, '$culture_key - '.$culture_key);
$modx->log(modX::LOG_LEVEL_ERROR, '$_SESSION - '.$_SESSION['langsite']);*/

if( isBot() == 1 AND $ukr_redirect_default == 1) {
    if (empty($_SESSION['langsite'])) {
        $_SESSION['langsite'] = $default_culture_key;
        if ($resource_id == 1) {
            return $modx->sendRedirect('/ua' . $url);
        } else {
            return $modx->sendRedirect('/ua/' . $url);
        }
    } elseif ($_SESSION['langsite'] === 'ru' and $culture_key !== 'ru') {
        if ($resource_id == 1) {
            return $modx->sendRedirect($site_url);
        } else {
            return $modx->sendRedirect($site_url.''. $url);
        }
    } elseif ($_SESSION['langsite'] === 'ua' and $culture_key !== 'ua') {
        $culture_key_lang = $_SESSION['langsite'];
        if ($resource_id == 1) {
            return $modx->sendRedirect($site_url.''.$culture_key_lang.'/');
        } else {
            return $modx->sendRedirect('/'.$culture_key_lang.'/' . $url);
        }
    }
}

function isBot(){
    $bots = array('Googlebot','Chrome-Lighthouse','Google','YaDirectBot','Lighthouse');
    foreach($bots as $bot) {
        if (strpos($_SERVER['HTTP_USER_AGENT'], $bot) !== false) {
            return false;
        }
    }
    return true;
}