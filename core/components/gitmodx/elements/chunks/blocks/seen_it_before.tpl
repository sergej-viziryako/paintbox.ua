{$_modx->runSnippet('!addLooked', ['templates'=>20, 'limit' => 10])}
{if $_modx->config.cultureKey != 'ru'}
  {set $lookedproducts = $_modx->runSnippet(
  'looked',
    [
    'snippet' => 'msProducts',
    'includeThumbs' => 'small,small_mobile',
    'includeTVs' => 'video',
    'tpl' => 'tplProduct',
    'limit' => 10,
    'includeContent' => 1,
    'leftJoin' => '{"localizator" : {"class" : "localizatorContent","alias" : "localizator","on" : "localizator.resource_id = msProduct.id"}}',
    'select' => '{ "localizator" : "msProduct.*, localizator.*, msProduct.id" }',
    'where' => '{ "localizator.key" : "' ~ ('localizator_key' | option) ~ '"}'
    ]
  )}
{else}
  {set $lookedproducts = $_modx->runSnippet(
  'looked',
    [
    'snippet' => 'msProducts',
    'includeTVs' => 'video',
    'includeThumbs' => 'small,small_mobile',
    'tpl' => 'tplProduct',
    'includeContent' => 1,
    'limit' => 10
    ]
  )}
{/if}
{if $lookedproducts?}
  <section class="section- section-products bg-cbg">
    <div class="container">
      <div class="section-caption">
        <div class="caption">
          <span>{$_modx->lexicon('you_seen_it_before')}:</span>
        </div>
      </div>
      <div class="products-block">
        <ul class="products responsive-products">
          {$lookedproducts}
        </ul>
      </div>
    </div>
  </section>
{/if}