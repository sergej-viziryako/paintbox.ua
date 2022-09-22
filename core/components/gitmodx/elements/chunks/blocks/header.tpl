<header class="header">
  <section class="section- section-header-menu">
    <div class="container">
      <div class="block menu-block">
        {if $_modx->config.cultureKey != 'ru'}
          {$_modx->runSnippet(
          'pdoMenu',
          [
            'parents' => 2,
            'resources' => "-1",
            'level' => 1,
            'tpl' => 'tplMenu',
            'tplOuter' => '@INLINE <ul class="menu">{$wrapper}</ul>',
            'limit' => 0,
            'cache' => 1,
            'cacheTime' => 3600,
            'includeTVs' => 'button_menu_color',
            'hereClass' => 'active',
            'leftJoin' => '{"localizator" : {"class" : "localizatorContent","alias" : "localizator","on" : "localizator.resource_id = modResource.id"}}',
            'select' => '{"localizator" : "modResource.*, localizator.*, modResource.id"}',
            'where' => '{"localizator.key" : "'~ ('localizator_key' | option) ~'"}',
          ]
        )}
        {else}
          {$_modx->runSnippet(
          'pdoMenu',
            [
            'parents' => 2,
            'resources' => "-1",
            'level' => 1,
            'tpl' => 'tplMenu',
            'tplOuter' => '@INLINE <ul class="menu">{$wrapper}</ul>',
            'limit' => 0,
            'cache' => 1,
            'cacheTime' => 3600,
            'includeTVs' => 'button_menu_color',
            'hereClass' => 'active'
            ]
          )}
        {/if}
      </div>
      <div class="block lang-block">
        <ul class="lang">
          {$_modx->runSnippet('getLanguages')}
        </ul>
      </div>
    </div>
  </section>
  <section class="section- section-header-contacts">
    <div class="container">
      <div class="mobile">
        <a href="#" class="open-popup open-menu">
          <i class="icon-menu"></i>
        </a>
      </div>
      {include 'logo_block'}
      {include 'contacts_block'}
      <div class="block callback-block">
        <a href="#" class="callback open-popup open-callback">
          <i class="icon-phone-call"></i>
          <span>{$_modx->lexicon('call_back_button')}</span>
        </a>
      </div>
      <div class="mobile">
        <a href="#" class="open-popup open-contacts">
          <i class="icon-telephone"></i>
        </a>
      </div>
    </div>
  </section>
  <section class="section- section-header-catalog">
    <div class="container">
      {include 'header_catalog'}
      <div class="block search-block">
        <div class="search">
          <form action="{$_modx->makeUrl(141)}" class="search-form">
            <fieldset>
              <div class="row">
                <input type="text" id="query" name="query" onkeyup="checkParams()" value="{$.get.query}" placeholder="{$_modx->lexicon('search_placeholder')}">
                <button type="submit" id="submit-query" class="" disabled>
                  <i class="icon-search"></i>
                </button>
              </div>
            </fieldset>
          </form>
        </div>
      </div>

      <div class="block colors-link-block">
        <a href="{$_modx->makeUrl(29312)}" class="colors-link">
          <span class="icon">
            <i class="icon-paint-palette"></i>
          </span>
          <span>{$_modx->runSnippet('!getPagetitleLocalizator', ['id' => 29312,'content' =>'pagetitle' ])}</span>
        </a>
      </div>

      <div class="block pagelinks-block">
        <div class="block cabinet-block">
          <a href="{$_modx->makeUrl(403)}" class="pagelinks cabinet {if $_modx->user.id > 0}active{/if}">
            <i class="icon icon-user-2"></i>
            <span>{$_modx->lexicon('personal_area_buton')}</span>
            <i class="check icon-check"></i>
          </a>
        </div>

        <div class="block compare-block">
          {'!GetComparison' | snippet : ['tpl' => 'tplComparisonGetSite']}
        </div>
        <div class="block favorites-block">
          <a href="{$_modx->makeUrl(161)}" class="pagelinks favorites" id="msFavoriter">
            <i class="icon icon-heart"></i>
            <span>{$_modx->lexicon('favorite_buton')}</span>
            <span class="number">0</span>
          </a>
        </div>
        {$_modx->runSnippet('!msMiniCart',['tpl' => 'tplmsMiniCartShop'])}
      </div>
    </div>
  </section>
</header>