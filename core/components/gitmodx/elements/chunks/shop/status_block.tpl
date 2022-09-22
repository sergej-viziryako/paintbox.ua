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
</span>