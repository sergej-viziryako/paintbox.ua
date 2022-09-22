<?php
function text_error(){
  return false;
  die();
}
if(isset($_POST['org'])){
  if($hook->getValue('org')!=''){
    $modx->log(xPDO::LOG_LEVEL_ERROR, 'Ошибка заполнения формы: не пустое поле антиспама');
    $modx->log(xPDO::LOG_LEVEL_ERROR, print_r($_POST, 1));
    text_error();
  }else{
    return true;
  }
}else{
  $modx->log(xPDO::LOG_LEVEL_ERROR, 'Ошибка заполнения формы: нет поля антиспама');
  $modx->log(xPDO::LOG_LEVEL_ERROR, print_r($_POST, 1));
  text_error();
}