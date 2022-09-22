<offer id="{$id}" available="{if $availability?}true{else}false{/if}">
  <price>{$price}</price>
    {if $old_price?}
      <price_old>{$old_price}</price_old>
    {/if}
  <category>{$parent | resource : 'pagetitle'}</category>
    {$_modx->runSnippet('!msGallery',[ 'product'=> "{$id}", 'tpl'=>'tplMsGalleryYML'])}
  <vendor>{$_pls['vendor.name']}</vendor>
  <name lang="ru">{$pagetitle | replace : "&" : "&amp;"}</name>
    {set $item_ua = $_modx->runSnippet('!getContentLanguageUA', ['id' => "{$id}",'content' =>'pagetitle' ])}
    {if $item_ua?}
      <name lang="ua">{$item_ua | replace : "&" : "&amp;"}</name>
    {/if}
    {if $content}
      <description lang="ru">
        <![CDATA[  {$content|replace : "&" : "&amp;"} ]]>
      </description>
    {/if}
    {if $weight?}
      <weight>{$weight}</weight>
    {/if}
    {if $barcode?}
      <barcode>{$barcode}</barcode>
    {/if}
    {if $made_in?}
      <country_of_origin>{$made_in}</country_of_origin>
    {/if}
</offer>