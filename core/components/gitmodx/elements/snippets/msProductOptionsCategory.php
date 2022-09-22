<?php
/** @var modX $modx */
/** @var array $scriptProperties */

$tpl = $modx->getOption('tpl', $scriptProperties, 'tpl.msProductOptions.rowOption');
if (!empty($input) && empty($product)) {
  $product = $input;
}

$product = !empty($product) && $product != $modx->resource->id
  ? $modx->getObject('msProduct', ['id' => $product])
  : $modx->resource;
if (!($product instanceof msProduct)) {
  return "[msProductOptions] The resource with id = {$product->id} is not instance of msProduct.";
}

$ignoreOptions = array_filter(array_map('trim', explode(',', $modx->getOption('ignoreOptions', $scriptProperties, ''))));
$onlyOptions = array_filter(array_map('trim', explode(',', $modx->getOption('onlyOptions', $scriptProperties, ''))));
$groups = array_filter(array_map('trim', explode(',', $modx->getOption('groups', $scriptProperties, ''))));

/** @var msProductData $data */
if ($data = $product->getOne('Data')) {
  $optionKeys = $data->getOptionKeys();
}
if (empty($optionKeys)) {
  return '';
}

$q = $modx->newQuery('msProductOption');
$q->rightJoin('msOption', 'msOption', 'msProductOption.key = msOption.key');
$q->leftJoin('modCategory', 'Category', 'Category.id = msOption.category');
$q->where(['msProductOption.product_id' => $product->get('id')]);
if (!empty($groups)) {
  $q->where([
    ['Category.id:IN' => $groups, 'OR:Category.category:IN' => $groups]
  ]);
}
if (!empty($onlyOptions)) {
  $q->where(['msProductOption.key:IN' => $onlyOptions]);
} elseif (!empty($ignoreOptions)) {
  $q->where(['msProductOption.key:NOT IN' => $ignoreOptions]);
}
$q->select($modx->getSelectColumns('msOption', 'msOption'));
$q->select($modx->getSelectColumns('msProductOption', 'msProductOption', '', ['key'], true));
$q->select('Category.category AS category_name');
$q->sortby('Category.rank');

$tmp = [];
if ($q->prepare() && $q->stmt->execute()) {
  while ($option = $q->stmt->fetch(PDO::FETCH_ASSOC)) {
    if (empty($option['value'])) continue;
    $option['value'] = [$option['value']];
    if (empty($option['category_name'])) {
      $option['category_name'] = 'без категории';
    }
    $key = $option['key'];
    $category = $option['category_name'];
    if (!isset($tmp[$category])) {
      $tmp[$category] = [];
    }
    if (!isset($tmp[$category][$key])) {
      $tmp[$category][$key] = $option;
    } elseif (!empty($tmp[$category][$key]['value']) and is_array($tmp[$category][$key]['value'])) {
      $tmp[$category][$key]['value'] = array_merge($tmp[$category][$key]['value'], $option['value']);
    } else {
      $tmp[$category][$key]['value'] = $option['value'];
    }
  }
}

$output = [];
foreach ($tmp as $category => $options) {
  if (empty($output[$category])) {
    $output[$category] = [];
  }
  foreach ($optionKeys as $optionKey) {
    if (isset($options[$optionKey])) {
      $output[$category][$optionKey] = $options[$optionKey];
    }
  }
}

/** @var pdoTools $pdoTools */
$pdoTools = $modx->getService('pdoTools');

return $pdoTools->getChunk($tpl, ['data' => $output]);