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

{*
<script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Person",
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "Seattle", //Город
      "addressRegion": "WA", //Регион
      "postalCode": "98052", //Индекс
      "streetAddress": "20341 Whitworth Institute 405 N. Whitworth" //Адрес
    },
    "colleague": [
      "http://www.xyz.edu/students/alicejones.html", //Адрес официальной веб-страницы коллег
      "http://www.xyz.edu/students/bobsmith.html" //Адрес официальной веб-страницы коллег
    ],
    "email": "mailto:jane-doe@xyz.edu", //e-mail
    "image": "janedoe.jpg", //адрес фото
    "jobTitle": "Professor", //Должность
    "name": "Алексей", //Имя
    "additionalName": "Владимирович", //Отчество
    "familyName": "Петров", //Фамилия
    "telephone": "(425) 123-4567", //телефон
    "url": "http://www.janedoe.com" //Адрес официальной веб-страницы (вроде wikipedia
  }
</script>
*}


