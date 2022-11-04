<?php
if ($resource_id == '') {
    return;
}
$culture_key = 'ru';
if ($localContent = $modx->getObject('localizatorContent', array('resource_id' => $resource_id, 'key' => $culture_key)))
{
    return $localContent->get('pagetitle');
}