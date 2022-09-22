{set $parent = $parent | resource : 'pagetitle'}
{set $photo = $_modx->config.site_url ~ $image}
{set $content_product = $content | notags | replace : "[" : "" | replace : "]" : ""}
{set $item_name = $pagetitle | replace : "&" : "&amp;"}

{if $big?}
  <entry>
    <g:id>{$id}</g:id>
    <g:title>{$item_name}</g:title>
    <brand>{$_pls['vendor.name']}</brand>
    <g:description>{if $content_product?}<![CDATA[{$content_product | notags}]]>{/if}</g:description>
    <g:link>{$_modx->config['site_url']}{$id | url}</g:link>
    <g:image_link>{$photo | replace : "//assets" : "/assets"}</g:image_link>
    <g:custom_label_1>{$parent}</g:custom_label_1>
    <g:condition>new</g:condition>
    <g:price>{$price} UAH</g:price>
    <g:availability>in stock</g:availability>
  </entry>
{/if}