<?php
if ($thread = $modx->getObject('TicketThread', array('resource' => $id))) {
  echo $thread->get('comments');
}