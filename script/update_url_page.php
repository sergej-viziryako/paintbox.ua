<?php
//pattern: /[\0\x0B\t\n\r\f\a&=+%#<>"~:`@\*\(\)\?\[\]\{\}\|\^'\\]/

define('MODX_API_MODE', true);
require dirname(dirname(__FILE__)).'/index.php';

$q_count = $modx->prepare("SELECT COUNT(*) FROM modx_site_content WHERE class_key = 'msCategory' ORDER BY id ASC");
$q_count->execute();
$total = $q_count->fetchColumn();
$i = 0;

$pdo = $modx->getService('pdoTools');
$q = $modx->prepare("SELECT `id`, `uri`, `pagetitle`, `alias`, `class_key` FROM modx_site_content WHERE class_key = 'msCategory' ORDER BY id ASC");
$q->execute();
while($row = $q->fetch(PDO::FETCH_ASSOC)) {
    //if ($row['class_key'] == 'msCategory' AND $row['id'] == 32620) {
    if ($i > 17499) {
        if ($row['class_key'] == 'msCategory') {
        $id = $row['id'];
        $pids = $modx->getParentIds($id, 10, array('context' => 'web'));
        $pids = array_diff($pids, ["0", "160", "29312", "2", "164"]);
        krsort($pids);
        //$uri = 'catalog';
        $uri = '';
        foreach ($pids as $id) {
            if ($res = $modx->getObject('modResource', array('id' => $id))) {
                $alias = $res->cleanAlias($res->pagetitle);
                //$uri .= '-'.$alias;
                $uri .= $alias;
            }
        }
        //$modx->log(xPDO::LOG_LEVEL_ERROR,'Category alias -'.$uri);

        if ($resource = $modx->getObject('modResource', array('id' => $row['id']))) {
            $uri_page = $uri . '-' . $resource->cleanAlias($resource->pagetitle);
            $resource->set('alias', $uri_page);
            $resource->save();
        }
    }
        //print '/'.$row['alias'].';'.$uri_page.'<br>';

    }
    $i++;
    echo progressBar($i, $total, $row['id']);

    /*if ($row['class_key'] == 'msProduct') {
        if ($resource = $modx->getObject('modResource', array('id'=>$row['id']))) {
            $uri_page = 'product/'.$resource->cleanAlias($resource->pagetitle);
            $resource->set('alias', $uri_page);
            $resource->save();
        }
        //print '/'.$row['alias'].';'.$uri_page.'<br>';
    }*/

}

print '<pre>'; print_r($pdo->getTime()); print '</pre>';



function progressBar($done, $total,$id_product) {
    $perc = floor(($done / $total) * 100);
    $left = 100 - $perc;
    $write = sprintf("\033[0G\033[2K[%'={$perc}s>%-{$left}s] - $perc%% - $done/$total/$id_product", "", "");
    fwrite(STDERR, $write);
}