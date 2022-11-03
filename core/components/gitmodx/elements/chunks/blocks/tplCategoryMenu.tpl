{var $file_exists = $_modx->runSnippet('ifFileExist',['filename' => "{$item['icon'] | replace:'/ru/files/':'/files/'}"])}
{if $file_exists?}
  {set $picture = $item['icon']}
{else}
  {set $picture = $item['img']}
{/if}
{set $i = 0}
{if $item['children']?}
  <li>
    <div class="openerlink">
      {if $item['id'] == $_modx->resource.id}
          <span href="{$item['id'] | url}" class="caption opener-inner">
              {if $picture? AND 'standard' | mobiledetect}
                  <span class="img">
                <img class="lazy" data-src="/files/{$picture}" alt="" height="50" width="50">
              </span>
              {/if}
              <span>{$item['pagetitle']}</span>
              <span class="icon">
              <i class="icon-down-arrow"></i>
            </span>
          </span>
          <span href="{$item['id'] | url}" class="linkto">
              <i class="icon-right-arrow"></i>
          </span>
      {else}
          <a href="{$item['id'] | url}" class="caption opener-inner">
            {if $picture? AND 'standard' | mobiledetect}
              <span class="img">
                <img class="lazy" data-src="/files/{$picture}" alt="" height="50" width="50">
              </span>
            {/if}
            <span>{$item['pagetitle']}</span>
            <span class="icon">
              <i class="icon-down-arrow"></i>
            </span>
          </a>
          <a href="{$item['id'] | url}" class="linkto">
            <i class="icon-right-arrow"></i>
          </a>
      {/if}

    </div>
    <div class="slide-inner">
      {if $_modx->config.catalog_items_count?}
        {set $max_subcats_count = $_modx->config.catalog_items_count}
      {else}
        {set $max_subcats_count = 5}
      {/if}
      <ul>
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
  <li>
    <div class="openerlink">
      <a href="{$item['id'] | url}" class="caption opener-inner">
        {if $picture? AND 'standard' | mobiledetect}
          <span class="img">
          <img class="lazy" data-src="/files/{$picture}" alt="">
        </span>
        {/if}
        <span>{$item['pagetitle']}</span>
        <span class="icon">
        <i class="icon-down-arrow"></i>
      </span>
      </a>
      <a href="{$item['id'] | url}" class="linkto">
        <i class="icon-right-arrow"></i>
      </a>
    </div>
  </li>
{/if}