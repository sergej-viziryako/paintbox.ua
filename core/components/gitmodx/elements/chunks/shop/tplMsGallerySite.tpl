{set $i = 1}

{if $_modx->config.cultureKey != 'ua'}
    {set $array_keyword = ['купить','заказать','цена','стоимость']}
{else}
    {set $array_keyword = ['купити','заказати','ціна','вартість']}
{/if}


{if $files?}
  <div class="my-gallery slider-for">
    {foreach $files as $file}
      <li class="item" data-color="{$file['name']}">
        {if 'standard' | mobiledetect?}
          <a href="{$file['full']}" data-lightbox="roadtrip">
            <img class="lazy" data-src="{$file['big']}" title="{$_modx->resource.pagetitle} - Фото № {$i}" alt="{$_modx->resource.pagetitle} {$array_keyword[$i]}" />
          </a>
        {else}
          <a href="{$file['big']}" data-lightbox="roadtrip">
            <img class="lazy" data-src="{$file['small']}" title="{$_modx->resource.pagetitle} - Фото № {$i}" alt="{$_modx->resource.pagetitle}" />
          </a>
        {/if}
      </li>
      {set $i = $i + 1}
    {/foreach}
    {if $_modx->resource.video}
      <li class="item">
        <div class="video">
          <div class="inner">
            <div class="youtube"
               id="{$_modx->resource.video}" style="width: 630px; height: 450px;">
            </div>
          </div>
        </div>
      </li>
    {/if}
  </div>
  {if $files|length > 1}
    <ul class="slider-nav">
      {foreach $files as $file}
        <li>
          <div>
            <img class="lazy" data-src="{$file['smallpreview']}">
          </div>
        </li>
          {set $i = $i + 1}
      {/foreach}
      {if $_modx->resource.video}
        <li>
          <div>
            <i class="icon-next-2"></i>
          </div>
        </li>
      {/if}
    </ul>
  {/if}
{else}
  <span class="img img-empty">
    <i class="icon-picture"></i>
  </span>
{/if}
