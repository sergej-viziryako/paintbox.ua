<section class="section- section-breadcrumbs">
  <div class="container">
      {if $_modx->config.cultureKey != 'ua'}
        {if $_modx->config.first_breadcrumbUA?}
          {set $first_breadcrumb = $_modx->config.first_breadcrumb}
        {else}
          {set $first_breadcrumb = 'Главная'}
        {/if}
        {$_modx->runSnippet(
        'pdoCrumbs',
        [
          'tpl' => '@INLINE <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a rel="{$menutitle}" itemprop="item"  href="{$link}"><span itemprop="name">{$menutitle}</span></a><meta itemprop="position" content="{$idx}" /></li>',
          'tplHome' => '@INLINE <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a rel='~$first_breadcrumb~'  itemprop="item"  href='~$_modx->config.site_url~'><span itemprop="name">'~$first_breadcrumb~'</span><i class="icon-house"></i></a><meta itemprop="position" content="{$idx}" /></li>',
          'tplWrapper' => '@INLINE <ul class="breadcrumbs scrollbar-macosx" itemscope itemtype="https://schema.org/BreadcrumbList">{$output}</ul>',
          'outputSeparator' => '<span>/</span>',
          'tplCurrent' => '@INLINE <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><span itemprop="name">{$menutitle}</span><meta itemprop="position" content="{$idx}" /></li>',
          'showHidden' => 0,
          'showHome' => 1,
          'hideSingle' => 1,
          'leftJoin' => '{"localizator" : {"class" : "localizatorContent","alias" : "localizator","on" :"localizator.resource_id = modResource.id"}}',
          'select' => '{"localizator" : "modResource.*, localizator.*, modResource.id"}',
          'where' => '{"localizator.key" : "'~ ('localizator_key' | option) ~'"}'
        ]
      )}
      {else}
        {if $_modx->config.first_breadcrumb?}
          {set $first_breadcrumb = $_modx->config.first_breadcrumbUA}
        {else}
          {set $first_breadcrumb = 'Головна'}
        {/if}
        {$_modx->runSnippet(
        'pdoCrumbs',
          [
          'tpl' => '@INLINE <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a rel="{$menutitle}" itemprop="item"  href="{$link}"><span itemprop="name">{$menutitle}</span></a><meta itemprop="position" content="{$idx}" /></li>',
          'tplHome' => '@INLINE <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a rel='~$first_breadcrumb~'  itemprop="item"  href='~$_modx->config.site_url~'><span itemprop="name">'~$first_breadcrumb~'</span><i class="icon-house"></i></a><meta itemprop="position" content="{$idx}" /></li>',
          'tplWrapper' => '@INLINE <ul class="breadcrumbs scrollbar-macosx" itemscope itemtype="https://schema.org/BreadcrumbList">{$output}</ul>',
          'outputSeparator' => '<span>/</span>',
          'tplCurrent' => '@INLINE <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><span itemprop="name">{$menutitle}</span><meta itemprop="position" content="{$idx}" /></li>',
          'showHidden' => 0,
          'showHome' => 1,
          'hideSingle' => 1,
          ]
        )}
      {/if}
      {if $_modx->config.cultureKey != 'ua'}
          <h1>{$_modx->resource.h1?:$_modx->resource.pagetitle}</h1>
      {else}
          <h1>{$_modx->resource.h1Ua?:$_modx->resource.pagetitle}</h1>
      {/if}
  </div>
</section>
