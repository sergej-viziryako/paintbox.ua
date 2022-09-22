{set $site_address = $_modx->config.site_url | replace:'/ua/':'/'}
{if $_modx->resource.template == 20}
    {if $_modx->config.cultureKey == 'ru'}
      <meta property="og:title" content="{$_modx->resource.metaTitle?:$_modx->resource.pagetitle}">
        {set $photo = $site_address ~ $_modx->runSnippet('!msGallery',['limit' => 1, 'tpl'=>'tplMsGalleryOnePhoto'])}
      <meta property="og:image" content="{$photo | replace : "//assets" : "/assets"}">
      <meta property="og:type" content="website">
      <meta property="og:description" content="{$_modx->resource.metaDescription?:$_modx->resource.pagetitle}">
    {/if}
    {if $_modx->config.cultureKey == 'ua'}
      <meta property="og:title" content="{$_modx->resource.metaTitleUA?:$_modx->resource.pagetitle}">
        {set $photo = $site_address ~ $_modx->runSnippet('!msGallery',['limit' => 1, 'tpl'=>'tplMsGalleryOnePhoto'])}
      <meta property="og:image" content="{$photo | replace : "//assets" : "/assets"}">
      <meta property="og:type" content="website">
      <meta property="og:description" content="{$_modx->resource.metaDescriptionUA?:$_modx->resource.pagetitle}">
    {/if}
{else}
    {if $_modx->config.cultureKey == 'ru'}
      <meta property="og:title" content="{$_modx->resource.metaTitle?:$_modx->resource.pagetitle}">
      <meta property="og:image" content="{$site_address}files/{$_modx->config.sitePicture}">
      <meta property="og:type" content="website">
        {if $_modx->resource.template == 1}
          <meta property="og:url" content="{$_modx->config.site_url}">
        {else}
          <meta property="og:url" content="{$_modx->config.site_url}{$_modx->makeUrl($_modx->resource.id)}">
        {/if}
      <meta property="og:description" content="{$_modx->resource.metaDescription?:$_modx->resource.pagetitle}">
    {/if}
    {if $_modx->config.cultureKey == 'ua'}
      <meta property="og:title" content="{$_modx->resource.metaTitleUA?:$_modx->resource.pagetitle}">
      <meta property="og:image" content="{$site_address}files/{$_modx->config.sitePicture}">
      <meta property="og:type" content="website">
        {if $_modx->resource.template == 1}
          <meta property="og:url" content="{$_modx->config.site_url}">
        {else}
          <meta property="og:url" content="{$_modx->config.site_url}{$_modx->makeUrl($_modx->resource.id)}">
        {/if}
      <meta property="og:description" content="{$_modx->resource.metaDescriptionUA?:$_modx->resource.pagetitle}">
    {/if}
{/if}