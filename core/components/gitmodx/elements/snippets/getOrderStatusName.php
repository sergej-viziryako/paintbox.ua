<?php
if ($order_status_id == '')
  return;

if ($res = $modx->getObject('msOrderStatus',$order_status_id)) {
  $output = $res->get('name');
  return $output;
}
else {
  return;
}
