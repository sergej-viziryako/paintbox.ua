<?php
//$objects = $modx->getCollection('msOption', ['deleted'   => 0,'published' => 1,'hidemenu'  => 0,'parent'    => $modx->resource->get('id')]);
$objects = $modx->getCollection('msOption');
$items = [];
foreach ($objects as $object) {
  $items[] = $object->get('caption') . '==' . $object->get('key');
}

return 'Цвет==color||Размер==size||Страна производитель==made_in||'.implode('||', $items);