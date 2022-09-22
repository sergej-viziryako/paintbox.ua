{var $getItemsCount = $_modx->runSnippet('!getItemsCount', ['parents' => "{$_modx->resource.id}", 'depth' => 1, 'where' => '{"template":"20"}'])}
{var $minPrice = $_modx->runSnippet('msProducts',['parents'=>"{$_modx->resource.id}", 'limit' => 1, 'tpl' => '@INLINE {$price}', 'depth' => 1, 'sortby' => 'Data.price', 'sortdir' => 'ASC', 'showZeroPrice' => 0])}
{var $maxPrice = $_modx->runSnippet('msProducts',['parents'=>"{$_modx->resource.id}", 'limit' => 1, 'tpl' => '@INLINE {$price}', 'depth' => 1, 'sortby' => 'Data.price', 'sortdir' => 'DESC'])}

{if $getItemsCount != 0}
  <script type="application/ld+json">
  {
    "@context": "http://schema.org/",
    "@type": "Product",
    "name": "{$_modx->resource.pagetitle}",
    "offers": {
      "@type": "AggregateOffer",
      "priceCurrency": "UAH",
      "lowprice": "{$minPrice}",
      "highprice": "{$maxPrice}",
      "offerCount": "{$getItemsCount}"
    }
  }
  </script>
{/if}
