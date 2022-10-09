{if $_modx->config.cultureKey != 'ua'}
  {if $availability == 1}
    {var $available = $_modx->lexicon('available')}
  {else}
    {var $available = $_modx->lexicon('not_available')}
  {/if}
  {set $titleTemplate = $_modx->resource.parent | resource : 'metaTitleTemplate'?:$_modx->config.titleDefaultTemplate}
  {set $descriptionTemplate = $_modx->resource.parent | resource : 'metaDescriptionTemplate'?:$_modx->config.descriptionDefaultTemplate}
  {set $keywordsTemplate = $_modx->resource.parent | resource : 'metaKeywordsTemplate'?:$_modx->config.keywordsDefaultTemplate}

  {set $title = $_modx->resource.metaTitle?:$titleTemplate}
  {set $title = $_modx->runSnippet('replaceVariablesMetatags', ['string' => "{$title}",
  'name' => "{$_modx->resource.pagetitle}",
  'parent' => "{$_modx->resource.parent | resource:'pagetitle'}",
  'price' => "{$price}",
  'brand' => "{$_pls['vendor.name']}",
  'available' => "{$available}"])}
  {set $description = $_modx->resource.metaDescription?:$descriptionTemplate}
  {set $description = $_modx->runSnippet('replaceVariablesMetatags', ['string' => "{$description}",
  'name' => "{$_modx->resource.pagetitle}",
  'parent' => "{$_modx->resource.parent | resource:'pagetitle'}",
  'price' => "{$price}",
  'brand' => "{$_pls['vendor.name']}",
  'available' => "{$available}"])}
  {set $keywords = $_modx->resource.metaKeywords?:$keywordsTemplate}
  {set $keywords = $_modx->runSnippet('replaceVariablesMetatags', ['string' => "{$keywords}",
  'name' => "{$_modx->resource.pagetitle}",
  'parent' => "{$_modx->resource.parent | resource:'pagetitle'}",
  'price' => "{$price}",
  'brand' => "{$_pls['vendor.name']}",
  'available' => "{$available}"])}

  {set $gen_title = $title?:$_modx->resource.pagetitle}
  {set $gen_description = $description?:$_modx->resource.pagetitle}
  {set $gen_keywords = $keywords?:$_modx->resource.pagetitle}
  <title>{$gen_title}</title>
  <meta name="description" content="{$gen_description | replace:"\"":""}" />
  <meta name="keywords" content="{$gen_keywords | replace:"\"":""}" />
{else}
  {if $availability == 1}
    {var $available = $_modx->lexicon('available')}
  {else}
    {var $available = $_modx->lexicon('not_available')}
  {/if}
  {set $item_name_ukr = $_modx->runSnippet('!getContentLanguage', ['id' => "{$_modx->resource.id}",'content' =>'pagetitle' ])}
  {if $item_name_ukr ==''}
    {set $item_name_ukr = $_modx->resource.pagetitle}
  {/if}
  {set $item_parent_ukr = $_modx->runSnippet('!getContentLanguage', ['id' => "{$_modx->resource.parent}",'content' =>'pagetitle' ])}
  {set $titleTemplate = $_modx->resource.parent | resource : 'metaTitleTemplateUA'?:$_modx->config.titleDefaultTemplateUA}
  {set $descriptionTemplate = $_modx->resource.parent | resource : 'metaDescriptionTemplateUA'?:$_modx->config.descriptionDefaultTemplateUA}
  {set $keywordsTemplate = $_modx->resource.parent | resource : 'metaKeywordsTemplateUA'?:$_modx->config.keywordsDefaultTemplateUA}

  {set $title = $_modx->resource.metaTitleUa?:$titleTemplate}
  {set $title = $_modx->runSnippet('replaceVariablesMetatags', ['string' => "{$title}",
  'name' => "{$item_name_ukr}",
  'parent' => "{$item_parent_ukr}",
  'price' => "{$price}",
  'brand' => "{$_pls['vendor.name']}",
  'available' => "{$available}"])}
  {set $description = $_modx->resource.metaDescriptionUa?:$descriptionTemplate}
  {set $description = $_modx->runSnippet('replaceVariablesMetatags', ['string' => "{$description}",
  'name' => "{$item_name_ukr}",
  'parent' => "{$item_parent_ukr}",
  'price' => "{$price}",
  'brand' => "{$_pls['vendor.name']}",
  'available' => "{$available}"])}
  {set $keywords = $_modx->resource.metaKeywordsUa?:$keywordsTemplate}
  {set $keywords = $_modx->runSnippet('replaceVariablesMetatags', ['string' => "{$keywords}",
  'name' => "{$item_name_ukr}",
  'parent' => "{$item_parent_ukr}",
  'price' => "{$price}",
  'brand' => "{$_pls['vendor.name']}",
  'available' => "{$available}"])}

  {set $gen_title = $title?:$_modx->resource.pagetitle}
  {set $gen_description = $description?:$_modx->resource.pagetitle}
  {set $gen_keywords = $keywords?:$_modx->resource.pagetitle}

  <title>{$gen_title}</title>
  <meta name="description" content="{$gen_description | replace:"\"":""}" />
  <meta name="keywords" content="{$gen_keywords | replace:"\"":""}" />
{/if}