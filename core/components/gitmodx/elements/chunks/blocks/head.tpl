<head>
<base href="{$_modx->config.site_url}" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
{if $_modx->resource.template == 20}
{insert 'metaTagsForProducts'}
{elseif $_modx->resource.template in list [24,37]}
{insert 'metaTagsForCategories'}
{else}
{if $_modx->config.cultureKey == 'ru'}
  <title>{$_modx->resource.metaTitle?:$_modx->resource.pagetitle}</title>
  <meta name="description" content="{$_modx->resource.metaDescription?:$_modx->resource.pagetitle}" />
  <meta name="keywords" content="{$_modx->resource.metaKeywords?:$_modx->resource.pagetitle}" />
{/if}
{if $_modx->config.cultureKey == 'ua'}
  <title>{$_modx->resource.metaTitleUa?:$_modx->resource.pagetitle}</title>
  <meta name="description" content="{$_modx->resource.metaDescriptionUa?:$_modx->resource.pagetitle}" />
  <meta name="keywords" content="{$_modx->resource.metaKeywordsUa?:$_modx->resource.pagetitle}" />
{/if}
{/if}
<link rel="preload" href="/tpl/fonts/Commissioner-Light.woff" as="font" type="font/woff" crossorigin="anonymous">
<link rel="preload" href="/tpl/fonts/Commissioner-Medium.woff" as="font" type="font/woff" crossorigin="anonymous">
<link rel="preload" href="/tpl/fonts/Commissioner-Bold.woff" as="font" type="font/woff" crossorigin="anonymous">
<link rel="preload" href="/tpl/fonts/Commissioner-Regular.woff" as="font" type="font/woff" crossorigin="anonymous">
<link rel="preload" href="/tpl/fonts/icomoon.ttf?4kmysk" as="font" type="font/ttf" crossorigin="anonymous">
<link rel="icon" type="image/vnd.microsoft.icon" href="/tpl/images/favicon.ico">
<link rel="SHORTCUT ICON" href="/tpl/images/favicon.ico">
  <link media="all" rel="stylesheet" href="{$_modx->runSnippet('modxMinify',['group' => 'main'])}">
{if $_modx->getPlaceholder('check_user') == 0}
  <link media="all" rel="stylesheet" href="{$_modx->runSnippet('fileversion',['input' => '/tpl/css/engine.css'])}">
{/if}

{*<script src="/tpl/js/jquery/3.2.1/jquery.min.js" ></script>
<script>window.jQuery || document.write('<script src="/tpl/js/jquery-3.2.1.min.js"><\/script>')</script>
<script src="{$_modx->runSnippet('fileversion',['input' => '/tpl/js/jquery.main.js'])}" ></script>
<script src="{$_modx->runSnippet('fileversion',['input' => '/tpl/js/jquery.engine.js'])}" ></script>
<script src="{$_modx->runSnippet('fileversion',['input' => '/tpl/js/favoriter.js'])}"></script>
<script src="{$_modx->runSnippet('fileversion',['input' => '/tpl/js/lang.js'])}"></script>*}
{if $_modx->resource.id in list [140,141,161,403,405,406,29103]}
<meta name="robots" content="noindex, nofollow" />
{/if}
{if $_modx->resource.id == 29284 AND $_modx->config.cultureKey != 'ru'}
<meta name="robots" content="noindex, nofollow" />
{/if}
{var $key_noindex_msoption = ''}
{foreach $.get as $key_item => $value}
{if 'msoption' | in : $key_item}
  {var $key_noindex_msoption = 'msoption'}
{/if}
{/foreach}
{if $.get.sort != '' OR $.get.vendor != '' OR $key_noindex_msoption != ''}
<meta name="robots" content="noindex, nofollow" />
{/if}
{'!hreflangs' | snippet}
{insert 'canonical'}
{insert 'product_schema_org'}
{insert 'og_markup'}
{insert 'organization_schema'}
{*if $_modx->resource.template in list [24,37]}
{insert 'category_markup'}
{/if*}
{if $_modx->resource.parent in list [162]}
{insert 'article_schema'}
{/if}

{if $_modx->config.head_scripts?}
{ignore}
  {$_modx->config.head_scripts}
{/ignore}
{/if}

{if $_modx->config.permissions?}
{$_modx->config.permissions}
{/if}
</head>