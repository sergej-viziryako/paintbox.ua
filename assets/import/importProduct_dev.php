<?php

//define('MODX_API_MODE', true);
//require '/home/motoro03/budmagazin.com/www/index.php';

//https://gist.github.com/iksecreeet/5bfa6fe53489cff25f8d926c5eecaa97#file-xml_to_minishop2_v-2-php
//https://ilyaut.ru/cheats/create-options-and-set-values-minishop2/

$tplProduct = 20; //номер шаблона для карточки товара
$tplParent = 24; //номер шаблона для категорий
$idParent = 593; //id каталога товаров

//$fileProduct = '/home/motoro03/budmagazin.com/www/assets/import/importFile/import-test.xml'; //имя файла с товарами
$fileProduct = dirname(dirname(dirname(dirname(dirname(__FILE__))))).'/assets/import/importFile/kontent5.xml';

//Item Product
/*
$xpath_expression['categoryId'] = '//yml_catalog/shop/offers/offer/categoryId'; //categoryId
$xpath_expression['price'] = '//yml_catalog/shop/offers/offer/price'; //price
$xpath_expression['pagetitle'] = '//yml_catalog/shop/offers/offer/name'; //name
$xpath_expression['vendor'] = '//yml_catalog/shop/offers/offer/vendor'; //vendor
//$xpath_expression['picture'] = '//yml_catalog/shop/offers/offer/picture'; //picture
$xpath_expression['article'] = '//yml_catalog/shop/offers/offer/param[@name="Артикул"]'; //vendorCode
$xpath_expression['availability'] = '//yml_catalog/shop/offers/offer/param[@name="ВНаличии"]';
$xpath_expression['content'] = '//yml_catalog/shop/offers/offer/param[@name="Аннотация"]';
$xpath_expression['madein'] = '//yml_catalog/shop/offers/offer/param[@name="СтранаПроисхождения"]';
$xpath_expression['size'] = '//yml_catalog/shop/offers/offer/param[@name="Размеры"]';
$xpath_expression['price_sale'] = '//yml_catalog/shop/offers/offer/param[@name="ЦенаАкции"]';
$xpath_expression['weight'] = '//yml_catalog/shop/offers/offer/param[@name="Вес"]';
$xpath_expression['barcode'] = '//yml_catalog/shop/offers/offer/param[@name="ШтрихКод"]';
$xpath_expression['codetnved'] = '//yml_catalog/shop/offers/offer/param[@name="КодТНВЭД"]';
*/

$xpath_expression['categoryId'] = '//yml_catalog/shop/offers/offer/categoryId'; //categoryId
$xpath_expression['price'] = '//yml_catalog/shop/offers/offer/price'; //price
$xpath_expression['pagetitle'] = '//yml_catalog/shop/offers/offer/title'; //title
$xpath_expression['vendor'] = '//yml_catalog/shop/offers/offer/vendor'; //vendor
//$xpath_expression['article'] = '//yml_catalog/shop/offers/offer/param[@name="Артикул"]'; //vendorCode
$xpath_expression['article'] = '//yml_catalog/shop/offers/offer/article'; //vendorCode
$xpath_expression['availability'] = '//yml_catalog/shop/offers/offer/availability';
//$xpath_expression['content'] = '//yml_catalog/shop/offers/offer/annotation';
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


print '3'.'<pre>';

define('MODX_API_MODE', true);
require dirname(dirname(dirname(dirname(dirname(__FILE__))))).'/index.php';

/*if ($res = $modx->getObject('modResource', 1)) {
  print_r($res->toArray());
}*/


//print '4'.'/n';

// Включаем обработку ошибок
/*$modx->setLogTarget(XPDO_CLI_MODE ? 'ECHO' : 'HTML');
$modx->setLogLevel(modX::LOG_LEVEL_ERROR);
$modx->getService('error', 'error.modError');
$modx->lexicon->load('minishop2:default');
$modx->lexicon->load('minishop2:manager');*/
//$modx->error->message = null; // Обнуляем переменную


print '4'.'/n';

//if (XPDO_CLI_MODE) {
set_time_limit(259200);
$tmp = 'Trying to set time limit = 259200 sec: ';
$tmp .= ini_get('max_execution_time') == 259200 ? 'done' : 'error';
//$modx->log(modX::LOG_LEVEL_ERROR, $tmp);

//print $fileProduct;

// чтение файла XML
$xml = new DOMDocument();
$xml->load($fileProduct);
$xpath = new DOMXPath($xml);

$prices = $xpath->query($xpath_expression['price']);
$pagetitles = $xpath->query($xpath_expression['pagetitle']);
$vendors = $xpath->query($xpath_expression['vendor']);
//$pictures = $xpath->query($xpath_expression['picture']);
$category_id = $xpath->query($xpath_expression['categoryId']);
$articles = $xpath->query($xpath_expression['article']);
$availabilitys = $xpath->query($xpath_expression['availability']);
$contents = $xpath->query($xpath_expression['content']);
$introtexts = $xpath->query($xpath_expression['introtext']);
$madeins = $xpath->query($xpath_expression['madein']);
$sizes = $xpath->query($xpath_expression['size']);
$price_sales = $xpath->query($xpath_expression['price_sale']);
$weights = $xpath->query($xpath_expression['weight']);
$barcodes = $xpath->query($xpath_expression['barcode']);
$codetnveds = $xpath->query($xpath_expression['codetnved']);
$warrantys = $xpath->query($xpath_expression['warranty']);
$params = $xpath->query($xpath_expression['param']);
$offers = $xpath->query($xpath_expression['offer']);

$count = $pagetitles->length - 1;

//Get element Category
$searchNode = $xml->getElementsByTagName("category");

$arr_category = array();
global $modx;

print '8'.'<pre>';

//search category
foreach( $searchNode as $searchNode ) {
  $valueID = $searchNode->getAttribute('id');
  $valueParentId = $searchNode->getAttribute('parentId');
  $titleParent = ucfirst(strtolower($searchNode->nodeValue));

  //print $searchNode->getElementsByTagName( "category" );
  //if ($valueParentId) {
  if (!empty($arr_category[$valueParentId])) {
    $arr_category[$valueID] = trim($arr_category[$valueParentId]).'/'.trim($titleParent);
    //$arr_category[$valueID] = $valueParentId.'/'.$titleParent;
  } else {
    $arr_category[$valueID] = trim($titleParent);
  }
}

for ($i = 0; $i <= $count; $i++) {
  $data = $dataCat = $parents_array = $parentstmp = array();
  $pagetitle = trim($pagetitles->item($i)->nodeValue);
  $article = trim($articles->item($i)->nodeValue);
  //print  '<br>'.'article - '.$article.'<br><br><br>';
  $price = str_replace(array(" ", " ", ","), array("", "", "."), $prices->item($i)->nodeValue);
  $vendor = trim($vendors->item($i)->nodeValue);
  //$gallery = trim($pictures->item($i)->nodeValue);
  $article = trim($articles->item($i)->nodeValue);
  $availability = trim($availabilitys->item($i)->nodeValue);
  $content = trim($contents->item($i)->nodeValue);
  $introtext = trim($introtexts->item($i)->nodeValue);
  $madein = trim($madeins->item($i)->nodeValue);
  $size = trim($sizes->item($i)->nodeValue);
  //$price_sale = trim($price_sales->item($i)->nodeValue);
  
  //$price_sale = str_replace(array(" ", " ", ","), array("", "", "."), $price_sales->item($i)->nodeValue);
  
  foreach ($offers->item($i)->getElementsByTagName('stock_price') as $stock_price) {
    $price_sale = str_replace(array(" ", " ", ","), array("", "", "."), $stock_price->nodeValue);
  }
  
  
  $weight = round(str_replace(array(" ", " ", ","), array("", "", "."), $weights->item($i)->nodeValue),3);
  $barcode = trim($barcodes->item($i)->nodeValue);
  $codetnved = trim($codetnveds->item($i)->nodeValue);
  $warranty = trim($warrantys->item($i)->nodeValue);
  $param = trim($params->item($i)->nodeValue);
  $offer = $offers->item($i)->nodeValue;

  //Category product
  $parents_array = '/'.$arr_category[trim($category_id->item($i)->nodeValue)];
  $parentstmp = explode('/',$parents_array);

  //Delete first element
  unset($parentstmp[0]);

  //Add category
  foreach($parentstmp as $parent) {

    /*if(!empty($parent)){
      continue;
    }*/

    if($cat = $modx->getObject('msCategory', array('pagetitle' => $parent, 'parent' => isset($data['parent']) ? $data['parent'] : $idParent))) {
      $data['parent'] = $cat->id;
      continue;
    }
    $dataCat['pagetitle'] = $parent;

    $q = 'SELECT MAX(`id`) AS id FROM '.$modx->getTableName('modResource');
    $o = $modx->prepare($q);
    $o->execute();
    $resmaxid = $o->fetch(PDO::FETCH_ASSOC);
    $resmaxid = ' id-'.($resmaxid['id'] + 1);

    $dataCat['pagetitle'] .= $resmaxid;

    $dataCat['class_key'] = 'msCategory';
    $dataCat['context_key'] = 'web';
    $dataCat['template'] = $tplParent;
    $dataCat['parent'] = ($data['parent']) ? $data['parent'] : $idParent;
    $dataCat['published'] = 1;

    $modx->error->message = null;
    $response = $modx->runProcessor('resource/create', $dataCat,
      array('processors_path' => MODX_CORE_PATH.'model/modx/processors/')
    );
    if ($response->isError()) {
      return $response->getAllErrors();
    }
    $resource = $response->getObject();
    $data['parent'] = $resource['id'];
    if ($res = $modx->getObject('msCategory', array('id' => $resource['id']))) {
      $res->toArray();
      $res->set('pagetitle', str_replace($resmaxid, '', $res->get('pagetitle')));
      $res->save();
    }
  }

  /*Add option*/
  //print '<br>'.$pagetitle.'2222<pre>';
  foreach ($offers->item($i)->getElementsByTagName('param') as $a) {
    $str = translit($a->getAttribute('name'));
    $str_name = $a->getAttribute('name');
    //print $str.' - '.$a->nodeName.' - '.$a->nodeValue.' - '.$i.'<pre>';
    
  
    if ($a->getAttribute('name') != 'Содержимое') {
      addOptions($str, $str_name);
    }
    //addUpdateProductOption($product_id, $key, $val);

    if ($res_option_id = $modx->getObject('msOption', array('key' => $str))) {
      parentAddOptions($res_option_id->get('id'), $data['parent']); //добавляем опцию к категории
    }
  }

  //Add Vendor
  //$modx->log(modX::LOG_LEVEL_ERROR, $i.' - '.getVendorIdByName($vendor));

  if (getVendorIdByName($vendor)) {
    //$modx->log(modX::LOG_LEVEL_ERROR, $i . ' Yes');
    $vendorId = getVendorIdByName($vendor);
  } else {
    //$modx->log(modX::LOG_LEVEL_ERROR, $i . ' No');
    $vendorId = addVendor($vendor);
  }

  if ($availability == 'Да') {
    $data['availability'] = 1;
  } else {
    $data['availability'] = 0;
  }
  $data['pagetitle'] = $pagetitle;
  $data['article'] = $article;
  $data['price'] = $price;
  $data['vendor'] = $vendorId;
  $data['class_key'] = 'msProduct';
  $data['context_key'] = 'web';
  $data['template'] = $tplProduct;
  //$data['parent'] = $idParent;
  $data['published'] = 1;
  $data['content'] = $content;
  $data['introtext'] = $introtext;
  $data['made_in'] = $madein;
  $data['size'] = array(0 => $size);
  //$data['old_price'] = $price_sale;
  $data['price_sale'] = $price_sale;
  $data['weight'] = $weight;
  $data['barcode'] = $barcode;
  $data['codetnved'] = $codetnved;
  $data['warranty'] = $warranty;

  //Get pagetitle product
  $q = $modx->newQuery('msProduct');
  $q->select($modx->getSelectColumns('msProduct', 'msProduct') . ',' . $modx->getSelectColumns('msProductData', 'Data'));
  $q->innerJoin('msProductData', 'Data', 'msProduct.id = Data.id');
  //$q->where(array('pagetitle' => $data['pagetitle']));
  //if ($data['article']) $q->where(array('Data.article' => $data['article']));
  //else $q->where(array('pagetitle' => $data['pagetitle']));

  if (!empty($data['article'])) {
    $q->where(array('Data.article' => $data['article']));
  } else {
    $q->where(array('pagetitle' => $data['pagetitle']));
  }
  $q->prepare();

  print '4'. PHP_EOL;

  //update product
  if ($res = $modx->getObject('msProduct', $q)) {
    $data['editedon'] = date("Y-m-d H:i:s");
    $res->toArray();
    $res->set('editedon', $data['editedon']);
    $res->set('price', $data['price']);
    $res->set('weight', $data['weight']);
    $res->set('availability', $data['availability']);
    $res->set('size', $data['size']);
    $res->set('price_sale', $data['price_sale']);
    $res->set('warranty', $data['warranty']);
    
    //$res->set('article', $data['article']);
    $res->save();
    $new = 'upd';

    //update options
    foreach ($offers->item($i)->getElementsByTagName('param') as $a) {
      //print $res->get('id').'<br>';
      $key = translit($a->getAttribute('name'));
      //print $key.'<br>';
      //$key_caption = $a->getAttribute('name');
      $key_val = $a->nodeValue;
      //print $key_val.'<br>';
      //print $str.' - '.$a->nodeName.' - '.$a->nodeValue.' - '.$i.'<pre>';
      addUpdateProductOption($res->get('id'), $key, $key_val);
  
      //Prisvaevaem categoriyu opcii
      if ($res_option_id = $modx->getObject('msOption', array('key' => $key))) {
        parentAddOptions($res_option_id->get('id'), $res->get('parent')); //добавляем опцию к категории
      }
      
    }
    //continue;
  } else {
    //Create new product
    $new = createProduct($data,$gallery);

    //add options
    if ($res_option = $modx->getObject('msProductData', array('article' => $data['article']))) {
      //print $res_option->get('id'). PHP_EOL;
      foreach ($offers->item($i)->getElementsByTagName('param') as $a) {
        $key = translit($a->getAttribute('name'));
        $key_caption = $a->getAttribute('name');
        $key_val = $a->nodeValue;
        //print $str.' - '.$a->nodeName.' - '.$a->nodeValue.' - '.$i.'<pre>';
        addUpdateProductOption($res_option->get('id'), $key, $key_val);
      }
    }
  }
  //if($i == 400) {break;}
}
//print_r($new);



//}


function clearCache() {
  //require_once('../index.php'); // путь к index.php самого modx (тот, что в корне сайта)
  $modx= new modX();
  $modx->initialize('web');
  $modx->getService('error','error.modError', '', '');
  $cm = $modx->getCacheManager();
  $cm->refresh();
  print "Сlear Cache Successfull";
  //$modx->log(modX::LOG_LEVEL_ERROR, 'Сlear Cache Successfull');
}

function createProduct($data = array(),$gallery){
  global $modx;

  $q = 'SELECT MAX(`id`) AS id FROM ' . $modx->getTableName('modResource');
  $o = $modx->prepare($q);
  $o->execute();
  $resmaxid = $o->fetch(PDO::FETCH_ASSOC);
  $resmaxid = ' id-' . ($resmaxid['id'] + 1);
  $data['pagetitle'] .= $resmaxid;

  //return $data;

  $modx->error->message = null;
  $response = $modx->runProcessor('resource/create', $data,
    array('processors_path' => MODX_CORE_PATH . 'model/modx/processors/')
  );
  if ($response->isError()) {
    return $response->getAllErrors();
  }
  $resource = $response->getObject();

  $res = $modx->getObject('msProduct', array('id' => $resource['id']));
  $res->set('pagetitle', str_replace($resmaxid, '', $res->get('pagetitle')));
  $res->save();

  addGallery($gallery,'update');

  return 'new';
}

function getVendorIdByName($name){
  global $modx;
  $q = $modx->newQuery('msVendor');
  $q->select(array('id'));
  $q->where(array('name:=' => $name));
  $q->prepare();
  $q->stmt->execute();
  return $q->stmt->fetchColumn();
}

function addVendor($name){
  global $modx;
  $vendor = $modx->newObject('msVendor');
  $vendor->set('name', $name);
  if ($vendor->save()) {
    return $vendor->get('id');
  } else {
    return 0;
  }
}

function addGallery($gallery,$action){
  global $modx;
  $q = 'SELECT MAX(`id`) AS id FROM ' . $modx->getTableName('modResource');
  $o = $modx->prepare($q);
  $o->execute();
  $idProduct = $o->fetch(PDO::FETCH_ASSOC);

  $data['id'] = idProduct;

  $response = $modx->runProcessor('resource/'.$action, $data);

  if (!empty($gallery)) {
    //$modx->log(modX::LOG_LEVEL_INFO, "Importing images: \n" . print_r($gallery, 1));
    $img_file=file_get_contents($gallery);
    $file_loc=MODX_BASE_PATH.'assets/import/productImage/product.jpg';
    //print $file_loc.'file_loc <pre>';
    $file_handler=fopen($file_loc,'w');
    if(fwrite($file_handler,$img_file)==false){
      echo 'error';
    }
    //fclose($file_handler);
    $image = MODX_BASE_PATH.'assets/import/productImage/product.jpg';
    $resource = $response->getObject();

    if (!file_exists($image)) {
      //$modx->log(modX::LOG_LEVEL_ERROR, "Could not import image \"$v\" to gallery. File \"$image\" not found on server.");
    } else {
      $response = $modx->runProcessor('gallery/upload',
        array('id' => $idProduct, 'name' => $gallery, 'file' => $image),
        array('processors_path' => MODX_CORE_PATH . 'components/minishop2/processors/mgr/')
      );

      if ($response->isError()) {
        //$modx->log(modX::LOG_LEVEL_ERROR, "Error on upload \"$v\": \n" . print_r($response->getAllErrors(), 1));
      } else {
        //$modx->log(modX::LOG_LEVEL_INFO, "Successful upload  \"$v\": \n" . print_r($response->getObject(), 1));
      }
    }
  }
}


function translit($s) {
  $s = (string) $s; // преобразуем в строковое значение
  $s = trim($s); // убираем пробелы в начале и конце строки
  $s = function_exists('mb_strtolower') ? mb_strtolower($s) : strtolower($s); // переводим строку в нижний регистр (иногда надо задать локаль)
  $s = strtr($s, array('а'=>'a','б'=>'b','в'=>'v','г'=>'g','д'=>'d','е'=>'e','ё'=>'e','ж'=>'j','з'=>'z','и'=>'i','й'=>'y','к'=>'k','л'=>'l','м'=>'m','н'=>'n','о'=>'o','п'=>'p','р'=>'r','с'=>'s','т'=>'t','у'=>'u','ф'=>'f','х'=>'h','ц'=>'c','ч'=>'ch','ш'=>'sh','щ'=>'shch','ы'=>'y','э'=>'e','ю'=>'yu','я'=>'ya','ъ'=>'','ь'=>''));
  //return  str_replace("," , '_', $s); // возвращаем результат
  return  str_replace(array(", ",",", " ", "."), array("_", "_", "_", "_"), $s); // возвращаем результат
}

function addOptions($key,$name) {
  global $modx;
  //Get otion-product
  $q = $modx->newQuery('msOption');
  $q->select($modx->getSelectColumns('msOption', 'msOption'));
  $q->where(array('msOption.key' => $key));
  $q->prepare();

  if ($res_option = $modx->getObject('msOption', $q)) {
    //print 'yes';
    $res_option->set('category', 17);
    $res_option->save();
  } else {
    //print 'no';
    $res_option = $modx->newObject('msOption');
    $res_option->set('key', $key);
    $res_option->set('caption', $name);
    $res_option->set('type', 'textfield');
    $res_option->set('description', '');
    $res_option->set('category', 17);
    $res_option->save();
  }
}

function addUpdateProductOption($product_id, $key, $val) {
  global $modx;
  if ($po = $modx->getObject('msProductOption', array('product_id' => $product_id, 'key' => $key))) {
    //print 'Value found' . PHP_EOL;
    $q = $modx->newQuery('msProductOption');
    $q->command('UPDATE');
    $q->where(array('product_id'=> $product_id,'key' => $key));
    $q->set(array('value' => str_replace(array("*", ";"), array("X", ""), $val)));
    $q->prepare();
    $q->stmt->execute();
    //print 'Value updated' . PHP_EOL;
  } else {
    //print 'Value not found' . PHP_EOL;
    $table = $modx->getTableName('msProductOption');
    if (!is_int($val)) {
      $val = '"' . str_replace(array("*", ";"), array("X", ""), $val) . '"';
    }
    $sql = "INSERT INTO {$table} (`product_id`,`key`,`value`) VALUES ({$product_id}, \"{$key}\", {$val});";
    $stmt = $modx->prepare($sql);
    $stmt->execute();
    //print 'Value created' . PHP_EOL;
  }
}

function parentAddOptions($option_id, $category_id) {
  global $modx;
  if (!$cop = $modx->getObject('msCategoryOption', array('option_id' => $option_id, 'category_id' => $category_id))) {
    //print 'Category option not found' . PHP_EOL;
    $table = $modx->getTableName('msCategoryOption');
    $sql = "INSERT INTO {$table} (`option_id`,`category_id`,`active`) VALUES ({$option_id}, {$category_id}, 1);";
    $stmt = $modx->prepare($sql);
    $stmt->execute();
    //print 'Category option created' . PHP_EOL;
  } else {
    //print 'Category option found' . PHP_EOL;
    $q = $modx->newQuery('msCategoryOption');
    $q->command('UPDATE');
    $q->where(array('option_id' => $option_id, 'category_id' => $category_id));
    $q->set(array('active' => 1));
    $q->prepare();
    $q->stmt->execute();
    //print 'Category option updated' . PHP_EOL;
  }
}



//clearCache();
//$modx->log(modX::LOG_LEVEL_ERROR, 'Import The End!');
//}
//print 'exit'.'<pre>';
//exit;