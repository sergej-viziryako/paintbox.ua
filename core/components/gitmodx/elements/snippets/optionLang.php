<?php
/*$q = $modx->newQuery('msCategoryOption');
$q->select(array('msCategoryOption.category_id','msCategoryOption.option_id','mso.key','mso.type'));
$q->where(array('msCategoryOption.category_id' => $catid));
$q->leftJoin('msOption','mso','msCategoryOption.option_id = mso.id');*/

set_time_limit(259200);
$_options = $_options_key = $_options_number = $_options_key_gal = array();
$_options_key_str = $_options_str = $str_add = '';
$style_td = 'style = "width: 50%;border: 1px solid #eee;text-align: left;"';
$style_th = 'style = "font-weight: bold;width: 50%;border: 1px solid #eee;text-align: center;"';

//Значение опции
$sql = "SELECT * FROM modx_ms2_product_options GROUP BY value";
$q = $modx->prepare($sql);
$q->execute();
$options = $q->fetchAll(PDO::FETCH_ASSOC);

$_options_str .= '<tr><td '.$style_th.'>Значение (оригинал)</td><td '.$style_th.'>Переменная</td></tr>';
$option_value_count = 0;
foreach ($options as $option) {
  $name_key = $modx->runSnippet('translit', array('string' => $option['value']));
  if (!$cop = $modx->getObject('modLexiconEntry', array('name' => $name_key, 'language' => 'ua')) AND $name_key != 'option_') {
    $_options_str .= '<tr><td '.$style_td.'>'.$option['value'].'</td><td '.$style_td.'>'.$name_key.'</td></tr>';
    $option_value_count++;
  }
  //if ($a == 500)break;
}

//Название опции
$sql_key = "SELECT * FROM modx_ms2_options GROUP BY modx_ms2_options.key";
$q_key = $modx->prepare($sql_key);
$q_key->execute();
$options_key = $q_key->fetchAll(PDO::FETCH_ASSOC);

//$_options_key_str .= '<tr><td '.$style_th.'>Название опции (оригинал)</td><td '.$style_th.'>Переменная</td></tr>';
$options_key_count = 0;
foreach ($options_key as $option) {
  $name_key = $modx->runSnippet('translit', array('string' => $option['key']));
  if (!$cop = $modx->getObject('modLexiconEntry', array('name' => $name_key, 'language' => 'ua')) AND $name_key != 'option_') {
    $_options_key_str .= '<tr><td ' . $style_td . '>' . $modx->runSnippet('optionsCaptionView', array('key' => $option['key'])) . '</td><td ' . $style_td . '>' . $name_key. '</td></tr>';
    $options_key_count++;
  }
  //if ($i == 100)break;
}

//measure_unit
$sql_key_measure_unit = "SELECT * FROM modx_ms2_options GROUP BY modx_ms2_options.measure_unit";
$q_key_measure_unit = $modx->prepare($sql_key_measure_unit);
$q_key_measure_unit->execute();
$options_key_measure_unit = $q_key_measure_unit->fetchAll(PDO::FETCH_ASSOC);

//$_options_key_str .= '<tr><td '.$style_th.'>Название опции (оригинал)</td><td '.$style_th.'>Переменная</td></tr>';
$options_key_measure_unit_count = 0;
foreach ($options_key_measure_unit as $option) {
  $name_measure_unit = $modx->runSnippet('translit', array('string' => $option['measure_unit']));
  if (!$cop = $modx->getObject('modLexiconEntry', array('name' => $name_measure_unit, 'language' => 'ua')) AND $name_measure_unit != 'option_') {
    $_options_measure_unit_str .= '<tr><td ' . $style_td . '>' . $option['measure_unit'] . '</td><td ' . $style_td . '>' . $name_measure_unit. '</td></tr>';
    $options_key_measure_unit_count++;
  }
  //if ($i == 100)break;
}


//brand
$sql_key_tv_brand = "SELECT * FROM modx_ms2_vendors";
$q_sql_key_tv_brand = $modx->prepare($sql_key_tv_brand);
$q_sql_key_tv_brand->execute();
$options_key_tv_brand = $q_sql_key_tv_brand->fetchAll(PDO::FETCH_ASSOC);

$brand_count = 0;
foreach ($options_key_tv_brand as $option) {
  $name_key = $modx->runSnippet('translit', array('string' => $option['name']));
  if (!$cop = $modx->getObject('modLexiconEntry', array('name' => $name_key, 'language' => 'ua'))) {
    $_options_key_tv_brand_result .= '<tr><td ' . $style_td . '>' . $option['name'] . '</td><td ' . $style_td . '>' . $name_key . '</td></tr>';
    $brand_count++;
  }
}

//made_in
$sql_key_tv_made_in = "SELECT * FROM modx_ms2_products GROUP BY modx_ms2_products.made_in";
$q_sql_key_tv_made_in = $modx->prepare($sql_key_tv_made_in);
$q_sql_key_tv_made_in->execute();
$options_key_tv_made_in = $q_sql_key_tv_made_in->fetchAll(PDO::FETCH_ASSOC);

$made_in_count = 0;
foreach ($options_key_tv_made_in as $result_option) {
  $name_key = $modx->runSnippet('translit', array('string' => $result_option['made_in']));
  if (!$cop = $modx->getObject('modLexiconEntry', array('name' => $name_key, 'language' => 'ua')) AND $name_key != 'option_') {
    $_options_key_tv_made_in_result .= '<tr><td ' . $style_td . '>' . $result_option['made_in'] . '</td><td ' . $style_td . '>' . $name_key . '</td></tr>';
    $made_in_count++;
  }
}

//Category options
$sql_modx_categories = "SELECT * FROM modx_categories WHERE uuid != ''";
$q_sql_key_categories = $modx->prepare($sql_modx_categories);
$q_sql_key_categories->execute();
$options_key_categories = $q_sql_key_categories->fetchAll(PDO::FETCH_ASSOC);

$categories_count = 0;
foreach ($options_key_categories as $option) {
  $name_key = $modx->runSnippet('translit', array('string' => $option['category']));
  if (!$cop = $modx->getObject('modLexiconEntry', array('name' => $name_key, 'language' => 'ua'))) {
    $_options_categories_str .= '<tr><td ' . $style_td . '>' . $option['category'] . '</td><td ' . $style_td . '>' . $name_key . '</td></tr>';
    $categories_count++;
  }
}

$str_add .='<tr><td>Значения опций: '.$option_value_count.'</td></tr>';
$str_add .='<tr><td>Названия опций: '.$options_key_count.'</td></tr>';
$str_add .='<tr><td>Брендов: '.$brand_count.'</td></tr>';
$str_add .='<tr><td>Страна: '.$made_in_count.'</td></tr>';
$str_add .='<tr><td>Категории опций: '.$categories_count.'</td></tr>';
$str_add .='<tr><td>Единица измерения: '.$options_key_measure_unit_count.'</td></tr>';

return '<table width="600" border="1" align="center" cellpadding="4" cellspacing="0"><colgroup><col style="width:40%"><col style="width:60%"></colgroup>  '.$str_add.' '.$_options_str.' '.$_options_key_str.' '.$_options_key_tv_brand_result.' '.$_options_key_tv_made_in_result.' '.$_options_categories_str.' '.$_options_measure_unit_str.'</table>';







