<?php
// выводит товары заказа.
$tpl = $modx->getOption('tpl',$scriptProperties,'tplOrderRow'); // если товар найден
$tpl_empty = $modx->getOption('tpl',$scriptProperties,'tplOrderRowEmpty'); // если товар не найден

// ищем товар по id заказа
$q = $modx->prepare("SELECT * FROM ".$modx->getOption('table_prefix')."ms2_order_products WHERE order_id=".$order);
$q->execute();
$results = $q->fetchAll(PDO::FETCH_ASSOC);
// перебором либо выводим нужный заказ, либо оповещаем что его уже нет

foreach ($results as $result) {
  $res = $modx->getObject('modResource', array('pagetitle'=>$result[name]));

  if ($res) {
    $resArray = $res->toArray();
    $modx->setPlaceholder('costOrder', $result[count]);
    $modx->setPlaceholder('costAll', $result[count] * $result[price]);
    $output .= $modx->getChunk($tpl,$resArray);
  } else {
    $prodName = $modx->setPlaceholder('name', $result[name]);
    $output .= $modx->getChunk($tpl_empty);
  }
}
return $output;