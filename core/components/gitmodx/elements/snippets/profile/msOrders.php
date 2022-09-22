<?php
$path = MODX_CORE_PATH . 'components/pdotools/model/pdotools/';
$pdoFetch = $modx->getService('pdofetch', 'pdoFetch', $path, $scriptProperties);

// снипет выводит заказы текущего пользователя
$user_id = $modx->user->get('id');
$tpl = $modx->getOption('tpl',$scriptProperties,'tplOrder');

// подхватываем заказы текущего пользователя
$q = $modx->newQuery('msOrder', array('user_id' => $user_id));
$q->sortby('num','DESC');
$q->limit($limit,0);

$results = $modx->getCollection('msOrder', $q);
//$output = array();
// выводим или чанками или предупреждением что заказов пока нет

$count = 0;
if ($results) {
  foreach ($results as $result) {
    $resultArray = $result->toArray();
    $resultArray['idx'] = $count;
    $count++;
    $output .= $pdoFetch->getChunk($tpl, $resultArray);
  }
} else {
  $output = '<div class="row"><ul><li>'.$modx->lexicon('office_no_any_orders').'</li></ul></div>';
}
return $output;





