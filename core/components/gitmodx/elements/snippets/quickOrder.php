<?php
$errors_list = array();
$phone = trim($_POST['phone']);
//$email = trim($_POST['email']);
$email = 'oneclickorder@example.com';
$name = trim($_POST['receiver']);
$productId = trim($_POST['id']);

if ( empty( trim( $_POST['phone'] ) ) ) {
  $errors_list['phone'] = 'Вы не заполнили телефон';
}

/*if ( empty( trim( $_POST['receiver'] ) ) ) {
  $errors_list['receiver'] = 'Вы не ввели Имя';
}*/

if ( !empty( $errors_list ) ) {
  return $AjaxForm->error( $modx->lexicon('one_click_error_ajaxform'),  $errors_list);
} else {
  $scriptProperties = array(
    'json_response' => true, // возвращать ответы в JSON
    'max_count' => 1 // максимальное число товаров для добавления за один раз
  );

  $miniShop2 = $modx->getService('minishop2', 'miniShop2', MODX_CORE_PATH . 'components/minishop2/model/minishop2/', $scriptProperties);

  if (!($miniShop2 instanceof miniShop2)) {
    return $AjaxForm->error('Ошибка скрипта!');
  }

  $miniShop2->initialize($modx->context->key, $scriptProperties);
  $miniShop2->cart->clean(); //Очищаем корзину
  $miniShop2->cart->add($productId); //Добавляем в корзину товар
  $miniShop2->order->add('receiver', 'Покупка в один клик'); // Указываем имя получателя
  $miniShop2->order->add('phone', $phone);
  $miniShop2->order->add('email', $email);
  $miniShop2->order->add('payment', 1); //Указываем способ оплаты
  $miniShop2->order->add('delivery', 1); //Указываем способ доставки
  $miniShop2->order->add('comment_one_click', '<b style="background-color:#003366;color:#FFFFFF;padding: 4px 10px;border-radius: 3px;">ПЕРЕЗВОНИТЬ!</b>'); 
  $miniShop2->order->submit(); //Отправляем заказ
  return $AjaxForm->success('Заказ отправлен. ');
}