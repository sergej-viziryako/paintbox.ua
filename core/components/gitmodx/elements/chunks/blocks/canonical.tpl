{if $_modx->resource.id == 1}
  <link rel="canonical" href="{$_modx->config.site_url}"/>
{else}
  <link rel="canonical" href="{$_modx->config.site_url}{$_modx->makeUrl($_modx->resource.id)}"/>
{/if}