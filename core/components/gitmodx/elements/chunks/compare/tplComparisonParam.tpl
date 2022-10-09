{set $param_options = $param | replace:"comparison_field_option.":""}
{set $optionscaptionview = $_modx->runSnippet('!optionsCaptionView', ['key' => "{$param_options}"])}
{set $translit_optionscaptionview = $_modx->runSnippet('translit',['string'=>"{$optionscaptionview}"])}
<td class="comparison-param">
    {var $key = 'comparison_field_option'}
    <strong>
        {if $key | in : $param}
            {if 'localizator_key' | option != 'ua'}
                {$_modx->lexicon($translit_optionscaptionview)}
            {else}
                {$optionscaptionview}
            {/if}
        {else}
            {$param}
        {/if}
    </strong>
</td>