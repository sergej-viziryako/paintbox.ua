<div class="block logo-block">
  <div class="logo">
    <a href="{$_modx->config.site_url}">
      {if $_modx->config.site_icon?}
        <span class="img">
          <i class="{$_modx->config.site_icon}"></i>
        </span>
        <span class="caption">
          {if $_modx->config.cultureKey != 'ua'}
              {$_modx->config.site_global_name}
          {else}
              {$_modx->config.site_global_nameUA}
          {/if}
        </span>
        <span class="text">
          {if $_modx->config.cultureKey != 'ua'}
              {$_modx->config.slogan}
          {else}
              {$_modx->config.sloganUA}
          {/if}
        </span>
      {else}
        <span class="img">
          <img src="/files/{$_modx->config.site_logo}" alt="">
        </span>
      {/if}
    </a>
  </div>
</div>