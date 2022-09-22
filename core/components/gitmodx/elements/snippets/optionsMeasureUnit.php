<?php
if ($thread = $modx->getObject('msOption', array('key' => $key))) {
  print $thread->get('measure_unit');
}