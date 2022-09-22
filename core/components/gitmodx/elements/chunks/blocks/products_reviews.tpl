<section class="section- section-comments" id="see-reviews">
  <div class="container">
    {set $get_last_ticket = $_modx->runSnippet('!pdoPage',
    [
    'element' => 'getComments',
    'parents' => "{$_modx->resource.id}",
    'tpl' => 'tplTicketsCommentCategory',
    'depth' => 4,
    'tvPrefix' => '',
    'limit' => 9,
    'includeContent' => 1
    ]
    )}
    {if $get_last_ticket?}
      <div class="section-caption">
        <div class="caption">
          <span>{$_modx->lexicon('reviews_by_table_desc')}</span>
        </div>
      </div>
      <div class="content">
        {$get_last_ticket}
      </div>
    {/if}
  </div>
</section>