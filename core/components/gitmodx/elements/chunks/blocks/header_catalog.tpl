<div class="block catalog-main-block">
  <nav class="catalog-nav accordion-catalog">
    <div class="catalog-hover-block">
      <div class="catalog-link mobile">
        <a href="#" class="open-popup open-catalog">
          <i class="icon icon-book1 tablet"></i>
          <i class="icon icon-search"></i>
            {if $_modx->config.cultureKey != 'ua'}
              <span>{$_modx->config.catalog_name}</span>
            {else}
              <span>{$_modx->config.catalog_nameUA}</span>
            {/if}
          <i class="icon-down-arrow"></i>
        </a>
      </div>
      <div class="catalog-link opener desktop">
        <a href="{$_modx->makeUrl(160)}" class="">
          <i class="icon icon-book1"></i>
            {if $_modx->config.cultureKey != 'ua'}
              <span>{$_modx->config.catalog_name}</span>
            {else}
              <span>{$_modx->config.catalog_nameUA}</span>
            {/if}
          <i class="icon-down-arrow"></i>
        </a>
      </div>
      <div class="catalog-inner-block slide ">
        <div class="catalog-block scrollbar-dynamic">
          <ul class="catalog  accordion-catalog-inner">
            {if $_modx->config.cultureKey != 'ua'}
              {set $items = $_modx->runSnippet('!pdoMenuFenom',
                [
                'parents' => 0,
                'level' => 0,
                'templates' => '21,24,37,42',
                'displayStart' => false,
                'toArray' => true,
                'limit' => 0,
                'sortby' => 'menuindex',
                'showHidden' => 0,
                'showUnpublished' => 0,
                'includeTVs' => 'icon,img',
                'leftJoin' => '{"localizator" : {"class" : "localizatorContent","alias" : "localizator","on" :"localizator.resource_id = modResource.id"}}',
                'select' => '{"localizator" : "modResource.*, localizator.*, modResource.id"}',
                'where' => '{"localizator.key" : "'~ ('localizator_key' | option) ~'"}',
                'innerJoin' => [
                  "Parents" => [
                  "class" => "modResource",
                  "on" => "`modResource`.`parent` = `Parents`.`id` AND `Parents`.`id` IN (SELECT `id` FROM modx_site_content WHERE `id` IN (160) OR `parent` IN (160))",
                  ]
                ],
                ]
              )}
            {else}
              {set $items = $_modx->runSnippet('!pdoMenuFenom', [
                'parents' => 0,
                'level' => 0,
                'templates' => '21,24,37,42',
                'displayStart' => false,
                'toArray' => true,
                'limit' => 0,
                'sortby' => 'menuindex',
                'showHidden' => 0,
                'showUnpublished' => 0,
                'includeTVs' => 'icon,img',
                'innerJoin' => [
                    "Parents" => [
                    "class" => "modResource",
                    "on" => "`modResource`.`parent` = `Parents`.`id` AND `Parents`.`id` IN (SELECT `id` FROM modx_site_content WHERE `id` IN (160) OR `parent` IN (160))",
                    ]
                ],
              ])}
            {/if}
            {foreach $items as $item}
              {set $item['level'] = 1}
              {$_modx->getChunk('tplCategoryMenu', ['item' => $item])}
            {/foreach}
          </ul>
        </div>
      </div>
    </div>
  </nav>
</div>
