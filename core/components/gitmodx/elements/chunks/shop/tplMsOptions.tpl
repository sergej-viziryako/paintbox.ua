{if $options | len > 0}
  <div class="row">
    {if $options['color']}
      <span>{$_modx->lexicon('item_color_caption')}:</span>
    {/if}
    {if $options['size']}
      <span>{$_modx->lexicon('item_sizes_caption')}:</span>
    {/if}
    <span>
      {foreach $options as $name => $values}
        <select name="options[{$name}]" id="option_{$name}">
          {if 'localizator_key' | option != 'ru'}
            {foreach $values as $value}
              {set $translit_text_option = $_modx->runSnippet('translit',['string'=>"{$value | lower | replace:"(":"" | replace:")":""}"])}
              <option value="{$value}">{$_modx->lexicon($translit_text_option)}</option>
            {/foreach}
          {else}
            {foreach $values as $value}
              <option value="{$value}">{$value}</option>
            {/foreach}
          {/if}
        </select>
      {/foreach}
    </span>
  </div>
{/if}

