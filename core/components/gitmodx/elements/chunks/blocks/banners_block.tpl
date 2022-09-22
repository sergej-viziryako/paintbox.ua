{set $rows = json_decode(1 | resource : 'banners_block', true)}
{if $rows?}
  <section class="section- section-benefits bg-cbg">
    <div class="container">
      <div class="benefits-block">
        <ul class="benefits">
          {foreach $rows as $row}
            {if $_modx->config.cultureKey != 'ru'}
              {set $link = $row.linkUA}
              {set $title = $row.textUA}
            {else}
              {set $link = $row.link}
              {set $title = $row.text}
            {/if}
            <li>
              <a href="{$link}" class="inner">
                <span class="img">
                  <img class="lazy" data-src="/files/{$row.image}" alt="" height="280" width="650">
                </span>
                <span class="caption">{$title}</span>
              </a>
            </li>
          {/foreach}
        </ul>
      </div>
    </div>
  </section>
{/if}