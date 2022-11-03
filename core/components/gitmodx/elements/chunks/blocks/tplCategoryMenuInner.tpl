<li>
  {if $item['id'] == $_modx->resource.id}
    <span>{$item['pagetitle']}</span>
  {else}
    <a href="{$item['id'] | url}"><span>{$item['pagetitle']}</span></a>
  {/if}
</li>