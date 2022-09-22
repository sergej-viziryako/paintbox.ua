<?php
$pars = array(
  'parents' => $parents,
  'depth' => $depth,
  'totalVar' => 'count',
  'setTotal' => 1,
  'where' => $where
);
$modx -> runSnippet('msProducts', $pars);
$countitem = '[[+count]]';
//$modx->log(modX::LOG_LEVEL_ERROR, print_r($countitem,true));
return $countitem;