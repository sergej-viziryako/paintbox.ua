{extends 'tpl.msEmail'}
{block 'title'}
{var $style_m = [
  'p' => 'font-size: 13px;padding: 5px 20px;margin: 0;',
]}
  <b>У вас новый заказ #{$num}</b>
  <p style="{$style_m.p}">Имя: {$address.receiver}</p>
  <p style="{$style_m.p}">Телефон: {$address.phone}</p>
  <p style="{$style_m.p}">Email: {$user.email}</p>
  {if $address.city?}
    {if $delivery.id == 5}
      <p style="{$style_m.p}">Город: {$properties.msnovaposhta.area} область, {$properties.msnovaposhta.warehouse.CityDescriptionRu}</p>
    {else}
      <p style="{$style_m.p}">Город: {$address.city}</p>
    {/if}
  {/if}
  {if $address.street?}
    <p style="{$style_m.p}">Адрес: {$address.street}</p>
  {/if}
  <p style="{$style_m.p}">Способ оплаты: {$payment.name} </p>
  <p style="{$style_m.p}">Способ доставки: {$delivery.name}</p>
  {if $address.properties.extfld_warehouse?}
    <p style="{$style_m.p}">Номер отделения: {$address.properties.extfld_warehouse}</p>
  {/if}
  {if $properties.msnovaposhta.warehouse? }
    <p style="{$style_m.p}">Номер отделения: {$properties.msnovaposhta.warehouse.DescriptionRu}</p>
  {/if}
  {if $address.comment? }
    <p style="{$style_m.p}">Комментарий: {$address.comment}</p>
  {/if}
{/block}


