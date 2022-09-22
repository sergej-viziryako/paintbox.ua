{if $files?}
  {foreach $files as $file}
      {var $photo = $_modx->config.site_url ~ $file['url']}
    <picture>{$photo | replace : "//assets" : "/assets"}</picture>
  {/foreach}
{/if}