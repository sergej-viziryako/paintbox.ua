{set $site_address = $_modx->config.site_url | replace:'/ru/':'/'}

<script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Article",
    "mainEntityOfPage": {
      "@type": "WebPage",
      "@id": "{$_modx->config.site_url}{$_modx->makeUrl($_modx->resource.id)}"
    },
    "headline": "{$_modx->runSnippet('metaTagsh1')}",
    "image": "{$site_address}{$_modx->resource.img}",
    "author": {
      "@type": "Person",
      "name": "Admin"
    },
    "publisher": {
      "@type": "Organization",
      "name": "{$_modx->config.form_site_name}",
      "logo": {
        "@type": "ImageObject",
        "url": "{$site_address}files/{$_modx->config.sitePicture}"
      }
    },
    "datePublished": "{$_modx->resource.publishedon | date_format : '%d.%m.%Y'}",
    "dateModified": "{$_modx->resource.editedon | date_format:"%d.%m.%Y" }"
  }
</script>