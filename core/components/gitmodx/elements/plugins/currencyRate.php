<?php
switch ($modx->event->name) {
  case 'OnDocFormSave':


    if (!$product = $modx->getObject('msProduct', $resource->get('id'))) {
      return '';
    }
    /** @var currencyrate $currencyrate */
    if (!$currencyrate = $modx->getService('currencyrate', 'currencyrate', $modx->getOption('currencyrate_core_path', null, $modx->getOption('core_path') . 'components/currencyrate/') . 'model/currencyrate/', array())) {
      return 'Could not load currencyrate class!';
    }
    $valutes = array(
      'price_eur' => 'EUR',
      'price_usd' => 'USD'
    );
    foreach ($valutes as $field => $valute) {
      if (!$valute = $modx->getObject('CRlist', array('charcode' => $valute, 'active' => 1))) {
        continue;
      }

      $valuerate = $valute->get('valuerate');
      $currency_value = $valute->get('value');
      $currency_rate = $valute->get('rate');

      if (empty($valuerate)) {
        continue;
      }
      $valutePrice = $product->get($field);
      if (empty($valutePrice) OR ( $valutePrice == '0.00')) {
        continue;
      }

      
      $price = Ceil($valutePrice * $valuerate);


      //$price = Ceil( ($valutePrice * $currency_value)+(($valutePrice * $currency_value/100) * $currency_rate));
      $product->set('price', $price);
      $product->save();
    }
    break;
}