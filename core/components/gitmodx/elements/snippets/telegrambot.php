<?php
//$token = "1706671427:AAGa7Zu-PleMxbixPvfyq82zP93Bha6MLBI";
//$chat_id = "-526650711";

$token = $modx->getOption('telegram_bot_api_token');
$chat_id = $modx->getOption('telegram_chat_id');

if($token == '' OR $chat_id == ''){
  return false;
}

$values = $hook->getValues();

// Получаем название формы
$formName = $modx->getOption('formName', $formit->config, 'form-'.$modx->resource->get('id'));

// Получаем ip адрес отправителя
$ip = $modx->getOption('REMOTE_ADDR', $_SERVER, '');

// Берем данные с формы


$title = $values['title'];
$name = $values['name'];
$phone = $values['phone'];
$email = $values['email'];
$url = $values['urlproduct'];
$message = $values['text'];



// Создаем массив данных
$arr = array(
  //"Название формы" => $formName,
  "IP" => $ip,
  "Имя" => $name);

if($title){
  $arr["Страница"] = $title;
}

if($name){
  $arr["Имя"] = $name;
}

if($phone){
  $arr["Телефон"] = $phone;
}

if($email){
  $arr["Email"] = $email;
}

if($url){
  $arr["Адрес страницы"] = $url;
}

if($message){
  $arr["Сообщение"] = $message;
}

$txt = '<b>Заполнена форма - '.$formName."</b>\n";
// Цикл по массиву (собираем сообщение)
foreach($arr as $key => $value) {
  $txt .= "<b>".$key."</b>: ".$value." \n";
}

// Отправляем сообщение посредством cURL
$website="https://api.telegram.org/bot".$token;
$params=[
  'chat_id' => $chat_id,
  'text' => $txt,
  'parse_mode' => 'html'
];
$ch = curl_init($website . '/sendMessage');
curl_setopt($ch, CURLOPT_HEADER, false);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, ($params));
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
$result = curl_exec($ch);
$modx->log(MODX_LOG_LEVEL_ERROR, $result);
curl_close($ch);

//Возвращаем true – это особенность написания хуков для FormIt.
return true;/*telegrambot.php*/