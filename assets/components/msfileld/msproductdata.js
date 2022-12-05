miniShop2.plugin.parametr = {
    getFields: function (config) {

        if (config.record.availability === undefined) {
            setTimeout(function() {
                document.getElementById('modx-resource-availability').checked = true;
            }, 0)
        }

        return {
            availability: {
                xtype: 'xcheckbox',
                description: '<b>[[+availability]]</b><br />'+_('ms2_product_availability_help'),
                inputValue: 1,
                checked: parseInt(config.record.availability || 1)
            },
            price_usd: {xtype: 'textfield', description: '<b>[[+price_usd]]</b><br />'+_('ms2_product_price_usd_help')},
            price_eur: {xtype: 'textfield', description: '<b>[[+price_eur]]</b><br />'+_('ms2_product_price_eur_help')},
            barcode: {xtype: 'textfield', description: '<b>[[+barcode]]</b><br />'+_('ms2_product_barcode_help')},
            codetnved: {xtype: 'textfield', description: '<b>[[+codetnved]]</b><br />'+_('ms2_product_codetnved_help')},
            warranty: {xtype: 'textfield', description: '<b>[[+warranty]]</b><br />'+_('ms2_product_warranty_help')},
            price_sale: {xtype: 'textfield', description: '<b>[[+price_sale]]</b><br />'+_('ms2_product_price_sale_help')},
            price_sale_date: {xtype: 'datefield', format: 'd.m.Y', inputMask: '99.99.9999', description: '<b>[[+price_sale_date]]</b><br />'+_('ms2_product_price_sale_date_help')},
            price_sale_date_begin: {xtype: 'datefield', format: 'd.m.Y', inputMask: '99.99.9999', description: '<b>[[+price_sale_date_begin]]</b><br />'+_('ms2_product_price_sale_date_begin_help')},
            //price_sale_date: {xtype: 'minishop2-xdatetime', value: config.record.date_tester, description: '<b>[[+price_sale_date]]</b><br />'+_('ms2_product_price_sale_date_help')}
            hit: {xtype: 'xcheckbox',  description: '<b>[[+hit]]</b><br />'+_('ms2_product_hit_help'),inputValue: 0,checked: parseInt(config.record.hit || 0)},
            super_price: {xtype: 'xcheckbox',  description: '<b>[[+super_price]]</b><br />'+_('ms2_product_super_price_help'),inputValue: 0,checked: parseInt(config.record.super_price || 0)},
            garanty_24: {xtype: 'xcheckbox',  description: '<b>[[+garanty_24]]</b><br />'+_('ms2_product_garanty_24_help'),inputValue: 0,checked: parseInt(config.record.garanty_24 || 0)},
            free_delivery: {xtype: 'xcheckbox',  description: '<b>[[+free_delivery]]</b><br />'+_('ms2_product_free_delivery_help'),inputValue: 0,checked: parseInt(config.record.free_delivery || 0)},
            code_product: {xtype: 'textfield', description: '<b></b><br />'+_('ms2_product_code_product_help')},
            nds: {xtype: 'xcheckbox',  description: '<b>[[+nds]]</b><br />'+_('ms2_product_nds_help'),inputValue: 0,checked: parseInt(config.record.nds || 0)},
            google_shooping: {xtype: 'xcheckbox',  description: '<b>[[+google_shooping]]</b><br />'+_('ms2_product_google_shooping_help'),inputValue: 0,checked: parseInt(config.record.nds || 0)}
        }
    }
    ,getColumns: function () {
        return {
            availability: {
                width:50,
                sortable:true,
                editor: {xtype:'combo-boolean', renderer:'boolean'}
            },
            price_usd: {width:45, sortable:false, editor: {xtype:'textfield', name: 'price_usd'}},
            price_eur: {width:45, sortable:false, editor: {xtype:'textfield', name: 'price_opt'}},
            barcode: {width:45, sortable:false, editor: {xtype:'textfield', name: 'barcode'}},
            codetnved: {width:45, sortable:false, editor: {xtype:'textfield', name: 'codetnved'}},
            warranty: {width:45, sortable:false, editor: {xtype:'textfield', name: 'warranty'}},
            price_sale: {width:45, sortable:false, editor: {xtype:'textfield', name: 'price_sale'}},
            price_sale_date: {width:45, sortable:false, editor: {xtype:'datefield', name: 'price_sale_date'}},
            price_sale_date_begin: {width:45, sortable:false, editor: {xtype:'datefield', name: 'price_sale_date_begin'}},
            //price_sale_date: {width:45, sortable:false, editor: {xtype:'minishop2-xdatetime', name: 'price_sale_date'}}
            hit: {width:50, sortable:true, editor: {xtype:'combo-boolean', renderer:'boolean'}},
            super_price: {width:50, sortable:true, editor: {xtype:'combo-boolean', renderer:'boolean'}},
            garanty_24: {width:50, sortable:true, editor: {xtype:'combo-boolean', renderer:'boolean'}},
            free_delivery: {width:50, sortable:true, editor: {xtype:'combo-boolean', renderer:'boolean'}},
            code_product: {width:45, sortable:false, editor: {xtype:'textfield', name: 'code_product'}},
            nds: {width:50, sortable:true, editor: {xtype:'combo-boolean', renderer:'boolean'}},
            google_shooping: {width:50, sortable:true, editor: {xtype:'combo-boolean', renderer:'boolean'}},

        }
    }
};