<?php
require_once($_SERVER['DOCUMENT_ROOT'] .'/assets/components/exportorderusers/PHPExcel/Classes/PHPExcel.php');
require_once($_SERVER['DOCUMENT_ROOT'] .'/assets/components/exportorderusers/PHPExcel/Classes/PHPExcel/Writer/Excel2007.php');

if ($modx->event->name = 'msOnCreateOrder') {

    $msAddress = $msOrder->getOne('Address');
    $msPayment = $msOrder->getOne('Payment');
    $msDelivery = $msOrder->getOne('Delivery');
    $product_order = $msOrder->getMany('Products');
    $arr = array();

    //$product_order = $product->toArray();
    $msReceiver = $msOrder->get('receiver');
    $msComment = $msAddress->get('comment');
    $msPhone = $msAddress->get('phone');
    $msEmail = $msAddress->get('email');
    $orderNum = $msOrder->get('num');
    $name = $msAddress->get('receiver');
    $phone = $msAddress->get('phone');
    $city = $msAddress->get('city');
    $number_delivery = $msAddress->get('room');
    $street = $msAddress->get('street');
    $email = $msAddress->get('email');
    $cart_cost = $msOrder->get('cart_cost');
    $payment = $msPayment->get('name');
    $delivery = $msDelivery->get('name');

    if($orderNum){
        $arr["Номер заказа"] = $orderNum;
    }
    if($name){
        $arr["Имя"] = $name;
    }

    if($phone){
        $arr["Телефон"] = $phone;
    }

    if($city){
        $arr["Город"] = $city;
    }

    if($number_delivery){
        $arr["№ отделения"] = $number_delivery;
    }

    if($email){
        $arr["Email"] = $email;
    }

    if($payment){
        $arr["Способ оплаты"] = $payment;
    }

    if($delivery){
        $arr["Способ доставки"] = $delivery;
    }

    if($msComment){
        $arr["Комментарий к заказу"] = $msComment;
    }

    /*if($cart_cost){
        $arr["Сумма заказа"] = $cart_cost;
    }*/

    /*To Excel*/
    $xls = new PHPExcel();
    $xls->setActiveSheetIndex(0);
    $sheet = $xls->getActiveSheet();
    $sheet->setTitle('Список заказов');

    $sheet->setCellValueByColumnAndRow(0, 1, 'Артикул');
    $sheet->setCellValueByColumnAndRow(1, 1, 'Наименование товара');
    $sheet->setCellValueByColumnAndRow(2,1, 'Цена, грн.');
    $sheet->setCellValueByColumnAndRow(3, 1, 'Кол-во');
    $sheet->setCellValueByColumnAndRow(4, 1, 'Итого, грн.');

    $i = 2;
    foreach ($product_order as $key => $product) {
        if ($product_row = $modx->getObject('msProductData', array('id' => $product->get('product_id')))) {
            $sheet->setCellValueByColumnAndRow(0, $i, $product_row->get('article'));
        }
        $sheet->setCellValueByColumnAndRow(1, $i, $product->get('name'));
        $sheet->setCellValueByColumnAndRow(2,$i, $product->get('price'));
        $sheet->setCellValueByColumnAndRow(3,$i, $product->get('count'));
        $sheet->setCellValueByColumnAndRow(4,$i, $product->get('cost'));
        $i++;
    }
    $sheet->setCellValueByColumnAndRow(3,$i, 'Итого:');
    $sheet->setCellValueByColumnAndRow(4,$i, $cart_cost);

    $i = $i+2;
    foreach($arr as $key => $value) {
        $sheet->setCellValueByColumnAndRow(0, $i, $key);
        $sheet->setCellValueByColumnAndRow(1, $i, $value);
        $i++;
    }

    $objWriter = new PHPExcel_Writer_Excel5($xls);
    $objWriter->save(str_replace(__FILE__,$_SERVER['DOCUMENT_ROOT'] .'/assets/components/exportorderusers/files/'.str_replace('/', '_', $orderNum).'.xls',__FILE__));

}