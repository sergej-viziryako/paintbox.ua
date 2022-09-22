<?php
/*if ($vendor_name == '') {
  return;
}*/
//$id_vendor = $modx->findResource($vendor_name, 'web');
if ($res = $modx->getObject('modResource',array('pagetitle' => $vendor_name))) {
  $id = $res->get('id');
  return '<a href="'.$modx->makeurl($id, '', '').'">'.$vendor_name.'</a>';
} else {
  return $vendor_name;
}