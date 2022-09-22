<?php
$controller->addHtml("<script>
    Ext.ComponentMgr.onAvailable('minishop2-window-order-update', function () {
        var w = this;
        var order_id = w.record['id'] || 0;
        w['buttonAlign'] = 'left';
        w['buttons'].unshift({
            id: w['id'] + '-button-check',
            text: 'Распечатать',
            cls: 'primary-button',
            handler: function (btn) {
                window.open('/assets/custom/ms2print.php?order=' + order_id, '_blank').focus();
            },
            scope: w,
        }, '->');
    });
</script>");