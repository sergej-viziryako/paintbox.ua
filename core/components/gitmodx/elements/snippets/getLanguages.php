<?php
$output = array();

// определяем есть ли языки через "папки"
$uri = $_SERVER['REQUEST_URI'];
if (substr($uri, 0, 1)) {
    $uri = mb_substr($uri, 1);
    $tmp = explode('/', $uri);
    if ($path = $tmp[0]) {
        $tmp = $modx->getObject('localizatorLanguage', array('http_host:LIKE' => "%/{$path}/"));
        if ($tmp) {
            $uri = str_replace("{$path}/", "", $uri);
        }
    }
}

$languages = $modx->getIterator('localizatorLanguage');
$active = $modx->localizator_key;

foreach ($languages as $language) {
    if (mb_substr($language->http_host, -1) == '/') {
        $link = $language->http_host . $uri;
    } else {
        $link = $language->http_host . '/' . $uri;
    }
    if ($active == $language->key) {
        $output[] = "<li class=\"active\"><a data-lang=\"{$language->key}\" style=\"cursor: default;\">{$language->name}</a></li>";
    } else {
        $output[] = "<li class='{$language->name}'><a data-lang=\"{$language->key}\" href=\"https://{$link}\">{$language->name}</a></li>";
    };
}
return implode(' ', $output);