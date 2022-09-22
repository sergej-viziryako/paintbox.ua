{if $_modx->config.cultureKey != 'ru'}
    {set $categories = $_modx->runSnippet('!pdoPage',
    [
    'elementClass' => 'modSnippet',
    'parents' => 160,
    'tpl' => 'tplSubCategoriesMainPage',
    'depth' => 0,
    'limit' => 0,
    'templates' => "21,24",
    'includeTVs' => 'icon,img',
    'tvPrefix' => '',
    'sortby' => 'menuindex',
    'sortdir' => 'ASC',
    'includeContent' => 1,
    'leftJoin' => '{"localizator" : {"class" : "localizatorContent","alias" : "localizator","on" :
      "localizator.resource_id = modResource.id"}}',
    'select' => '{"localizator" : "modResource.*, localizator.*, modResource.id"}',
    'where' => '{"localizator.key" : "'~ ('localizator_key' | option) ~'"}',
    ]
    )}
{else}
    {set $categories = $_modx->runSnippet('!pdoPage',
    [
    'elementClass' => 'modSnippet',
    'parents' => 160,
    'tpl' => 'tplSubCategoriesMainPage',
    'depth' => 0,
    'limit' => 0,
    'templates' => "21,24",
    'includeTVs' => 'icon,img',
    'tvPrefix' => '',
    'sortby' => 'menuindex',
    'sortdir' => 'ASC',
    'includeContent' => 1
    ]
    )}
{/if}
{if $categories?}
  <section class="section- section-category-sub">
    <div class="container">
        {if $_modx->resource.id == 1}
          <div class="section-caption">
            <div class="caption">
              <span>{$_modx->lexicon('our_catalog_main')}</span>
            </div>
          </div>
        {/if}
      <div class="category-sub-block">
        <ul class="category-sub">
            {$categories}
        </ul>
      </div>
    </div>
  </section>
{else}
    {include 'category_nothing_found'}
{/if}