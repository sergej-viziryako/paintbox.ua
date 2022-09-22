{set $optionscaptionview = $_modx->runSnippet('!optionsCaptionView', ['key' => "{$filter}"])}
<fieldset id="mse2_{$table ~ $delimeter ~ $filter}" class="row">
  <div class="row openclose-row-filter active-row">
    <div class="caption opener-row-filter">
      {if $filter in list ["price"]}
        {$_modx->lexicon('option_'~$filter~'')}:
      {else}
        {$optionscaptionview}:
      {/if}
      <i class="icon-down-chevron"></i>
    </div>
    <div class="accordion-filter slide-row-filter">
      <div class="slide-filter slide-filter-price">
        <div id="slider" class="mse2_number_slider"></div>
        <div class="mse2_number_inputs">
          {$rows}
        </div>
      </div>
    </div>
  </div>
</fieldset>