<li class="comparison-head" data-id="[[+id]]" data-list="[[+list]]" >
    <a href="#" class="delete comparison-remove comparison-link" data-text="">
        <i class="icon-cancel"></i>
    </a>
    <div class="inner">
        <a href="{$_modx->makeUrl($id)}" class="img">
            {include 'status_block'}
            {if $thumb?}
            <img class="lazy" src="{$thumb}" alt="{$pagetitle}" title="{$pagetitle}"/>
            {else}
            <span class="img img-empty">
                    <i class="icon-picture"></i>
                </span>
            {/if}
        </a>
        <div class="text">
            {set $item_pagetitle = $_modx->runSnippet('!getContentLanguage', ['id' => "{$id}",'content' =>'pagetitle' ])}
            <a href="{$_modx->makeUrl($id)}" class="caption">{$item_pagetitle}</a>
            <div class="block vendor-avail-block">
                <div class="vendor-block">
                    {if $article?}
                        <div class="vendor">
                            {$_modx->lexicon('article')}: <span>{$article}</span>
                        </div>
                    {/if}
                </div>
            </div>
            <form method="post" class="ms2_form -form buy-form">
                <input type="hidden" name="id" value="{$id}"/>
                <div class="block price-number-buy-block">
                    <div class="price-block">
                        {if $price > 0}
                        {if $old_price? AND $old_price > $price}
                        <div class="price old">
                            <span>{$old_price} грн</span>
                        </div>
                        {/if}
                        <div class="price">
                            <span>{$price} грн</span>
                        </div>
                        {/if}
                    </div>

                    <div class="number-block">
                        <div class="number quantity">
                            <input class="numeral" name="count" type="number" min="1" step="1" value="1">
                        </div>
                    </div>
                    <div class="buy-block">
                        <button type="submit"  class="buy" name="ms2_action" value="cart/add">
                            <span>{$_modx->lexicon('buy_button')}</span>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</li>

