{foreach $options as $option index=$i}
  {set $captioname = 'option_' ~ $option.key}
  {set $measureunit = $_modx->runSnippet('!optionsMeasureUnit', ['key' => "{$option.key}"])}
  {set $translit_measureunit = $_modx->runSnippet('translit',['string'=>"{$measureunit | lower | replace:"(":"" | replace:")":""}"])}

  {if $option.key != 'artikul'}
    {if 'cultureKey' | option != 'ua'}
      {if $option.value[0]}
        <div class="row">
          <span>{$_modx->lexicon($captioname) | ucfirst}{if $measureunit}, {$_modx->lexicon($translit_measureunit)}{/if}:</span>
          {if $option.value is array}
            {foreach $option.value as $val}
                {set $translit_text = $_modx->runSnippet('translit',['string'=>"{$val | lower | replace:"(":"" | replace:")":""}"])}
              <span>{$_modx->lexicon($translit_text)}</span>
            {/foreach}
          {else}
            {$_modx->runSnippet('translit',['string'=>"{$option.value | lower | replace:"(":"" | replace:")":""}"])}
          {/if}
        </div>
      {/if}
    {else}
      {if $option.value[0]}
        <div class="row">
          <span>{$option.caption}{if $measureunit}, {$measureunit}{/if}:</span>
          <span>
            {if $option.value is array}
              {$option.value | join : ', '}
            {else}
              {$option.value}
            {/if}
          </span>
        </div>
      {/if}
    {/if}
  {/if}
{/foreach}