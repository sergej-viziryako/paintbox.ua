{set $photo_product_schema = $_modx->runSnippet('!msGallery',['tpl'=>'tplMsGallerySchema', 'limit' => 1])}
{$_modx->runSnippet('!getRaitingViewId',['id' => "{$_modx->resource.id}"])}
{set $ticketview = $_modx->runSnippet('!ticketView', ['id' => "{$_modx->resource.id}"])}
{if $ticketview == ''}
    {set $tickets = 0}
{else}
    {set $tickets = $ticketview}
{/if}

<script type="application/ld+json">
  { "@context": "http://schema.org", "@type": "Organization", "url": "{$_modx->config.site_url}", "logo": "/files/{$_modx->config.site_logo}" }
</script>

{if $_modx->resource.template == 20}
  <script type="application/ld+json">
  {
    "@context": "https://schema.org", "@type": "Product",
    "image": "{$_modx->config.site_url}{$photo_product_schema}",
    "brand": "{$_pls['vendor.name']}",
    "name": "{$_modx->resource.pagetitle | replace : "\"" : ""}",
    "description": "{$_modx->resource.pagetitle | replace : "\"" : ""}",
    "sku": "{$_modx->resource.article}",
    {if $availability == 1}
    "offers": { "@type": "Offer", "url": "{$_modx->config.site_url}{$_modx->resource.id | url}", "availability": "https://schema.org/InStock", "price": "{$price}", "priceCurrency": "UAH" }
    {else}
    "offers": { "@type": "Offer", "url": "{$_modx->config.site_url}{$_modx->resource.id | url}", "availability": "https://schema.org/OutOfStock", "price": "{$price}", "priceCurrency": "UAH" }
    {/if}

    {if $tickets > 0}
    ,
    "aggregateRating": {
      "@type": "AggregateRating",
      "ratingValue": "{$_modx->getPlaceholder('aggregate_raiting_floor')}",
      "reviewCount": "{$tickets}"
    }
    {/if}
  }
  </script>
{/if}
