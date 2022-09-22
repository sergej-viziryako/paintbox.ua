<?php
return array(
    'OnDocFormSave' => array(
        'importLang',
        'importLangOptions'
        //'index_page_form_save',
        //'cache_manager'
    ),
    'msOnBeforeAddToCart' => array(
        'addCart',
        'loadLexicon'
    ),
    'OnParseDocument' => array(
        'loadLexicon'
    ),
    'OnLoadWebDocument' => array(
        'userAgent',
        'default_lang',
        'loadLexicon'
    ),
    'msOnSubmitOrder' => array(
        'loadLexicon'
    ),
    'msOnBeforeChangeInCart' => array(
        'loadLexicon'
    ),
    'msOnBeforeRemoveFromCart' => array(
        'loadLexicon'
    ),
    'OnBeforeUserFormSave' => array(
        'addNameRegistartion'
    ),
    'OnUserFormSave' => array(
        'addNameRegistartion'
    ),
    'msOnCreateOrder' => array(
        'createOrderExcel',
        'msOnCreateOrderTelegram'
    ),
    'msOnManagerCustomCssJs' => array(
        'ms2print',
        'deliveryUpdateOrder',
        'msExtraAddressFields'
    ),
    'msOnBeforeUpdateOrder' => array(
        'deliveryUpdateOrder'
    ),
    'msOnBeforeCreateOrder' => array(
        'msExtraAddressFields'
    ),
    'OnPageNotFound' => array(
        'msFavoriter'
    )
);