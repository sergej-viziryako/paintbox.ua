<?php
define('MODX_API_MODE', true);
require dirname(dirname(__FILE__)).'/api.php';
//set_time_limit(3600);
//ini_set('memory_limit', '512M');

/*if ($res = $modx->getObject('modResource', 1)) {
  print_r($res->toArray());
}*/


//$resources = $modx->getCollection('modResource',array('class_key' => 'msCategory', 'template' => 44, 'parent' => 48331));
//$total = $modx->getCount('modResource',array('class_key' => 'msCategory', 'template' => 44, 'parent' => 48331));

/*if (!$resources = $modx->getCollection('modResource',array('class_key' => 'msCategory', 'template' => 44))) {
    return;
}
if (!$total = $modx->getCount('modResource',array('class_key' => 'msCategory', 'template' => 44))) {
    return;
}*/

$sql = "SELECT * FROM modx_site_content WHERE class_key = 'msCategory' AND template = 44";
$q = $modx->prepare($sql);
$q->execute();
$resources = $q->fetchAll(PDO::FETCH_ASSOC);

$total = count($resources);


$list_option = array(347,345,346);
$i = 0;
//print 'total - '.$total.PHP_EOL;


foreach ($resources as $res) {
    //print $res['id'].'<br>';
    foreach ($list_option as $list_option_id) {
        parentAddOptions($list_option_id, $res['id']);
    }

    //parentAddOptions(347, $res->get('id'));

    $i++;

    echo progressBar($i, $total, $res['id']);
}

//parentAddOptions(347, 30581);

function parentAddOptions($option_id, $category_id)
{
    global $modx;
    if (!$cop = $modx->getObject('msCategoryOption', array('option_id' => $option_id, 'category_id' => $category_id))) {
        $res = $modx->newObject('msCategoryOption');
        $res->set('option_id', $option_id);
        $res->set('category_id', $category_id);
        $res->set('rank', 0);
        $res->set('active', 1);
        $res->set('required', 0);
        $res->set('value', '');
        $res->save();

    } else {
        $q = $modx->newQuery('msCategoryOption');
        $q->command('UPDATE');
        $q->where(array('option_id' => $option_id, 'category_id' => $category_id));
        $q->set(array('active' => 1));
        $q->prepare();
        $q->stmt->execute();
    }
}

function progressBar($done, $total,$id_product) {
    $perc = floor(($done / $total) * 100);
    $left = 100 - $perc;
    $write = sprintf("\033[0G\033[2K[%'={$perc}s>%-{$left}s] - $perc%% - $done/$total/$id_product", "", "");
    fwrite(STDERR, $write);
}