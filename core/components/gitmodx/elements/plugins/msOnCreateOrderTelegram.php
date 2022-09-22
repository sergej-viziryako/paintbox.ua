<?php

if ($modx->event->name = 'msOnCreateOrder') {
  //$order = $msOrder->toArray();

  //$token = "1706671427:AAGa7Zu-PleMxbixPvfyq82zP93Bha6MLBI";
  //$chat_id = "-526650711";

  $token = $modx->getOption('telegram_bot_api_token');
  $chat_id = $modx->getOption('telegram_chat_id');

  if($token == '' OR $chat_id == ''){
    return;
  }

  $msAddress = $msOrder->getOne('Address');
  $product_order = $msOrder->getMany('Products');
  $msPayment = $msOrder->getOne('Payment');
  $msDelivery = $msOrder->getOne('Delivery');
  $arr = array();


  //$product_order = $product->toArray();

  $msReceiver = $msOrder->get('receiver');
  $msComment = $msAddress->get('comment');
  $msPhone = $msAddress->get('phone');
  $msEmail = $msAddress->get('email');
  $formName = $msOrder->get('num');
  $name = $msAddress->get('receiver');
  $phone = $msAddress->get('phone');
  $city = $msAddress->get('city');

  if ($msDelivery->get('id') == 5) {
    $number_delivery_arr = $msOrder->get('properties');
    $city = $number_delivery_arr['msnovaposhta']['warehouse']['CityDescriptionRu'];
    $otdelenie = $number_delivery_arr['msnovaposhta']['warehouse']['DescriptionRu'];
  } else {
    $city = $msAddress->get('city');
    $otdelenie_arr = $msAddress->get('properties');
    $otdelenie = $otdelenie_arr['extfld_warehouse'];
  }

  $street = $msAddress->get('street');
  $email = $msAddress->get('email');
  $cart_cost = $msOrder->get('cart_cost');
  $delivery = $msDelivery->get('name');
  $payment = $msPayment->get('name');

  if($name){
    $arr["Имя"] = $name;
  }
  if($phone){
    $arr["Телефон"] = $phone;
  }
  if($payment){
    $arr["Способ оплаты"] = $payment;
  }
  if($delivery){
    $arr["Способ доставки"] = $delivery;
  }
  if($city){
    $arr["Город"] = $city;
  }
  if($otdelenie){
    $arr["Номер отделения"] = $otdelenie;
  }
  if($street){
    $arr["Адрес доставки"] = $street;
  }
  if($email){
    $arr["Email"] = $email;
  }
  if($msComment){
    $arr["Комментарий к заказу"] = $msComment;
  }
  if($cart_cost){
    $arr["Сумма заказа"] = $cart_cost.' '.$modx->lexicon('ms2_frontend_currency');
  }


  $txt = '<b>Номер заказа - '.$formName."</b>\n";
  foreach($arr as $key => $value) {
    $txt .= "<b>".$key."</b>: ".$value." \n";
  }

  $txt .= "\n<b>Заказанные товары</b>:\n";
  $i = 1;
  foreach ($product_order as $key => $product) {
    $txt .=  '<b>'.$i.'</b>. '.$product->get('name').' | '.$product->get('price').' '.$modx->lexicon('ms2_frontend_currency').' | Кол-во: '.$product->get('count').' | Опции: '.implode(",",$product->get('options')).' | Итого: '.$product->get('cost').' '.$modx->lexicon('ms2_frontend_currency')." \n";
    $i++;
  }

  // Отправляем сообщение посредством cURL
  $website="https://api.telegram.org/bot".$token;
  $params=[
    'chat_id' => $chat_id,
    'text' => $txt,
    'parse_mode' => 'html'
  ];
  $ch = curl_init($website . '/sendMessage');
  curl_setopt($ch, CURLOPT_HEADER, false);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
  curl_setopt($ch, CURLOPT_POST, 1);
  curl_setopt($ch, CURLOPT_POSTFIELDS, ($params));
  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
  $result = curl_exec($ch);
  $modx->log(MODX_LOG_LEVEL_ERROR, $result);
  curl_close($ch);
}