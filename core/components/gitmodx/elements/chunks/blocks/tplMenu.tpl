{set $ticketview = $_modx->runSnippet('!ticketView', ['id' => "29284"])}
<li {$classes}>
  <a href="{$id | url}" {if $id == 29301} style="background: {if $button_menu_color?}{$button_menu_color};{else}#dc143c;{/if}" {/if}>
    <span>{$pagetitle} {if $id == 29284} ({if $ticketview?}{$ticketview}{else}0{/if}){/if}</span>
  </a>
</li>