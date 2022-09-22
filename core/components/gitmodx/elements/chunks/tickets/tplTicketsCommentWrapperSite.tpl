{set $ticketcount = $_modx->runSnippet('!ticketView', ['id' => "{$_modx->resource.id}"])}

<div class="column column70">
  {if $ticketcount == 0}
    <div class="page404-block">
      <div class="page404">
        <div class="img">
          <i class="icon-earth-globe1"></i>
        </div>
        <div class="text">
          <div class="caption">{$_modx->lexicon('no_reviews_title')}</div>
          <p>{$_modx->lexicon('no_reviews_desc')}</p>
        </div>
      </div>
    </div>
  {/if}
  <div class="reviews-block">
    <ul class="reviews">
      {$comments}
    </ul>
  </div>
  <div class="pagination-block">
    <ul class="pagination">
    </ul>
  </div>
</div>