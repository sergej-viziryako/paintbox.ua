<li>
  {set $item_pagetitle = $_modx->runSnippet('!getContentLanguage', ['id' => "[[+id]]",'content' =>'pagetitle' ])}
  {set $photo = $_modx->runSnippet('getPhotoProduct',['id' => "[[+id]]"])}
  <div class="inner">
    {if $photo?}
      <a href="{[[+id]] | url}" class="img">
        <img src="{$photo}" alt="">
      </a>
    {/if}
    <div class="description">
      <a href="{[[+id]] | url}" class="caption">{$item_pagetitle}</a>
      <div class="price-number-total-block">
        <div class="price-block">
          <div class="price">
            <b>[[+price]]</b> грн
          </div>
        </div>
        <div class="number-block">
          <div class="number">
            {$_modx->lexicon('cart_count')}:
            <b>[[+costOrder]]</b>
          </div>
        </div>
        <div class="total-block">
          <div class="total">
            {$_modx->lexicon('total_sum_order')}:
            <b>[[+costAll]]</b> грн
          </div>
        </div>
      </div>
    </div>
  </div>
</li>


