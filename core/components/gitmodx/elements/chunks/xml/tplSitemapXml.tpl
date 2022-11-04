{if $id == 1}
{set $changefreq = 'always'}
{set $prior = '1'}
{elseif $class_key == 'msCategory'}
{set $changefreq = 'daily'}
{set $prior = '0.8'}
{elseif $class_key == 'msProduct'}
{set $changefreq = 'weekly'}
{set $prior = '0.7'}
{else}
{set $changefreq = 'monthly'}
{set $prior = '0.4'}
{/if}
{var $valid_local_pagetitle = $_modx->runSnippet( 'getValidLocalizator', [ 'resource_id' => "{$id}" ] )}
<url>
<loc>{$_modx->config['site_url']}{if $id != 1}{$alias}{/if}</loc>
<xhtml:link rel="alternate" hreflang="uk" href="{$_modx->config['site_url']}{if $id != 1}{$alias}{/if}"/>
{if $valid_local_pagetitle}
<xhtml:link rel="alternate" hreflang="ru" href="{$_modx->config['site_url']}ru/{if $id != 1}{$alias}{/if}"/>
{/if}
{if $editedon | date_format:"%Y-%m-%d" == '1970-01-01'}
<lastmod>{$publishedon | date_format:"%Y-%m-%d"}</lastmod>
{else}
<lastmod>{$editedon | date_format:"%Y-%m-%d"}</lastmod>
{/if}
</url>