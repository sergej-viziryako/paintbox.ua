{$_modx->lexicon->load(('cultureKey' | option) ~ ':localizator:site')}
{set $translit_text = $_modx->runSnippet('translit',['string'=>"{$title}"])}
{set $pagetitle_lang = $_modx->runSnippet('getPagetitleLocalizator',['id'=>"{$value}", 'content'=>'pagetitle'])}
{if $_modx->config.cultureKey != 'ua' }
  {set $title_checkbox = $_modx->lexicon($translit_text| lower | replace:"(":"" | replace:")":"")}
{else}
  {set $title_checkbox = $title}
{/if}
{if $title}
  <div class="checkbox">
    <label for="mse2_{$table}{$delimeter}{$filter}_{$idx}" class="{$disabled}">
      <input type="checkbox" name="{$filter_key}" id="mse2_{$table}{$delimeter}{$filter}_{$idx}" value="{$value}" {$checked} {$disabled}/>
      <i class="checkmark icon-check"></i>
      {if $filter in list ["parent"]}
        <span>{$pagetitle_lang}</span><sup>{$num}</sup>
      {elseif $filter in list ["vendor"]}
        <span>{$title}</span><sup>{$num}</sup>
      {else}
        <span>{$title_checkbox}</span><sup>{$num}</sup>
      {/if}
    </label>
  </div>
{/if}

