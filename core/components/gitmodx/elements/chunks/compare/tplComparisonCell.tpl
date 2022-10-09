{var $valcompare = $value}
<td class="comparison-cell{$classes}">
    {if $value?}
        {if $classes == ' field-article' OR $classes == ' field-price'}
            {$valcompare}
        {elseif 'localizator_key' | option != 'ua'}
            {set $translit_valcompare = $_modx->runSnippet('translit',['string'=>"{$valcompare}"])}
            {$_modx->lexicon($translit_valcompare)}
        {else}
            {$valcompare}
        {/if}
    {else}
        -
    {/if}
</td>