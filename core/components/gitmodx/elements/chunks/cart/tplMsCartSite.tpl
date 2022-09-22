<ul class="msCart inbasket" id="msCart">
  {foreach $products as $product}
    {set $item_pagetitle = $_modx->runSnippet('!getContentLanguage', ['id' => "{$product.id}",'content' =>'pagetitle' ])}
    <li id="{$product.key}">
      <a href="{$product.id | url}" class="img">
        {if $product.thumb?}
          <img src="{$product.thumb}" alt="{$item_pagetitle}" title="{$item_pagetitle}"/>
        {else}
          <span class="img img-empty">
            <i class="icon-picture"></i>
          </span>
        {/if}
      </a>
      <div class="text">
        <a href="{$product.id | url}" class="caption">
          {$item_pagetitle}
        </a>
        <div class="description-block">
          <div class="description">
            {if $product.article?}
              <p>{$_modx->lexicon('article')}: {$product.article}</p>
            {/if}
            {if $product.options?}
              <p>{$_modx->lexicon('options')}: {$product.options | join : '; '}</p>
            {/if}
          </div>
        </div>
        <div class="price-number-amount-block">
          <div class="price-block">
              {if $product.old_price}
                <div class="price old">
                  <span>{$product.old_price} грн</span>
                </div>
              {/if}
            <div class="price"><span>{$product.price}</span> грн</div>
          </div>
          <div class="number-block">
            <span>{$_modx->lexicon('cart_count')}:</span>
            <div class="number quantity">
              <form method="post" class="ms2_form" role="form" style="display: inline;">
                <input type="hidden" name="key" value="{$product.key}"/>
                <input type="number" name="count" value="{$product.count}" min="1" class="numeral"/>
                <button style="display: none" class="btn btn-default" type="submit" name="ms2_action" value="cart/change"></button>
              </form>
            </div>
          </div>
          <div class="amount-block">
            <div class="amount">{$_modx->lexicon('checkout_success_total_sum')}: <b class="cart_row_price_sum"><span class="ms2_cost">{$product.cost}</span> грн</b></div>
          </div>
        </div>
      </div>
      <form method="post" class="ms2_form delete-form">
        <input type="hidden" name="key" value="{$product.key}">
        <fieldset>
          <div class="row">
            <button class="delete" type="submit" name="ms2_action"  value="cart/remove">
              <i class="icon-cancel"></i>
            </button>
          </div>
        </fieldset>
      </form>
    </li>
  {/foreach}
</ul>
<div class="summa-order">
  <span>{$_modx->lexicon('total_sum_order')}:</span>
  <span class="allprice"><span class="ms2_total_cost">{$total.cost}</span> грн</span>
</div>