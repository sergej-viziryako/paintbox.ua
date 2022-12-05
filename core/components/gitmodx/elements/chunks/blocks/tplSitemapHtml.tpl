<li>
    <a href="{$id | url}">{$pagetitle}</a>
    <ul>
        {$_modx->runSnippet(
        'pdoMenu',
        [
        'parents' => "{$id}",
        'templates' => '-20,-45',
        'level' => 1,
        'tpl' => 'tplSitemapHtml',
        'limit' => 0,
        'sortby' => 'pagetitle',
        'sortdir' => 'ASC',
        'cache' => 1,
        'cacheTime' => 3600
        ]
        )}
    </ul>
</li>