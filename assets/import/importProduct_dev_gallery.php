<?php

//define('MODX_API_MODE', true);
//require '/home/motoro03/budmagazin.com/www/index.php';

//https://gist.github.com/iksecreeet/5bfa6fe53489cff25f8d926c5eecaa97#file-xml_to_minishop2_v-2-php
//https://ilyaut.ru/cheats/create-options-and-set-values-minishop2/
  
  $tplProduct = 20; //номер шаблона для карточки товара
  $tplParent = 24; //номер шаблона для категорий
  $idParent = 593; //id каталога товаров
  $arrImage = array('','_1','_2','_3','_up');
  $fileProduct = dirname(dirname(dirname(dirname(dirname(__FILE__))))).'/assets/import/importFile/kontent4.xml';
  
  // print dirname(dirname(dirname(dirname(dirname(dirname(__FILE__)))))).'/foto/';
  
  
  $xpath_expression['categoryId'] = '//yml_catalog/shop/offers/offer/categoryId'; //categoryId
  $xpath_expression['price'] = '//yml_catalog/shop/offers/offer/price'; //price
  $xpath_expression['pagetitle'] = '//yml_catalog/shop/offers/offer/title'; //title
  $xpath_expression['vendor'] = '//yml_catalog/shop/offers/offer/vendor'; //vendor
  $xpath_expression['article'] = '//yml_catalog/shop/offers/offer/article'; //vendorCode
  $xpath_expression['availability'] = '//yml_catalog/shop/offers/offer/availability';
  $xpath_expression['introtext'] = '//yml_catalog/shop/offers/offer/annotation';
  $xpath_expression['content'] = '//yml_catalog/shop/offers/offer/param[@name="Содержимое"]'; //content
  $xpath_expression['madein'] = '//yml_catalog/shop/offers/offer/country';
  $xpath_expression['size'] = '//yml_catalog/shop/offers/offer/size';
  $xpath_expression['price_sale'] = '//yml_catalog/shop/offers/offer/stock_price';
  $xpath_expression['weight'] = '//yml_catalog/shop/offers/offer/weight';
  $xpath_expression['barcode'] = '//yml_catalog/shop/offers/offer/barcode';
  $xpath_expression['codetnved'] = '//yml_catalog/shop/offers/offer/tnved_code';
  $xpath_expression['warranty'] = '//yml_catalog/shop/offers/offer/warranty';
  $xpath_expression['param'] = '//yml_catalog/shop/offers/offer/param';
  $xpath_expression['offer'] = '//yml_catalog/shop/offers/offer';
  
  print '3'.PHP_EOL;
  
  define('MODX_API_MODE', true);
  require dirname(dirname(dirname(dirname(dirname(__FILE__))))).'/index.php';
  
  /*if ($res = $modx->getObject('modResource', 1)) {
    print_r($res->toArray());
  }*/
  // Включаем обработку ошибок
  /*$modx->setLogTarget(XPDO_CLI_MODE ? 'ECHO' : 'HTML');
  $modx->setLogLevel(modX::LOG_LEVEL_ERROR);
  $modx->getService('error', 'error.modError');
  $modx->lexicon->load('minishop2:default');
  $modx->lexicon->load('minishop2:manager');
  $modx->error->message = null; // Обнуляем переменную*/
  
  
  print '4'.PHP_EOL;
  
  //if (XPDO_CLI_MODE) {
  set_time_limit(259200);
  $tmp = 'Trying to set time limit = 259200 sec: ';
  $tmp .= ini_get('max_execution_time') == 259200 ? 'done' : 'error';
  $modx->log(modX::LOG_LEVEL_ERROR, $tmp);
  
  //print $fileProduct;
  
  // чтение файла XML
  $xml = new DOMDocument();
  $xml->load($fileProduct);
  $xpath = new DOMXPath($xml);
  
  $pagetitles = $xpath->query($xpath_expression['pagetitle']);
  $articles = $xpath->query($xpath_expression['article']);
  $offers = $xpath->query($xpath_expression['offer']);
  
  $count = $pagetitles->length - 1;
  
  global $modx;
  
  print '5'.PHP_EOL;
  
  for ($i = 0; $i <= $count; $i++) {
    $data = $dataCat = $parents_array = $parentstmp = array();
    /*$price = str_replace(array(" ", " ", ","), array("", "", "."), $prices->item($i)->nodeValue);
    $pagetitle = trim($pagetitles->item($i)->nodeValue);
    $vendor = trim($vendors->item($i)->nodeValue);
    $madein = trim($madeins->item($i)->nodeValue);
    $content = trim($contents->item($i)->nodeValue);*/
    
    $pagetitle = trim($pagetitles->item($i)->nodeValue);
    $article = trim($articles->item($i)->nodeValue);
    $data['pagetitle'] = $pagetitle;
    $data['article'] = $article;
    
    //Get pagetitle product
    $q = $modx->newQuery('msProduct');
    $q->select($modx->getSelectColumns('msProduct', 'msProduct') . ',' . $modx->getSelectColumns('msProductData', 'Data'));
    $q->innerJoin('msProductData', 'Data', 'msProduct.id = Data.id');
    if (!empty($data['article'])) {
      $q->where(array('Data.article' => $data['article']));
    } else {
      $q->where(array('pagetitle' => $data['pagetitle']));
    }
    $q->prepare();
    
    
    //update product
    if ($res = $modx->getObject('msProduct', $q)) {
      //$data['editedon'] = date("Y-m-d H:i:s");
      //$res->toArray();
      $id_product = $res->get('id');
      $image_product = $res->get('image');
      
      //if (empty($image_product)) {
      
      foreach ($arrImage as $a) {
        //$val_picture = dirname(dirname(dirname(dirname(dirname(dirname(__FILE__)))))).'/foto/'.$res->get('article').''.$a.'.jpg';
        $val_picture = dirname(dirname(dirname(dirname(dirname(__FILE__))))).'/foto/'.$res->get('article').''.$a.'.jpg';
        
        print $val_picture.PHP_EOL;
        addGallery($val_picture, 'update', $id_product);
        
      }
      
      //}
      
      
    }
    
    if($i == 2) {break;}
  }
  //}
  
  function addGallery($gallery,$action,$id_product){
    global $modx;
    //$response = $modx->runProcessor('resource/'.$action, $data);
    
    if (!empty($gallery)) {
      $modx->log(modX::LOG_LEVEL_INFO, "Importing images: \n" . print_r($gallery, 1));
      $img_file=file_get_contents($gallery);
      $file_loc = MODX_BASE_PATH.'assets/import/productImage/product.jpg';
      //print $file_loc.'file_loc <pre>';
      $file_handler=fopen($file_loc,'w');
      if(fwrite($file_handler,$img_file)==false){
        echo 'error';
      }
      //fclose($file_handler);
      $image = MODX_BASE_PATH.'assets/import/productImage/product.jpg';
      //$resource = $response->getObject();
      
      if (!file_exists($image)) {
        $modx->log(modX::LOG_LEVEL_ERROR, "Could not import image \"$v\" to gallery. File \"$image\" not found on server.");
      } else {
        $response = $modx->runProcessor('gallery/upload',
          array('id' => $id_product, 'name' => $gallery, 'file' => $image),
          array('processors_path' => MODX_CORE_PATH . 'components/minishop2/processors/mgr/')
        );
        
        if ($response->isError()) {
          $modx->log(modX::LOG_LEVEL_ERROR, "Error on upload \"$v\": \n" . print_r($response->getAllErrors(), 1));
        } else {
          $modx->log(modX::LOG_LEVEL_INFO, "Successful upload  \"$v\": \n" . print_r($response->getObject(), 1));
        }
      }
    }
  }
  