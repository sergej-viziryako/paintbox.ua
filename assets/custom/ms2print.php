<?php
/** @var modX $modx */
if (!isset($modx)) {
  define('MODX_API_MODE', true);
  require_once dirname(dirname(dirname(__FILE__))) . '/index.php';
  $modx->getService('error', 'error.modError');
  $modx->getRequest();
  $modx->setLogLevel(modX::LOG_LEVEL_ERROR);
  $modx->setLogTarget('FILE');
  $modx->error->message = null;
  $modx->lexicon->load('default');
}
$ctx = !empty($_REQUEST['ctx']) ? $_REQUEST['ctx'] : $modx->context->get('key');
if ($ctx != $modx->context->get('key')) {
  $modx->switchContext($ctx);
}
$pdoTools = $modx->getService('pdoTools');

$order_id = (int)$_REQUEST['order'];
if (empty($order_id) || !$order = $modx->getObject('msOrder', ['id' => $order_id])) {
  $response = 'Заказ не найден!';
} elseif ($order->user_id != $modx->user->id && !$modx->user->hasSessionContext('mgr')) {
  $response = 'У вас нет прав на просмотр заказа!';
} else {
  $order_address = $order->getOne('Address');
  $params = [
    'order' => $order->toArray(),
    'user' => !empty($order->UserProfile) ? $order->UserProfile->toArray() : [],
    'address' => !empty($order_address) ? $order_address->toArray() : [],
    'delivery' => !empty($order->Delivery) ? $order->Delivery->toArray() : [],
    'payment' => !empty($order->Payment) ? $order->Payment->toArray() : [],
    'status' => !empty($order->Status) ? $order->Status->toArray() : [],
    'products' => [],
  ];
  /** @var msOrderProduct $product */
  foreach ($order->Products as $product) {

    if ($vendors = $product->Product->Data->getOne('Vendor')) {
      $vendors_name = $vendors->get('name');
    }

    $params['products'][] = array_merge($product->toArray(), [
      'article' => $product->Product->Data->get('article'),
      'thumb' => $product->Product->Data->get('thumb'),
      'vendor' => !empty($vendors_name) ? $vendors_name : '',

    ]);
  }
  $response = $pdoTools->getChunk('tplMsGetOrderPrint', $params);
}
@session_write_close();
exit($response);