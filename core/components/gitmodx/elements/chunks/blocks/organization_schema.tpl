{set $site_addressOrganization = $_modx->config.site_url | replace:'/ru/':'/'}
{if $_modx->config.cultureKey == 'ru'}
  {set $adressOrganization = $_modx->config.adress}
  {set $cityOrganization = $_modx->config.city}
  {set $regionOrganization = $_modx->config.region}
{else}
  {set $adressOrganization = $_modx->config.adressUA}
  {set $cityOrganization = $_modx->config.cityUA}
  {set $regionOrganization = $_modx->config.regionUA}
{/if}

{set $alternativeOrganization = []}
{if $_modx->config.facebook?}
  {set $alternativeOrganization[] = $_modx->config.facebook}
{/if}
{if $_modx->config.twitter?}
  {set $alternativeOrganization[] = $_modx->config.twitter}
{/if}
{if $_modx->config.pinterest?}
  {set $alternativeOrganization[] = $_modx->config.pinterest}
{/if}
{if $_modx->config.instagram?}
  {set $alternativeOrganization[] = $_modx->config.instagram}
{/if}
{if $_modx->config.youtube?}
  {set $alternativeOrganization[] = $_modx->config.youtube}
{/if}


<script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Organization",
    "url": "{$site_addressOrganization}",
    "logo": "{$site_addressOrganization}files/{$_modx->config.sitePicture}",
    "email": "https://email: {$_modx->config.email}",
    "name": "{$_modx->config.form_site_name}",
    "telephone": "{$_modx->config.tel_one}",
    "sameAs" : {$alternativeOrganization | toJSON},
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "{$cityOrganization}",
      "addressRegion": "{$regionOrganization}",
      "postalCode": "{$_modx->config.postal_сode}",
      "streetAddress": "{$adressOrganization}"
     }
  }
</script>

{if $_modx->resource.template in list [35,37,46,21,39,43,42,24,44]}
  <script type="application/ld+json">
  {
    "@context":"https://schema.org",
    "@type":"WebPage",
    "name":"{$_modx->resource.h1Ua?:$_modx->resource.pagetitle}",
    "description":"{$_modx->resource.metaDescriptionUa?:$_modx->resource.pagetitle}",
    "datePublished":"{$_modx->resource.publishedon | date_format : '%d.%m.%Y'}",
    "dateModified":"{$_modx->resource.editedon | date_format:"%d.%m.%Y" }",
    "publisher":{
      "@type":"Organization",
      "name":"{$_modx->config.form_site_name}",
      "logo":"{$site_addressOrganization}files/{$_modx->config.sitePicture}",
      "url":"{$_modx->config.site_url}{$_modx->resource.id | url}",
      "email":"{$_modx->config.email}"}
  }
  </script>
{/if}

{if $_modx->resource.template in list [47]}
<script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Person",
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "{$_modx->resource.addresslocality}",
      "addressRegion": "{$_modx->resource.addressregion}",
      "postalCode": "{$_modx->resource.postalcode}",
      "streetAddress": "{$_modx->resource.streetaddress}"  
    },
    "colleague": [
      "{$_modx->resource.colleague1}",
      "{$_modx->resource.colleague2}"
    ],
    "email": "mailto:{$_modx->resource.email_author}",
    "image": "{$site_addressOrganization}{$_modx->resource.img}",
    "jobTitle": "{$_modx->resource.jobtitle}",
    "name": "{$_modx->resource.name_author}",
    "additionalName": "{$_modx->resource.additionalname}",
    "familyName": "{$_modx->resource.familyname}",
    "telephone": "{$_modx->resource.telephone_authors}",
    "url": "{$_modx->resource.url_authors}"
  }
</script>
{/if}


