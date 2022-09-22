{set $number2string = $_modx->runSnippet('!number2string', ['input' => "{$order.cart_cost}"])}
{var $style = [
'logo' => 'display:block;margin: auto;',
'a' => 'color:#348eda;',
'p' => 'font-family: Arial;color: #666666;font-size: 12px;',
'h' => 'font-family:Arial;color: #111111;font-weight: 200;line-height: 1.2em;margin: 40px 20px;',
'h1' => 'font-size: 36px;',
'h2' => 'font-size: 28px;',
'h3' => 'font-size: 22px;',
'th' => 'font-family: Arial;text-align: center;color: #111111;border: 1px solid #eee;padding: 10px;font-size: 14px;',
'td' => 'font-family: Arial;text-align: center;color: #111111;border: 1px solid #eee;padding: 4px 10px;',
'tdname' => 'font-family: Arial;text-align: left;color: #111111;border: 1px solid #eee;padding: 4px 10px;',
]}
<!DOCTYPE HTML>
<html>
<head>
  <base href="[[++site_url]]" />
  <meta charset="[[++modx_charset]]">
  <title>Заказ №  {$order.num}</title>
  <meta name="description" content="Заказ №  {$order.num}">
</head>
<body>
<table cellspacing="0" style="width: 190mm;margin: 0 auto 0 auto;">
  <tr><td style="text-align:left;"><b>Имя:</b>  {$address.receiver}</td></tr>
  <tr><td style="text-align:left;"><b>Телефон:</b>  {$address.phone}</td></tr>
  {if $address.city?}
    {if $delivery.id == 5}
      <tr><td style="text-align:left;"><b>Город:</b>  {$order.properties.msnovaposhta.area} область, {$order.properties.msnovaposhta.warehouse.CityDescriptionRu}</td></tr>
    {else}
      <tr><td style="text-align:left;"><b>Город:</b>  {$address.city}</td></tr>
    {/if}
  {/if}

  {if $address.metro?}
    <tr><td style="text-align:left;"><b>Отделение Нова Пошта:</b>  {$address.metro}</td></tr>
  {/if}
  {if $address.street?}
    <tr><td style="text-align:left;"><b>Улица:</b>  {$address.street}</td></tr>
  {/if}
  {if $address.building?}
    <tr><td style="text-align:left;"><b>Дом/квартира:</b>  {$address.building}</td></tr>
  {/if}
  <tr><td style="text-align:left;"><b>Способ оплаты:</b>  {$payment.name}</td></tr>
  <tr><td style="text-align:left;"><b>Способ доставки:</b>  {$delivery.name}</td></tr>
  {if $address.properties.extfld_warehouse?}
    <tr><td style="text-align:left;"><b>Номер отделения:</b>  {$address.properties.extfld_warehouse}</td></tr>
  {/if}
  {if $order.properties.msnovaposhta.warehouse? }
    <tr><td style="text-align:left;"><b>Номер отделения:</b> {$order.properties.msnovaposhta.warehouse.DescriptionRu}</td></tr>
  {/if}
  <tr><td style="text-align:left;"><b>Статус заказа:</b>  {$status.name}</td></tr>
  <tr><td style="text-align:left;"><b>Комментарий к заказу покупателя:</b>  {$address.comment}</td></tr>
  <tr><td style="text-align:left;"><b>Комментарий к заказу менеджера:</b>  {$order.comment}</td></tr>
  <tr><td style="text-align:center;"><h3 style="margin: 0;">Заказа №  {$order.num}, {$order.createdon | date_format:"%d-%m-%Y"}</h3></td></tr>
</table>
{set $i = 1}
<table cellspacing="0" style='width: 190mm;margin: 0 auto 0 auto;border: 1px solid #000;'>
  <tr>
    <td style='{$style.th}' class="ramka1">№</td>
    <td style='{$style.th}' class="ramka1">Фото</td>
    <td style='{$style.th}' class="ramka1">Название</td>
    <td style='{$style.th}' class="ramka1">Кол-во, шт</td>
    <td style='{$style.th}' class="ramka1">Цена, грн</td>
    <td style='{$style.th}' class="ramka1">Сумма, грн</td>
  </tr>
    {foreach $products as $product}
      <tr>
        <td style='{$style.td}'>
            {$i}
            {set $i += 1}
        </td>
        <td style='{$style.td}'>
          <img src="{$_modx->config.site_url}{$product.thumb}" width="120" height="90"/>
        </td>
        <td style='{$style.tdname}'>
          <p>
              {$product.name}
              {if $product.vendor != ''}
                <br/> Производитель - {$product.vendor}
              {/if}
          </p>
            {if $product.options?}
              <div class="small">
                  {var $options = ''}
                  {foreach $product.options as $option}
                      {var $options = $options ~ $option ~ '; '}
                  {/foreach}
                  {$options | preg_replace : '#; $#': ''}
              </div>
            {/if}
        </td>
        <td style='{$style.td}'>{$product.count}</td>
        <td style='{$style.td}'><b><span>{$product.price}</span></b> </td>
          {set $sumall = $product.price * $product.count}
        <td style='{$style.td}'><b><span>{$sumall}</span></b> </td>
      </tr>
    {/foreach}
</table>
<table cellspacing="0" style="width: 190mm;margin: 0 auto 0 auto;height: 10mm;">
  <tr>
    <td colspan="5" style="text-align:right;font-weight: bold;font-size: 20px;"> Всего к оплате: {$order.cart_cost} грн.</td>
  </tr>
</table>
</body>
</html>
