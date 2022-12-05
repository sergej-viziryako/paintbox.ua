<?php
return array(
    'fields' => array(
        'availability' => 1,
        'barcode' => NULL,
        'codetnved' => NULL,
        'warranty' => NULL,
        'price_sale' => NULL,
        'price_sale_date' => NULL,
        'price_sale_date_begin' => NULL,
        'price_usd' => NULL,
        'price_eur' => NULL,
        'hit' => 1,
        'super_price' => 1,
        'garanty_24' => 1,
        'free_delivery' => 1,
        'code_product' => NULL,
        'nds' => 0,
        'google_shooping' => 0
    ),

    'fieldMeta' => array(
        'availability' => array(
            'dbtype' => 'tinyint',
            'precision' => '1',
            'attributes' => 'unsigned',
            'phptype' => 'boolean',
            'null' => false,
            'default' => 1
        ),
        'barcode' => array(
            'dbtype' => 'varchar',
            'precision' => '255',
            'phptype' => 'string',
            'null' => true,
            'default' => 1,
        ),
        'codetnved' => array(
            'dbtype' => 'varchar',
            'precision' => '255',
            'phptype' => 'string',
            'null' => true,
            'default' => 1,
        ),
        'warranty' => array(
            'dbtype' => 'varchar',
            'precision' => '255',
            'phptype' => 'string',
            'null' => true,
            'default' => '',
        ),
        'price_sale' => array(
            'dbtype' => 'decimal',
            'precision' => '12,2',
            'phptype' => 'float',
            'null' => true,
            'default' => 0,
        ),
        'price_sale_date' => array(
            'dbtype' => 'varchar',
            'precision' => '255',
            'phptype' => 'string',
            'null' => true,
            'default' => '',
        ),
        'price_sale_date_begin' => array(
            'dbtype' => 'varchar',
            'precision' => '255',
            'phptype' => 'string',
            'null' => true,
            'default' => '',
        ),
        'price_usd' => array(
            'dbtype' => 'varchar',
            'precision' => '255',
            'phptype' => 'string',
            'null' => true,
            'default' => '',
        ),
        'price_eur' => array(
            'dbtype' => 'varchar',
            'precision' => '255',
            'phptype' => 'string',
            'null' => true,
            'default' => '',
        ),
        'hit' => array(
            'dbtype' => 'tinyint',
            'precision' => '1',
            'attributes' => 'unsigned',
            'phptype' => 'boolean',
            'null' => false,
            'default' => 0
        ),
        'super_price' => array(
            'dbtype' => 'tinyint',
            'precision' => '1',
            'attributes' => 'unsigned',
            'phptype' => 'boolean',
            'null' => false,
            'default' => 0
        ),
        'garanty_24' => array(
            'dbtype' => 'tinyint',
            'precision' => '1',
            'attributes' => 'unsigned',
            'phptype' => 'boolean',
            'null' => false,
            'default' => 0
        ),
        'free_delivery' => array(
            'dbtype' => 'tinyint',
            'precision' => '1',
            'attributes' => 'unsigned',
            'phptype' => 'boolean',
            'null' => false,
            'default' => 0
        ),
        'code_product' => array(
            'dbtype' => 'varchar'
            ,'precision' => '50'
            ,'phptype' => 'string'
            ,'null' => true
            ,'default' => NULL
        ),
        'nds' => array(
            'dbtype' => 'tinyint',
            'precision' => '1',
            'attributes' => 'unsigned',
            'phptype' => 'boolean',
            'null' => false,
            'default' => 0
        ),
        'google_shooping' => array(
            'dbtype' => 'tinyint',
            'precision' => '1',
            'attributes' => 'unsigned',
            'phptype' => 'boolean',
            'null' => false,
            'default' => 1
        ),
    )
);