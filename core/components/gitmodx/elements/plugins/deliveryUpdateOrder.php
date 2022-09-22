<?php
//https://github.com/Ibochkarev/miniShop2/issues/109
//https://modx.pro/howto/15248
switch ($modx->event->name) {
  case 'msOnManagerCustomCssJs':
    if ($page != 'orders') return;
    $modx->controller->addLastJavascript(MODX_ASSETS_URL.'components/customField/default.js');
    break;
  case 'msOnBeforeUpdateOrder': //событие
    $old = $modx->getObject('msOrder', $id); //старый заказ
    $oldDeliveryCost = $old->get('delivery_cost'); //старая цена доставки

    $newDeliveryCost = $object->get('delivery_cost'); //новая цена доставки

    if ($oldDeliveryCost != $newDeliveryCost) { //если были изменения - меняем cost
      $tmp1 = $newDeliveryCost;
      $tmp2 = $object->get('cart_cost');
      $object->set('cost', $tmp1+$tmp2);
    }
    break;
}