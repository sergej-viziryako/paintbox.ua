<?php
$base = $modx->config['base_url'];
$tvname = $modx->getOption('tvname', $scriptProperties, "autotag");
$output = "";
$result = array();
$culture_key = $modx->getOption('cultureKey');



$content_type = $modx->getObject('modContentType', array('mime_type' => 'text/html'));
if(substr_count($_SERVER["REQUEST_URI"], $content_type->get('file_extensions'))) {
  $parent = $modx->resource->parent;
  $url = $modx->makeUrl($modx->resource->parent);
}else{
  $parent = $modx->resource->id;
  $url = $modx->resource->uri;
}

$q = $modx->newQuery('modTemplateVarResource');
$q->select('DISTINCT(`modTemplateVarResource`.`value`)');
$q->innerJoin('modTemplateVar', 'tv', "tv.id = modTemplateVarResource.tmplvarid");
$q->innerJoin('modResource', 'res', 'res.id=modTemplateVarResource.contentid');
$q->where(array(
    'tv.name' => $tvname,
    'res.context_key' => $modx->resource->context_key,
    'res.parent' => $parent
  )
);

if($q->prepare() && $q->stmt->execute()) {
  while ($row = $q->stmt->fetch(PDO::FETCH_ASSOC)) {
    $result[] = $row['value'];
  }
}
if($result) {
  $result = implode($result, ',');
  $result = array_unique(explode(',', $result));

  foreach($result as $value) {
    if ($culture_key != 'ua') {
      $value_name = $modx->lexicon('tag_'.translit($value));
      $value_url = $culture_key.'/';
    } else {
      $value_name = $value;
      $value_url = '';
    }

    if ($value == $active) {
      $output .= "<li class='active'><a href='{$url}?tag={$value}'>{$value_name}</a></li>";
    } else {
      $output .= "<li><a href='{$url}?tag={$value}'>{$value_name}</a></li>";
    }
  }

}

function translit($s) {
  $s = (string) $s;
  $s = trim($s);
  $s = function_exists('mb_strtolower') ? mb_strtolower($s) : strtolower($s);
  $s = strtr($s, array('а'=>'a','б'=>'b','в'=>'v','г'=>'g','д'=>'d','е'=>'e','ё'=>'e','ж'=>'j','з'=>'z','и'=>'i','й'=>'y','к'=>'k','л'=>'l','м'=>'m','н'=>'n','о'=>'o','п'=>'p','р'=>'r','с'=>'s','т'=>'t','у'=>'u','ф'=>'f','х'=>'h','ц'=>'c','ч'=>'ch','ш'=>'sh','щ'=>'shch','ы'=>'y','э'=>'e','ю'=>'yu','я'=>'ya','ъ'=>'','ь'=>''));
  //return  str_replace("," , '_', $s);
  return  str_replace(array(", ",",", " ", "."), array("_", "_", "_", "_"), $s); // возвращаем результат
}


return $output;