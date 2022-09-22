<?php
$id = $resource->get('id');
if($id != 29298){
  return '';
}
$file = $resource->getTVValue('lang_options');

if($file == ''){
  return '';
}

$file = $modx->getOption('base_path').$file;
if ($handle = fopen($file, "r")) {
  $idx = 0;
  $products = array();
  while ($rowData = fgetcsv($handle, 10000, ";"))
  {
    if($idx > 0){
      //записываем атрибуты
      $products[$idx] = array(
        /*'resource_id' => mb_convert_encoding($rowData[0], "utf-8", "windows-1251"),
        'key' => mb_convert_encoding($rowData[1], "utf-8", "windows-1251"),
        'pagetitle' => mb_convert_encoding($rowData[2], "utf-8", "windows-1251"),
        'introtext' => mb_convert_encoding($rowData[3], "utf-8", "windows-1251"),
        'content' => mb_convert_encoding($rowData[4], "utf-8", "windows-1251")*/
        'name' => $rowData[0],
        'value' => $rowData[1],
        'language' => $rowData[2]
      );
    }
    $idx++;
  }
  foreach ($products as $key => $product) {
    if ($cop = $modx->getObject('modLexiconEntry', array('name' => $product['name'], 'language' => $product['language']))) {
      //print $cop->get('resource_id');
    } else {
      $res = $modx->newObject('modLexiconEntry');
      $res->set('name', $product['name']);
      $res->set('value',  $product['value']);
      $res->set('topic', 'site');
      $res->set('namespace', 'localizator');
      $res->set('language', $product['language']);
      $res->set('createdon', '');
      $res->set('editedon', '');
      $res->save();
      //print 'No row';
    }
    //иначе - обновляем
  }
}else{
  $modx->log(modX::LOG_LEVEL_ERROR, 'Error! Can not open the file: '.$file);
  return '';
}