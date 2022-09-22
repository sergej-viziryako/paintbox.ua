{if $_modx->config.cultureKey != 'ru'}
  {set $our_brands = $_modx->runSnippet('!pdoPage',
  [
  'elementClass' => 'modSnippet',
  'parents' => 29288,
  'tpl' => 'tplBrands',
  'depth' => 1,
  'limit' => 20,
  'includeTVs' => 'img',
  'tvPrefix' => '',
  'sortby' => 'menuindex',
  'sortdir' => '',
  'includeContent' => 1
  ]
)}
{else}
  {set $our_brands = $_modx->runSnippet('!pdoPage',
  [
  'elementClass' => 'modSnippet',
  'parents' => 29288,
  'tpl' => 'tplBrands',
  'depth' => 1,
  'limit' => 20,
  'includeTVs' => 'img',
  'tvPrefix' => '',
  'sortby' => 'menuindex',
  'sortdir' => '',
  'includeContent' => 1
  ]
)}
{/if}
{if $our_brands?}
  <section class="section- section-brands bg-cbg">
    <div class="container">
      <div class="brands-block">
        <ul class="brands responsive-brands">
          {$our_brands}
        </ul>
      </div>
    </div>
  </section>
{/if}