{foreach $data as $category => $options}
  {set $translit_category = $_modx->runSnippet('translit',['string'=>"{$category | lower | replace:"(":"" | replace:")":""}"])}
  {if 'cultureKey' | option != 'ua'}
    {if $data | len > 1}
      <div class="block">
        <div class="row row-caption">
          <b>{$_modx->lexicon($translit_category) | ucfirst}</b>
        </div>
        {foreach $options as $option}
          {set $captioname = 'option_' ~ $option.key}
          {set $measureunit = $_modx->runSnippet('!optionsMeasureUnit', ['key' => "{$option.key}"])}
          {set $translit_measureunit = $_modx->runSnippet('translit',['string'=>"{$measureunit | lower | replace:"(":"" | replace:")":""}"])}
          <div class="row">
            <span>{$_modx->lexicon($captioname) | ucfirst}{if $measureunit}, {$_modx->lexicon($translit_measureunit)}{/if}:</span>
              {if $option.value is array}
                {foreach $option.value as $val}
                  {set $translit_text = $_modx->runSnippet('translit',['string'=>"{$val}"])}
                  <span>{$_modx->lexicon($translit_text)}</span>
                {/foreach}
              {else}
                {set $translit_text = $_modx->runSnippet('translit',['string'=>"{$option.value | lower | replace:"(":"" | replace:")":""}"])}
                <span>{$_modx->lexicon($translit_text)}</span>
              {/if}
          </div>
        {/foreach}
      </div>
    {else}
      {foreach $options as $option}
        {set $translit_option_caption = 'option_'~$option.key | lower}
        {set $measureunit = $_modx->runSnippet('!optionsMeasureUnit', ['key' => "{$option.key}"])}
        {set $translit_measureunit = $_modx->runSnippet('translit',['string'=>"{$measureunit | lower | replace:"(":"" | replace:")":""}"])}
        <div class="row column-no-category">
          <span>{$_modx->lexicon($translit_option_caption)}{if $measureunit}, {$_modx->lexicon($translit_measureunit)}{/if}:</span>
            {if $option.value is array}
              {foreach $option.value as $val}
                {set $translit_text = $_modx->runSnippet('translit',['string'=>"{$val | lower | replace:"(":"" | replace:")":""}"])}
                <span>{$_modx->lexicon($translit_text)}</span>
              {/foreach}
            {else}
              {set $translit_text = $_modx->runSnippet('translit',['string'=>"{$option.value | lower | replace:"(":"" | replace:")":""}"])}
              <span>{$_modx->lexicon($translit_text)}</span>
            {/if}
        </div>
      {/foreach}
    {/if}
  {else}
    {if $data | len > 1}
      <div class="block">
        <div class="row row-caption">
          <b>{$category}</b>
        </div>
          {foreach $options as $option}
            <div class="row">
              <span>{$option.caption}{if $option.measure_unit?}, {$option.measure_unit}{/if}:</span><span>{$option.value|join:', '}</span>
            </div>
          {/foreach}
      </div>
    {else}
      {foreach $options as $option}
        <div class="row column-no-category">
          <span>{$option.caption}{if $option.measure_unit?}, {$option.measure_unit}{/if}:</span>
          <span>{$option.value|join:', '}</span>
        </div>
      {/foreach}
    {/if}
  {/if}
{/foreach}