{if $_modx->getPlaceholder('check_user') == 0}
{set $rows = json_decode(1 | resource : 'ads_slider', true)}
{if $rows?}
  <section class="section- section-topslider">
    <div class="container">
      <div class="topslider-block">
        <div class="topslider slider-topslider">
          {foreach $rows as $row}
            {if $_modx->config.cultureKey != 'ru'}
              {set $link = $row.linkUA}
              {set $text = $row.textUA}
            {else}
              {set $link = $row.link}
              {set $text = $row.text}
            {/if}
            {if $row.image?}
              <a href="{$link}" class="slide">
                <span class="caption">{$text}</span>
                <span class="img">
                  <img class="lazy" data-src="/files/{$row.image}" alt="">
                </span>
              </a>
            {else}
              <a href="{$link}" class="slide slide-caption">
                <span class="caption">{$text}</span>
              </a>
            {/if}
          {/foreach}
        </div>
      </div>
    </div>
  </section>
{/if}
{/if}