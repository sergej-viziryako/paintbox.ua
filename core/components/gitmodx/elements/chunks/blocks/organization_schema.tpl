{set $site_addressOrganization = $_modx->config.site_url | replace:'/ua/':'/'}
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
      "streetAddress": "{$adressOrganization}",
      "hasmap":"{$_modx->config.adress_google_maps}"
    }
  }
</script>


