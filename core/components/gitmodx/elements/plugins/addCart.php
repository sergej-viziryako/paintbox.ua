<?php
if ($modx->event->name = 'msOnBeforeAddToCart') {

  /*if ($miniShop2 = $modx->getService('miniShop2')) {
    $miniShop2->initialize($modx->context->key);
    $miniShop2->cart->clean();
  };*/

  $price_sale = $modx->getOption('price_sale', $_REQUEST);
  if (!empty($price_sale)) {
    $product->set('price', $price_sale);
  }
}