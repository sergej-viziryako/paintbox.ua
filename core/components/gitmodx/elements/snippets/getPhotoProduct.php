<?php
if ($id == ''){
  return;
}
if ($thread = $modx->getObject('msProductData', array('id' => $id))) {
  echo $thread->get('image');
}