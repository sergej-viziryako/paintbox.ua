<?php
switch ($modx->event->name) {
  case 'msOnBeforeCreateOrder':
    $address = $msOrder->getOne('Address');
    $properties = array();
    foreach ($_POST as $key => $value){
      if (strpos($key,'extfld_') !== false){
        $properties[$key] = htmlentities($value,ENT_COMPAT | ENT_HTML401,'UTF-8');
      }
    }
    if (count($properties) > 0){
      $address->set('properties', json_encode($properties));
    }
    break;

  case 'msOnManagerCustomCssJs':
    if ($page != 'orders') return;
    $modx->controller->addHtml("
            <script type='text/javascript'>
                Ext.ComponentMgr.onAvailable('minishop2-window-order-update', function(){
                	if (miniShop2.config['order_address_fields'].in_array('properties')){
                		if (this.record.addr_properties){
                		    var key;
                			for (key in this.record.addr_properties) {
                				this.fields.items[2].items.push(
                					{
                						xtype: 'displayfield',
                						name: 'addr_properties_'+key,
                						fieldLabel: _('ms2_properties_'+key),
                						anchor: '100%',
                						style: 'border:1px solid #efefef;width:95%;padding:5px;',
                						html: this.record.addr_properties[key]
                					}
                				);
                			}
                		}		
                	}
                });                
            </script>");
    break;
}