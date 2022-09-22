<?php

if ($modx->event->name=="OnDocFormSave") {

  $id = $resource->get('id');
  if ($id !== 29298) {
    return '';
  }
  $file = $resource->getTVValue('lang_file');

  $modx->log(MODX_LOG_LEVEL_INFO, "It's worked! Run examplePlugin!" . $file);

  $modx->event->output('File' . $file);

  if ($file == '') {
    return '';
  }

  $file = $modx->getOption('base_path') . $file;
  if ($handle = fopen($file, "r")) {
    $idx = 0;
    $products = array();
    while ($rowData = fgetcsv($handle, 10000, ";")) {
      if ($idx > 0) {
        //записываем атрибуты
        $products[$idx] = array(
          /*'resource_id' => mb_convert_encoding($rowData[0], "utf-8", "windows-1251"),
          'key' => mb_convert_encoding($rowData[1], "utf-8", "windows-1251"),
          'pagetitle' => mb_convert_encoding($rowData[2], "utf-8", "windows-1251"),
          'introtext' => mb_convert_encoding($rowData[3], "utf-8", "windows-1251"),
          'content' => mb_convert_encoding($rowData[4], "utf-8", "windows-1251")*/
          'resource_id' => $rowData[0],
          'key' => $rowData[1],
          'pagetitle' => $rowData[2],
          'introtext' => $rowData[3],
          'content' => $rowData[4],

          'metaTitle' => $rowData[5],
          'metaDescription' => $rowData[6],
          'metaKeywords' => $rowData[7],
          'h1' => $rowData[8]
        );
      }
      $idx++;
    }
    foreach ($products as $key => $product) {
      if ($cop = $modx->getObject('localizatorContent', array('resource_id' => $product['resource_id'], 'key' => $product['key']))) {
        //print $cop->get('resource_id');
        $cop->set('key', $product['key']);
        $cop->set('pagetitle', $product['pagetitle']);
        $cop->set('longtitle', '');
        $cop->set('menutitle', '');
        $cop->set('seotitle', '');
        $cop->set('keywords', '');
        $cop->set('introtext', $product['introtext']);
        $cop->set('description', '');
        $cop->set('content', $product['content']);
        $cop->set('active', 1);
        $cop->save();

      } else {
        $res = $modx->newObject('localizatorContent');
        $res->set('resource_id', $product['resource_id']);
        $res->set('key', $product['key']);
        $res->set('pagetitle', $product['pagetitle']);
        $res->set('longtitle', '');
        $res->set('menutitle', '');
        $res->set('seotitle', '');
        $res->set('keywords', '');
        $res->set('introtext', $product['introtext']);
        $res->set('description', '');
        $res->set('content', $product['content']);
        $res->set('active', 1);
        $res->save();
        //print 'No row';
      }

      //Meta Title
      if ($tv_meta_title = $modx->getObject('modTemplateVarResource', array('contentid' => $product['resource_id'], 'tmplvarid' => 7))) {
        $tv_meta_title->set('value', $product['metaTitle']);
        $tv_meta_title->save();
      } else {
        $tv_meta_title_new = $modx->newObject('modTemplateVarResource');
        $tv_meta_title_new->set('tmplvarid', 7);
        $tv_meta_title_new->set('contentid', $product['resource_id']);
        $tv_meta_title_new->set('value', $product['metaTitle']);
        $tv_meta_title_new->save();
      }

      //Meta Description
      if ($tv_meta_description = $modx->getObject('modTemplateVarResource', array('contentid' => $product['resource_id'], 'tmplvarid' => 8))) {
        $tv_meta_description->set('value', $product['metaDescription']);
        $tv_meta_description->save();
      } else {
        $tv_meta_description_new = $modx->newObject('modTemplateVarResource');
        $tv_meta_description_new->set('tmplvarid', 8);
        $tv_meta_description_new->set('contentid', $product['resource_id']);
        $tv_meta_description_new->set('value', $product['metaDescription']);
        $tv_meta_description_new->save();
      }

      //Meta metaKeywords
      if ($tv_meta_keywords = $modx->getObject('modTemplateVarResource', array('contentid' => $product['resource_id'], 'tmplvarid' => 9))) {
        $tv_meta_keywords->set('value', $product['metaKeywords']);
        $tv_meta_keywords->save();
      } else {
        $tv_meta_keywords_new = $modx->newObject('modTemplateVarResource');
        $tv_meta_keywords_new->set('tmplvarid', 9);
        $tv_meta_keywords_new->set('contentid', $product['resource_id']);
        $tv_meta_keywords_new->set('value', $product['metaKeywords']);
        $tv_meta_keywords_new->save();
      }

      //Meta h1
      if ($tv_meta_h_one = $modx->getObject('modTemplateVarResource', array('contentid' => $product['resource_id'], 'tmplvarid' => 6))) {
        $tv_meta_h_one->set('value', $product['h1']);
        $tv_meta_h_one->save();
      } else {
        $tv_meta_h_one_new = $modx->newObject('modTemplateVarResource');
        $tv_meta_h_one_new->set('tmplvarid', 6);
        $tv_meta_h_one_new->set('contentid', $product['resource_id']);
        $tv_meta_h_one_new->set('value', $product['h1']);
        $tv_meta_h_one_new->save();
      }

    }
  } else {
    $modx->log(modX::LOG_LEVEL_ERROR, 'Error! Can not open the file: ' . $file);
    return '';
  }

}