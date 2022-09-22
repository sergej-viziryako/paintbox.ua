<?php
/*$today = date("d.m.Y");
if (!empty($date_stock)) {
  $date_stock_in = $date_stock;
}
$result = (strtotime($date_stock_in) < strtotime($today));
return $result;*/


$today = date("Y-m-d");
if (empty($date_stock)) {
  return 0;
}

if (empty($date_stock_begin)) {
  if ((strtotime($date_stock) > strtotime($today))) {
    return 1;
  } else {
    return 0;
  }
} else {
  if ((strtotime($date_stock) > strtotime($today)) && (strtotime($today) >= strtotime($date_stock_begin))) {
    return 1;
  } else {
    return 0;
  }
}




