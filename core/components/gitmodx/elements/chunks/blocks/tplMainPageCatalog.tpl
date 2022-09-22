{set $i = 0}
{if $item['children']?}
  <li data-aos="zoom-in-up">
    <div class="inner">
      <a href="{$item['id'] | url}" class="caption">
        {if $item['icon']? AND 'standard' | mobiledetect}
          <span class="img">
            <img class="lazy" data-src="/files/{$item['icon']}" alt="">
          </span>
        {/if}
        <span>{$item['pagetitle']}</span>
      </a>
      <ul>
        {if $_modx->config.main_page_catalog_items_count?}
          {set $max_subcats_count = $_modx->config.main_page_catalog_items_count}
        {else}
          {set $max_subcats_count = 5}
        {/if}
        {foreach $item['children'] as $child}
            {set $child['level'] = $item['level'] + 1}
            {$_modx->getChunk('tplCategoryMenuInner', ['item' => $child])}
            {set $i = $i + 1}
            {if $i == $max_subcats_count}
              {break}
            {/if}
        {/foreach}
      </ul>
      {if $i == $max_subcats_count}
        <a href="{$item['id'] | resource : 'id'| url}" class="more">
          <span>{$_modx->lexicon('see_all_button')}</span>
          <i class="icon-right-chevron"></i>
        </a>
      {/if}
    </div>
  </li>
{else}
  <li data-aos="zoom-in-up">
    <div class="inner">
      <a href="{$item['id'] | url}" class="caption">
        {if $item['icon']? AND 'standard' | mobiledetect}
          <span class="img">
            <img class="lazy" data-src="/files/{$item['icon']}" alt="">
          </span>
        {/if}
        <span>{$item['pagetitle']}</span>
      </a>
    </div>
  </li>
{/if}
