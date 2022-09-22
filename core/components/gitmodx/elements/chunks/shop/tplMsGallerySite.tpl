{set $i = 2}
{if $files?}
  <div class="my-gallery slider-for">
    {foreach $files as $file}
      <li class="item" data-color="{$file['name']}">
        {if 'standard' | mobiledetect?}
          <a href="{$file['full']}" data-lightbox="roadtrip">
            <img class="lazy" data-src="{$file['big']}" alt="Фото {$i} - {$_modx->resource.pagetitle}" />
          </a>
        {else}
          <a href="{$file['big']}" data-lightbox="roadtrip">
            <img class="lazy" data-src="{$file['small']}" alt="Фото {$i} - {$_modx->resource.pagetitle}" />
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
