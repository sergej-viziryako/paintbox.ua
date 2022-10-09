{set $optionscaptionview = $_modx->runSnippet('!optionsCaptionView', ['key' => "{$filter}"])}
{set $optionscaptionmeasure =  $_modx->runSnippet('!optionsMeasureUnit', ['key' => "{$filter}"])}
{var $count_otions_arr = $rows | split : '<div class="checkbox">' | len - 1}
{var $count_otions_in = $count_otions_arr - 1}
{$_modx->lexicon->load(('cultureKey' | option) ~ ':msearch2:default')}
<div id="mse2_{$table}{$delimeter}{$filter}" class="row openclose-row-filter active-row">
  <div class="caption opener-row-filter">
    {if $filter in list ["price","vendor","parent","tags","color","size","series"]}
      {$_modx->lexicon('option_'~$filter~'')}:
    {elseif $_modx->config.cultureKey != 'ua'}
      {$_modx->lexicon('option_'~$filter~'')}:
    {else}
      {$optionscaptionview}{if $optionscaptionmeasure?},{$optionscaptionmeasure}{/if}:
    {/if}
    <i class="icon-down-chevron"></i>
  </div>
  <div class="initfilter forengine slide-row-filter">
    <div class="slide-filter scrollbar-dynamic">
      {$rows}
    </div>
    <div class="opener-filter {if $count_otions_arr <= '5'} none{/if}">
      <span>{$_modx->lexicon('filter_show_all')}</span>
      <span class="collapse">{$_modx->lexicon('filter_collapse')}</span>
      <i class="icon-down-arrow"></i>
    </div>
  </div>
</div>