<?php
if ($modx->event->name == "OnLoadWebDocument") {
  if ($modx->context->get('key') == 'mgr') {
    return;
  }
  session_start();
  $default_culture_key = '/ua/';
  //$culture_key = $modx->getOption('cultureKey');
  $ukr_redirect_default = $modx->getOption('ukr_redirect_default');
  $localizator_key = $modx->localizator_key;
  $q_var = $modx->getOption('request_param_alias', null, 'q');
  $request = &$_REQUEST[$q_var];

  if (preg_match('/^(' . $localizator_key . ')\//i', $request)) {
    $request = preg_replace('/^' . $localizator_key . '\//', '', $request);
  }

  if (!empty(htmlspecialchars($_COOKIE["langkey"]))) {
    $_SESSION['langkey'] = htmlspecialchars($_COOKIE["langkey"]);
  }

  if (isBot() == 1 and $ukr_redirect_default == 1) {
    if (empty($_SESSION['langkey'])) {
      $_SESSION['langkey'] = $default_culture_key;
      if ($modx->resource->id == 1) {
        return $modx->sendRedirect($default_culture_key);
      } else {
        return $modx->sendRedirect($default_culture_key . $request);
      }
    } elseif ($_SESSION['langkey'] == 'ru' and $localizator_key !== 'ru') {
      if ($modx->resource->id == 1) {
        return $modx->sendRedirect(MODX_SITE_URL);
      } else {
        return $modx->sendRedirect(MODX_SITE_URL . '' . $request);
      }
    } elseif ($_SESSION['langkey'] == 'ua' and $localizator_key !== 'ua') {
      $culture_key_lang = $_SESSION['langkey'];
      if ($modx->resource->id == 1) {
        return $modx->sendRedirect(MODX_SITE_URL . '' . $culture_key_lang . '/');
      } else {
        return $modx->sendRedirect(MODX_SITE_URL . '' . $culture_key_lang . '/' . $request);
      }
    }
  }

}

function isBot()
{
  $bots = array('Googlebot', 'Chrome-Lighthouse', 'Google', 'YaDirectBot', 'Lighthouse', 'Screaming Frog SEO');
  foreach ($bots as $bot) {
    if (strpos($_SERVER['HTTP_USER_AGENT'], $bot) !== false) {
      return false;
    }
  }
  return true;
}