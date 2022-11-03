{set $ticketview = $_modx->runSnippet('!ticketView', ['id' => "29284"])}
<li {$classes}>

  {if $id == $_modx->resource.id}
    <span class="active-item" {if $id == 29301} style="background: {if $button_menu_color?}{$button_menu_color};{else}#dc143c;{/if}" {/if}>
      <span>{$pagetitle} {if $id == 29284} ({if $ticketview?}{$ticketview}{else}0{/if}){/if}</span>
    </span>
  {else}
    <a href="{$id | url}" {if $id == 29301} style="background: {if $button_menu_color?}{$button_menu_color};{else}#dc143c;{/if}" {/if}>
      <span>{$pagetitle} {if $id == 29284} ({if $ticketview?}{$ticketview}{else}0{/if}){/if}</span>
    </a>
  {/if}
</li>