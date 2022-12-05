Ext.ComponentMgr.onAvailable('minishop2-window-order-update', function(){
    this.fields.items[0].items[2].items[1].items[1].xtype = 'textfield'; //меняем тип поля с diaplayfield на textfield
    //добавляем кнопку "сохранить"
    this.fields.items[0].items[2].items[1].items.push({
        xtype: 'button',
        name: 'no_rec',
        fieldLabel: '',
        anchor: '100%',
        text: '<i class="icon icon-refresh"></i> Сохранить',
        handler: function() {
            var url = window.location.href; //сохраняем текущий урл
            Ext.getCmp('minishop2-window-order-update').submit(); //сохраняем текущий заказ
            setTimeout(function() {
                window.location.href = url; //перезагружаем страницу по предыдущему урлу что откроет перед нами это же окно заказа
            }, 1000)
        }
    });
});