{foreach $options as $option}{if $option.value is array}{$option.value | join : ', '}{else}{$option.value}{/if}{/foreach}
