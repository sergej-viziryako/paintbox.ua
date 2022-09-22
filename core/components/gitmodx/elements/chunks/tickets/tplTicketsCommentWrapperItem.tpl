{set $ticketcount = $_modx->runSnippet('!ticketView', ['id' => "{$_modx->resource.id}"])}
<div class="column column70">
  {if $ticketcount == 0}
    <div class="firstreview">
      <div class="img">
        <i class="icon-chat"></i>
      </div>
      <div class="text">
        <div class="caption">{$_modx->lexicon('no_reviews_item_title')}</div>
        <p>{$_modx->lexicon('no_reviews_item_desc')}</p>
      </div>
    </div>
  {/if}
  <div class="reviews-block">
    <ul class="reviews">
      {$comments}
    </ul>
  </div>
</div>