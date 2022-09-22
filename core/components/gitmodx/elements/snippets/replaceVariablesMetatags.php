<?php
$string = str_replace(array("#product_name#","#product_parent#","#product_price#","#product_brand#","#product_availability#","\""),
  array($name, $parent, $price, $brand, $available,''), $string);
return $string;