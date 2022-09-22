{if 'standard' | mobiledetect?}
	{set $items_on_category_page = 10}
{else}
	{set $items_on_category_page = 5}
{/if}

{if $_modx->config.cultureKey != 'ru'}
	{set $other_items = $_modx->runSnippet(
	'msProducts',
	[
	'tpl'=>'tplProduct',
	'includeThumbs' => 'small,small_mobile',
	'parents' => "{$_modx->resource.parent}",
	'resources' => "-{$_modx->resource.id}",
	'includeTVs' => 'video',
	'sortby' => 'RAND()',
	'depth' => 1,
	'showLog' => 0,
	'limit' => "{$items_on_category_page}",
	'includeContent' => 1,
	'showZeroPrice' => 0,
	'leftJoin' => '{"localizator" : {"class" : "localizatorContent","alias" : "localizator","on" : "localizator.resource_id = msProduct.id"}}',
	'select' => '{ "localizator" : "msProduct.*, localizator.*, msProduct.id" }',
	'where' => '{ "localizator.key" : "' ~ ('localizator_key' | option) ~ '","Data.availability":"1"}',
	]
	)}
{else}
	{set $other_items = $_modx->runSnippet(
	'msProducts',
	[
	'tpl'=>'tplProduct',
	'includeThumbs' => 'small,small_mobile',
	'parents' => "{$_modx->resource.parent}",
	'resources' => "-{$_modx->resource.id}",
	'includeTVs' => 'video',
	'sortby' => 'RAND()',
	'depth' => 1,
	'showLog' => 0,
	'limit' => "{$items_on_category_page}",
	'includeContent' => 1,
	'showZeroPrice' => 0,
	'where' => '{"Data.availability":"1"}'
	]
	)}
{/if}
{if $other_items?}
  <section class="section- section-products {if $availability == 0 OR $price == 0}bg-cbg{/if}">
    <div class="container">
      <div class="section-caption">
        <div class="caption">
          <span>{$_modx->lexicon('other_category_items')}</span>
        </div>
      </div>
      <div class="products-block">
        <ul class="products responsive-products">
            {$other_items}
        </ul>
      </div>
    </div>
  </section>
{/if}