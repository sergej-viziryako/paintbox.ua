{var $getItemsCount = $_modx->runSnippet('getCategoryItemsCount', ['parents' => $_modx->resource.id, 'depth' => 1, 'where' => '{"template":"20","Data.availability":"1"}'])}
{var $minPrice = $_modx->runSnippet('msProducts',['parents'=>$_modx->resource.id, 'limit' => 1, 'tpl' => '@INLINE {$price}', 'depth' => 1, 'sortby' => 'Data.price', 'sortdir' => 'ASC', 'showZeroPrice' => 0, 'where' => '{"template":"20","Data.availability":"1"}'])}
{var $maxPrice = $_modx->runSnippet('msProducts',['parents'=>$_modx->resource.id, 'limit' => 1, 'tpl' => '@INLINE {$price}', 'depth' => 1, 'sortby' => 'Data.price', 'sortdir' => 'DESC', 'showZeroPrice' => 0, 'where' => '{"template":"20","Data.availability":"1"}'])}
{set $minPrice = $minPrice | strip : true}
{set $maxPrice = $maxPrice | strip : true}
{if $_modx->config.cultureKey != 'ru'}
  {set $category_name_ukr = $_modx->runSnippet('!getContentLanguage', ['id' => "{$_modx->resource.id}",'content' =>'pagetitle' ])}
  {if $category_name_ukr ==''}
      {set $category_name_ukr = $_modx->resource.pagetitle}
  {/if}
  {set $title = $_modx->resource.metaTitleUa?:$_modx->config.titleDefaultCategoryTemplateUA}
  {set $title = $_modx->runSnippet('replaceVariablesMetatagsCategory', ['string' => "{$title}",
  'name' => "{$category_name_ukr}",
  'count' => "{$getItemsCount}",
  'min_price' => "{$minPrice}",
  'max_price' => "{$maxPrice}"])}
  {set $description = $_modx->resource.metaDescriptionUa?:$_modx->config.descriptionDefaultCategoryTemplateUA}
  {set $description = $_modx->runSnippet('replaceVariablesMetatagsCategory', ['string' => "{$description}",
  'name' => "{$category_name_ukr}",
  'count' => "{$getItemsCount}",
  'min_price' => "{$minPrice}",
  'max_price' => "{$maxPrice}"])}
  {set $keywords = $_modx->resource.metaKeywordsUa?:$_modx->config.keywordsDefaultCategoryTemplateUA}
  {set $keywords = $_modx->runSnippet('replaceVariablesMetatagsCategory', ['string' => "{$keywords}",
  'name' => "{$category_name_ukr}",
  'count' => "{$getItemsCount}",
  'min_price' => "{$minPrice}",
  'max_price' => "{$maxPrice}"])}
  {set $gen_title = $title?:$_modx->resource.pagetitle}
  {set $gen_description = $description?:$_modx->resource.pagetitle}
  {set $gen_keywords = $keywords?:$_modx->resource.pagetitle}

  <title>{$gen_title}</title>
  <meta name="description" content="{$gen_description | replace:"\"":""}" />
  <meta name="keywords" content="{$gen_keywords | replace:"\"":""}" />
{else}
  {set $title = $_modx->resource.metaTitle?:$_modx->config.titleDefaultCategoryTemplate}
  {set $title = $_modx->runSnippet('replaceVariablesMetatagsCategory', ['string' => "{$title}",
  'name' => "{$_modx->resource.pagetitle}",
  'count' => "{$getItemsCount}",
  'min_price' => "{$minPrice}",
  'max_price' => "{$maxPrice}"])}
  {set $description = $_modx->resource.metaDescription?:$_modx->config.descriptionDefaultCategoryTemplate}
  {set $description = $_modx->runSnippet('replaceVariablesMetatagsCategory', ['string' => "{$description}",
  'name' => "{$_modx->resource.pagetitle}",
  'count' => "{$getItemsCount}",
  'min_price' => "{$minPrice}",
  'max_price' => "{$maxPrice}"])}
  {set $keywords = $_modx->resource.metaKeywords?:$_modx->config.keywordsDefaultCategryTemplate}
  {set $keywords = $_modx->runSnippet('replaceVariablesMetatagsCategory', ['string' => "{$keywords}",
  'name' => "{$_modx->resource.pagetitle}",
  'count' => "{$getItemsCount}",
  'min_price' => "{$minPrice}",
  'max_price' => "{$maxPrice}"])}
  {set $gen_title = $title?:$_modx->resource.pagetitle}
  {set $gen_description = $description?:$_modx->resource.pagetitle}
  {set $gen_keywords = $keywords?:$_modx->resource.pagetitle}

  <title>{$gen_title | replace:"\"":""}</title>
  <meta name="description" content="{$gen_description | replace:"\"":""}" />
  <meta name="keywords" content="{$gen_keywords | replace:"\"":""}" />
{/if}