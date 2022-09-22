<div id="msMiniCart" class="block basket-block {$total_count > 0 ? 'full' : ''}">
  <span class="pagelinks basket empty">
    <i class="icon icon-shopping-bag"></i>
    <span>{$_modx->lexicon('cart_buton')}</span>
    <span class="number ms2_total_count">{$total_count}</span>
  </span>
  <a href="{$_modx->makeUrl(140)}" class="pagelinks basket not_empty active">
    <i class="icon icon-shopping-bag"></i>
    <span>{$_modx->lexicon('cart_buton')}</span>
    <span class="number ms2_total_count">{$total_count}</span>
  </a>
</div>