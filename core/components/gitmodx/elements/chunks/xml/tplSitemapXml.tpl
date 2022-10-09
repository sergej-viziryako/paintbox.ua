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
<url>
    <loc>{$_modx->config['site_url']}{if $id != 1}{$lang}{$id | url}{/if}</loc>
    <lastmod>{$editedon | date_format:"%Y-%m-%d"}</lastmod>
    <changefreq>{$changefreq}</changefreq>
    <priority>{$prior}</priority>
</url>