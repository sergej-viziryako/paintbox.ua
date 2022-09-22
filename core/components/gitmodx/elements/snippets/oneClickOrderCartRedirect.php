<?php
$id = intval($id);
$orders_id = $_SESSION['minishop2']['orders'];
rsort($orders_id);
//print_r($orders_id);
$order = intval($orders_id[0]);
//print $orders_id[0];

if ($modx->getCount('modResource', array('id' => $id))) {
  $modx->sendRedirect($modx->makeUrl($id). '?msorder=' . $order, array('responseCode' => 'HTTP/1.1 301 Moved Permanently'));
} else {
  return;
}