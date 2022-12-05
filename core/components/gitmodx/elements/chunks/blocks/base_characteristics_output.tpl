{if $_pls['vendor.name']?}
  {if $_modx->config.cultureKey != 'ua'}
    {var $vendor = $_modx->runSnippet('translit',['string'=>"{$_pls['vendor.name'] | lower | replace:"(":"" | replace:")":""}"])}
    {if $_modx->resource.template == 20}
      <div class="row">
        {*<span>{$_modx->lexicon('vendor_name')}:</span><span>{$_modx->runSnippet('getVendorPage',['vendor_name'=>"{$_modx->lexicon($vendor)}"])}</span>*}
        <span>{$_modx->lexicon('vendor_name')}:</span><span>{$_modx->runSnippet('getVendorPage',['vendor_name'=>"{$_pls['vendor.name']}"])}</span>
      </div>
    {else}
      <div class="row">
        <span>{$_modx->lexicon('vendor_name')}:</span><span>{$_modx->lexicon($vendor)}</span>
      </div>
    {/if}
  {else}
    {if $_modx->resource.template == 20}
      <div class="row">
        <span>{$_modx->lexicon('vendor_name')}:</span><span>{$_modx->runSnippet('getVendorPage',['vendor_name'=>"{$_pls['vendor.name']}"])}</span>
      </div>
    {else}
      <div class="row">
        <span>{$_modx->lexicon('vendor_name')}:</span><span>{$_pls['vendor.name']}</span>
      </div>
    {/if}
  {/if}
{/if}
{if $made_in?}
  {if $_modx->config.cultureKey != 'ua'}
    <div class="row">
      {var $madein = $_modx->runSnippet('translit',['string'=>"{$made_in | lower | replace:"(":"" | replace:")":""}"])}
      <span>{$_modx->lexicon('item_country')}:</span><span>{$_modx->lexicon($madein)}</span>
    </div>
  {else}
    <div class="row">
      <span>{$_modx->lexicon('item_country')}:</span><span>{$made_in}</span>
    </div>
  {/if}
{/if}
{if $weight?}
  <div class="row">
    <span>{$_modx->lexicon('item_weight')}:</span><span>{$weight} кг</span>
  </div>
{/if}
{if $warranty?}
  <div class="row">
    <span>{$_modx->lexicon('item_warranty')}:</span><span>{$warranty}</span>
  </div>
{/if}