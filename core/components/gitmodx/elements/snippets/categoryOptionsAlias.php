<?php
$catid = $modx->resource->id;
$q = $modx->newQuery('msCategoryOption');
$q->select(array('msCategoryOption.category_id','msCategoryOption.option_id','mso.key'));
$q->where(array('msCategoryOption.category_id' => $catid));
$q->leftJoin('msOption','mso','msCategoryOption.option_id = mso.id');
$q->prepare();
$q->stmt->execute();
$options = $q->stmt->fetchAll(PDO::FETCH_ASSOC);
$_options = array();

foreach ($options as $option) {
  $_options[] = 'msoption|'.$option['key'].'=='.$option['key'];
}
return implode(',',$_options);