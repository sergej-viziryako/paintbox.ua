<?php
//@include(dirname(__FILE__) . '/config.core.php');
//if (!defined('MODX_CORE_PATH')) define('MODX_CORE_PATH', dirname(__FILE__) . '/core/');


$res = array();
$_options = array();
$i=0;

if ($id == '') {
  return;
}

$sql = "SELECT modx_tickets_comments.properties FROM modx_tickets_comments,modx_tickets_threads WHERE modx_tickets_comments.thread = modx_tickets_threads.id AND modx_tickets_comments.published = 1 AND modx_tickets_threads.resource =".$id;
$q = $modx->prepare($sql);
$q->execute();
$res = $q->fetchAll(PDO::FETCH_ASSOC);

foreach ($res as $v) {
  $obj = json_decode($v['properties']);
  if (!empty($obj->{'starrating'})) {
    $_options[] = $obj->{'starrating'};
    //print $obj->{'starrating'}.'<pre>';
  }
  $i=$i+1;
  //print $v['properties'].'<pre>';
}

$count_review_all  = $i;
$count_review  = count($_options);
$sum_review = array_sum($_options);
if ($count_review == 0) {
  $aggregate_raiting = 0;
}
else {
  $aggregate_raiting  = $sum_review/$count_review;
}

$modx->setPlaceholder('count_review', $count_review);
$modx->setPlaceholder('count_review_all', $count_review_all);
$modx->setPlaceholder('aggregate_raiting', round($aggregate_raiting, 1));
$modx->setPlaceholder('aggregate_raiting_floor', floor($aggregate_raiting));





