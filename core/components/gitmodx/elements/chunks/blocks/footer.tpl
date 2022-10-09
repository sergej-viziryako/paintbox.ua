<footer class="footer">
  <div class="container">
    <div class="column column100">
      <div class="column first">
        {include 'logo_block'}
        <div class="policy-block">
          <p>{$_modx->lexicon('all_rights_reserved')} {$_modx->runSnippet('get_current_year')}</p>
          <p><a href="{$_modx->makeUrl(29277)}">{$_modx->runSnippet('!getPagetitleLocalizator', ['id' => 29277,'content' =>'pagetitle' ])}</a></p>
          <p><a href="{$_modx->makeUrl(412)}">{$_modx->runSnippet('!getPagetitleLocalizator', ['id' => 412,'content' =>'pagetitle' ])}</a></p>
        </div>
      </div>
      <div class="column">
        <div class="footer-caption">
          <span>{$_modx->lexicon('footer_shop_title')}</span>
        </div>
        {if $_modx->config.cultureKey != 'ua'}
          {$_modx->runSnippet(
          'pdoMenu',
          [
            'parents' => 2,
            'resources' => "-1",
            'level' => 1,
            'tpl' => 'tplMenu',
            'tplOuter' => '@INLINE <ul class="footer-menu">{$wrapper}</ul>',
            'limit' => 0,
            'cache' => 1,
            'cacheTime' => 3600,
            'includeTVs' => 'button_menu_color',
            'hereClass' => 'active',
            'showUnpublished' => 0,
            'showHidden' => 0,
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
            'tplOuter' => '@INLINE <ul class="footer-menu">{$wrapper}</ul>',
            'limit' => 0,
            'cache' => 1,
            'cacheTime' => 3600,
            'includeTVs' => 'button_menu_color',
            'hereClass' => 'active',
            'showUnpublished' => 0,
            'showHidden' => 0
            ]
          )}
        {/if}
      </div>
      <div class="column">
        <div class="footer-caption">
          <span>{$_modx->lexicon('footer_info_title')}</span>
        </div>
        {if $_modx->config.cultureKey != 'ua'}
          {$_modx->runSnippet(
          'pdoMenu',
          [
            'parents' => 164,
            'resources' => "-29277",
            'level' => 1,
            'tpl' => 'tplMenu',
            'tplOuter' => '@INLINE <ul class="footer-menu">{$wrapper}</ul>',
            'limit' => 0,
            'cache' => 1,
            'cacheTime' => 3600,
            'hereClass' => 'active',
            'includeTVs' => 'button_menu_color',
            'showUnpublished' => 0,
            'showHidden' => 0
            'leftJoin' => '{"localizator" : {"class" : "localizatorContent","alias" : "localizator","on" : "localizator.resource_id = modResource.id"}}',
            'select' => '{"localizator" : "modResource.*, localizator.*, modResource.id"}',
            'where' => '{"localizator.key" : "'~ ('localizator_key' | option) ~'"}',
          ]
        )}
        {else}
          {$_modx->runSnippet(
          'pdoMenu',
            [
            'parents' => 164,
            'resources' => "-29277",
            'level' => 1,
            'tpl' => 'tplMenu',
            'tplOuter' => '@INLINE <ul class="footer-menu">{$wrapper}</ul>',
            'limit' => 0,
            'cache' => 1,
            'cacheTime' => 3600,
            'includeTVs' => 'button_menu_color',
            'hereClass' => 'active',
            'showUnpublished' => 0,
            'showHidden' => 0
            ]
          )}
        {/if}
      </div>
      {set $resources = 1 | resource : 'popular_urls'}
      {if $resources?}
        <div class="column">
        <div class="footer-caption">
          <span>{$_modx->lexicon('footer_popular_cats_title')}</span>
        </div>
        {if $_modx->config.cultureKey != 'ua'}
          {$_modx->runSnippet(
          'pdoMenu',
            [
              'parents' => 160,
              'resources' => "1,{$resources}",
              'level' => 4,
              'tpl' => 'tplMenu',
              'tplOuter' => '@INLINE <ul class="footer-menu">{$wrapper}</ul>',
              'limit' => 0,
              'cache' => 1,
              'cacheTime' => 3600,
              'hereClass' => 'active',
              'includeTVs' => 'button_menu_color',
              'leftJoin' => '{"localizator" : {"class" : "localizatorContent","alias" : "localizator","on" : "localizator.resource_id = modResource.id"}}',
              'select' => '{"localizator" : "modResource.*, localizator.*, modResource.id"}',
              'where' => '{"localizator.key" : "'~ ('localizator_key' | option) ~'"}',
            ]
          )}
          {else}
            {$_modx->runSnippet(
            'pdoMenu',
              [
              'parents' => 160,
              'resources' => "1,{$resources}",
              'level' => 4,
              'tpl' => 'tplMenu',
              'tplOuter' => '@INLINE <ul class="footer-menu">{$wrapper}</ul>',
              'limit' => 0,
              'cache' => 1,
              'cacheTime' => 3600,
              'includeTVs' => 'button_menu_color',
              'hereClass' => 'active'
              ]
            )}
          {/if}
        </div>
      {/if}
      <div class="column last">
        <div class="footer-caption">
          <span>{$_modx->lexicon('footer_contacts')}</span>
        </div>
        {include 'contacts_block'}
        {include 'messengers_block'}
        <div class="block callback-block">
          <a href="#" class="callback open-popup open-callback">
            <i class="icon-phone-call"></i>
            <span>{$_modx->lexicon('call_back_button')}</span>
          </a>
        </div>
        {include 'working_time_block'}
      </div>
    </div>
    <hr>
    <div class="column column100">
      <div class="column">
        <div class="paymentsystems-block">
          <div class="footer-caption min">
            <span>{$_modx->lexicon('we_are_payment')}</span>
          </div>
          <ul class="paymentsystems">
            <li>
              <div>
                <span class="img">
                  <img class="lazy" data-src="/tpl/images/pay1-min.webp" alt="" height="24" width="74">
                </span>
              </div>
            </li>
            <li>
              <div>
                <span class="img">
                  <img class="lazy" data-src="/tpl/images/pay2-min.webp" alt="" height="24" width="74">
                </span>
              </div>
            </li>
            <li>
              <div>
                <span class="img">
                  <img class="lazy" data-src="/tpl/images/pay3-min.webp" alt="" height="24" width="40">
                </span>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <div class="column">
        {if $_modx->config.facebook? || $_modx->config.instagram? || $_modx->config.youtube?}
          <div class="socials-block">
            <div class="footer-caption min">
              <span>{$_modx->lexicon('we_are_at_social')}</span>
            </div>
            <ul class="socials">
              {if $_modx->config.facebook?}
                <li>
                  <a href="{$_modx->config.facebook}" rel="nofollow" target="_blank">
                    <span>Facebook</span>
                  </a>
                </li>
              {/if}
              {if $_modx->config.instagram?}
                <li>
                  <a href="{$_modx->config.instagram}" rel="nofollow" target="_blank">
                    <span>Instagram</span>
                  </a>
                </li>
              {/if}
              {if $_modx->config.youtube?}
                <li>
                  <a href="{$_modx->config.youtube}" rel="nofollow" target="_blank">
                    <span>YouTube</span>
                  </a>
                </li>
              {/if}
              {if $_modx->config.pinterest?}
                <li>
                  <a href="{$_modx->config.pinterest}" rel="nofollow" target="_blank">
                    <span>Pinterest</span>
                  </a>
                </li>
              {/if}
              {if $_modx->config.twitter?}
                <li>
                  <a href="{$_modx->config.twitter}" rel="nofollow" target="_blank">
                    <span>Twitter</span>
                  </a>
                </li>
              {/if}
            </ul>
          </div>
        {/if}
      </div>
    </div>
  </div>
</footer>