<div class="row">
  <div class="title">
    <div class="number">
      {$_modx->lexicon('checkout_success_your_order')} № [[+num]]
    </div>
    <div class="date">
      [[+createdon]]
    </div>
    <div class="price">
      {$_modx->lexicon('checkout_success_total_sum')}: <b>[[+cost]] грн</b>
    </div>
  </div>
  <ul class="orderlist">
    [[msOrdersProducts? &order=`[[+id]]` &tpl=`tplOrderRow` &tpl_empty=`tplOrderRowEmpty`]]
  </ul>
</div>