{$_modx->lexicon->load(('cultureKey' | option) ~ ':localizator:site')}
{set $ticketview = $_modx->runSnippet('!ticketView', ['id' => "{$id}"])}
{$_modx->runSnippet('!getRaitingViewId',['id' => "{$id}"])}
<li data-aos="zoom-in-up" {if $availability == 0 OR $price == 0}class="notavailable block-favorite-item"{else}class="block-favorite-item"{/if}>
  <div class="inner">
    <a href="#" class="delete msFavoriterToggle {(!$.session.msFavoriter[$id]) ?: 'active'}" data-id="{$id}">
      <i class="icon-cancel"></i>
    </a>
    <div class="feature-block scrollbar-dynamic">
      <div class="feature">
        <div class="row">
            {set $desc = $introtext?:$content}
            {if $desc?}
                {$desc | notags | truncate : 130}
            {/if}
        </div>
          {include 'base_characteristics_output'}
          {$_modx->runSnippet('msProductOptions',['product'=> "{$id}",'tpl'=>'tplMsProductOptionsMin'])}
      </div>
    </div>
    <a href="{$id | url}" class="img">
      <span class="video-block">
        {if $video?}
          <span class="video">
            <i class="icon-next-2"></i>
          </span>
        {/if}
          {include 'tooltip_block'}
      </span>
        {include 'status_block'}
        {if $small?}
          <img class="lazy" data-src="{$small}" alt="">
        {else}
          <span class="img img-empty">
          <i class="icon-picture"></i>
        </span>
        {/if}
    </a>
    <div class="block links-block">
      <ul class="links">
        {'!AddComparison' | snippet : ['list_id' => 29103, 'id' => "{$id}", 'tpl' => 'tplComparisonaddSite', 'minItems' => 7]}
        <li class="msFavoriterToggle {(!$.session.msFavoriter[$id]) ?: 'active'}" data-id="{$id}">
          <a href="#">
            <i class="icon-heart"></i>
          </a>
        </li>
        <li>
          <a href="{$id | url}#reviews">
            <i class="icon-speech-bubble-5"></i>
            <span>{$ticketview == ''? '0': $ticketview }</span>
          </a>
        </li>
        <li>
          <a href="{$id | url}#reviews">
            <i class="icon-star"></i>
            <span>{$raiting = $_modx->getPlaceholder('aggregate_raiting')}</span>
          </a>
        </li>
      </ul>
    </div>
    <div class="text">
      <a href="{$id | url}" class="caption">{$pagetitle}</a>
      <div class="block vendor-avail-block">
        <div class="vendor-block">
          {if $article?}
            <div class="vendor">
              {$_modx->lexicon('article')}: <span>{$article}</span>
            </div>
          {/if}
        </div>
        <div class="avail-block">
          <div class="avail">
              {if $availability? AND $price > 0}
                <i class="icon-checked-1"></i>
                <span>{$_modx->lexicon('available')}</span>
              {else}
                <span>{$_modx->lexicon('not_available')}</span>
              {/if}
          </div>
        </div>
      </div>
      <div class="description">
        <p>{$desc | notags | truncate : 100}</p>
        <span class="more">
          <i class="icon-information"></i>
          <i class="icon-cancel"></i>
        </span>
      </div>
      <form method="post" class="ms2_form -form buy-form">
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
            {if $availability? AND $price > 0}
              <input type="hidden" name="id" value="{$id}"/>
              <input type="hidden" name="count" value="1"/>
              <div class="buy-block">
                <button type="submit" class="buy" name="ms2_action" value="cart/add">
                  <span>{$_modx->lexicon('buy_button')}</span>
                </button>
              </div>
            {/if}
        </div>
      </form>
    </div>
  </div>
</li>