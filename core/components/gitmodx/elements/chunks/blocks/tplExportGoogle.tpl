{set $parent = $parent | resource : 'pagetitle'}
{set $photo = $_modx->config.site_url ~ $small}
{set $content_product = $content | notags | summary : "len=3000"}
{set $item_name = $pagetitle | replace : "&" : "&amp;"}

{if $small?}
  <entry>
    <g:id>{$id}</g:id>
    <g:title>{$item_name}</g:title>
    <g:description><![CDATA[{$content_product }]]></g:description>
    <g:link>{$_modx->config['site_url']}{$id | url}</g:link>
    <g:image_link>{$photo | replace : "//assets" : "/assets"}</g:image_link>
    <g:condition>new</g:condition>
    <g:price>{$price} UAH</g:price>
    <g:availability>in stock</g:availability>
  </entry>
{/if}
