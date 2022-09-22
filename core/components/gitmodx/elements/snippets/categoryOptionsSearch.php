<?php
//$catid = $modx->resource->id;
$q = $modx->newQuery('msOption');
$q->select(array('msOption.key', 'msOption.type'));
$q->prepare();
$q->stmt->execute();
$options = $q->stmt->fetchAll(PDO::FETCH_ASSOC);
$_options = array();

foreach ($options as $option) {
    if ($option['type'] == 'numberfield') {
    } else {
        $_options[] = 'msoption|' . $option['key'];
    }
}
return implode(',', $_options);