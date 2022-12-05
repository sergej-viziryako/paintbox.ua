<span class="status-block">
    {if $new?}
        <span class="status status-1">
            <span>{$_modx->lexicon('label_new')}</span>
        </span>
    {/if}
    {if $favorite?}
        <span class="status status-2">
            <span>{$_modx->lexicon('label_favorite')}</span>
        </span>
    {/if}
    {if $popular?}
        <span class="status status-3">
            <span>{$_modx->lexicon('label_popular')}</span>
        </span>
    {/if}

    {if $hit?}
        <span class="status status-4">
            <span>{$_modx->lexicon('label_hit')}</span>
        </span>
    {/if}
    {if $garanty_24?}
        <span class="status status-5">
      <span>{$_modx->lexicon('label_garanty_24')}</span>
    </span>
    {/if}
    {if $nds?}
        <span class="status status-6">
            <span>{$_modx->lexicon('label_nds')}</span>
        </span>
    {/if}
    {if $super_price?}
        <span class="status status-7">
            <span>{$_modx->lexicon('label_super_price')}</span>
        </span>
    {/if}
    {if $free_delivery?}
        <span class="status status-8">
      <span>{$_modx->lexicon('label_free_delivery')}</span>
    </span>
    {/if}

    {if $_modx->resource.template != 20}
        {foreach $label_product as $row}
            {set  $name_color = 'background:#'~$row['name_color']}
            <span class="status" style='{$name_color}'>
        {if $_modx->config.cultureKey != 'ua'}
            <span>{$row['name_label']?:$row['name_label_ua']}</span>

{else}

            <span>{$row['name_label_ua']}</span>
        {/if}
      </span>
        {/foreach}
  {else}
    {set $row_label_product = json_decode($_modx->resource.label_product, true)}

    {foreach $row_label_product as $row}
        {set  $name_color = 'background:#'~$row['name_color']}
        <span class="status" style='{$name_color}'>
        {if $_modx->config.cultureKey != 'ua'}
            <span>{$row['name_label']?:$row['name_label_ua']}</span>

{else}

            <span>{$row['name_label_ua']}</span>
        {/if}
      </span>
    {/foreach}
    {/if}
</span>