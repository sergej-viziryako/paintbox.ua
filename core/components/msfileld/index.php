<?php /* Index file for miniShop2 plugin */
return array(
    'map' => array(
        'msProductData' => require_once 'msproductdata.inc.php',
    ),
    'manager' => array(
        'msProductData' => MODX_ASSETS_URL . 'components/msfileld/msproductdata.js',
    ),
);