<?php
$string = str_replace(array("#category_name#","#category_items_count#","#category_min_price#","#category_max_price#","\""),
  array($name, $count, $min_price, $max_price,''), $string);
return $string;