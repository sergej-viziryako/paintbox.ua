{if $_modx->config.cultureKey != 'ru'}
    {set $items = $_modx->runSnippet('!pdoMenuFenom',
    [
    'parents' => 29312,
    'level' => 2,
    'templates' => '44',
    'displayStart' => false,
    'toArray' => true,
    'limit' => 0,
    'sortby' => 'menuindex',
    'showHidden' => 0,
    'showUnpublished' => 0,
    'includeTVs' => 'icon',
    'leftJoin' => '{"localizator" : {"class" : "localizatorContent","alias" : "localizator","on" :
        "localizator.resource_id = modResource.id"}}',
    'select' => '{"localizator" : "modResource.*, localizator.*, modResource.id"}',
    'where' => '{"localizator.key" : "'~ ('localizator_key' | option) ~'"}',
    ]
    )}
{else}
    {set $items = $_modx->runSnippet('!pdoMenuFenom', [
    'parents' => 29312,
    'level' => 2,
    'templates' => '44',
    'displayStart' => false,
    'toArray' => true,
    'limit' => 0,
    'sortby' => 'menuindex',
    'showHidden' => 0,
    'showUnpublished' => 0,
    'includeTVs' => 'icon'
    ])}
{/if}
<section class="section- section-category">
	<div class="container">
		<div class="category-block">
			<ul class="category">
				{foreach $items as $item}
					{set $item['level'] = 1}
					{$_modx->getChunk('tplMainPageCatalog', ['item' => $item])}
				{/foreach}
			</ul>
		</div>
	</div>
</section>