{var $style = [
'logo' => 'display:block;margin: auto;',
'a' => 'color:#348eda;',
'p' => 'font-family: Arial;color: #666666;font-size: 12px;',
'h' => 'font-family:Arial;color: #111111;font-weight: 200;line-height: 1.2em;margin: 40px 20px;',
'h1' => 'font-size: 36px;',
'h2' => 'font-size: 28px;',
'h3' => 'font-family:Arial;color: #111111;font-weight: 200;line-height: 1.2em;margin: 10px 20px;font-size: 22px;',
'th' => 'font-family: Arial;text-align: left;color: #111111;border: 1px solid #eee;padding: 5px;text-align:center',
'td' => 'font-family: Arial;text-align: left;color: #111111;border: 1px solid #eee;padding: 10px;',
]}

{var $site_url = ('site_url' | option) | preg_replace : '#/$#' : '' | replace:'/ru/':'/'}
{var $assets_url = 'assets_url' | option}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>{'site_name' | option}</title>
</head>
<body style="margin:0;padding:0;background:#f6f6f6;">
<div style="height:100%;padding-top:20px;background:#ffff;">
    {block 'logo'}
      {set $logo_pic = "{$site_url}/tpl/images/paint_box_logo_mail.jpg"}
      <a href="{$site_url}">
        <img style="{$style.logo}"
             src="{$logo_pic | replace:'/ru/':'/'}"
             alt="{$site_url}"
             height="62"/>
      </a>
    {/block}
  <!-- body -->
  <table class="body-wrap" style="padding:0 20px 20px 20px;width: 100%;background:#ffff;margin-top:10px;">
    <tr>
      <td></td>
      <td class="container" style="border:1px solid #f0f0f0;background:#ffffff;width:800px;margin:auto;">
        <div class="content">
          <table style="width:100%;">
            <tr>
              <td>
                <h3 style="{$style.h3}">
                    {block 'title'}
                      miniShop2
                    {/block}
                </h3>

                  {block 'products'}
                    <table style="width:95%;margin:auto;border-collapse: collapse;">
                      <thead>
                      <tr>
                        <th style="{$style.th}">????????</th>
                        <th style="{$style.th}">{'ms2_email_product_name' | lexicon}</th>
                        <th style="{$style.th}">{'ms2_email_item_count' | lexicon}</th>
                        <th style="{$style.th}">{'ms2_email_product_cost' | lexicon}, {'ms2_frontend_currency' | lexicon}</th>
                        <th style="{$style.th}">{'ms2_email_cart_total' | lexicon}, {'ms2_frontend_currency' | lexicon}</th>
                      </tr>
                      </thead>
                        {foreach $products as $product}
                          {var $product_name = $_modx->runSnippet('!getPagetitleLocalizator', ['id' => "{$product.id}",'content' =>'pagetitle' ])}
                          {var $rgb = $_modx->runSnippet('msProductOptions',['product' => "{$product.id}", 'onlyOptions' => 'rgb', 'tpl' => 'tplProductOptionsColor'])}

                          <tr>
                            <td style="{$style.th}">
                                {if $product.options['size'] != ''}
                                    {if $rgb?}
                                        <div class="img" style="width:50px;height:50px;margin: 0 auto;background: rgb({$rgb})!important;"></div>
                                    {else}
                                        <img src="{$logo_pic | replace:'/ru/':'/'}"
                                             alt="{$product_name}"
                                             title="{$product_name}"
                                             width="120"/>
                                    {/if}
                                {else}
                                    {if $product.thumb?}
                                      {var $product_pic = "{$site_url}{$product.thumb}"}
                                      <img src="{$product_pic | replace:'/ru/':'/'}"
                                           alt="{$product_name}"
                                           title="{$product_name}"
                                           width="120" height="90"/>
                                    {else}
                                      <img src="{$logo_pic | replace:'/ru/':'/'}"
                                           alt="{$product_name}"
                                           title="{$product_name}"
                                           width="120"/>
                                    {/if}
                                {/if}
                            </td>
                            <td style="{$style.th}">
                                {if $product.id?}
                                    {if $product.options['size'] != ''}
                                      <a href="{$product.parent | url : ['scheme' => 'full']}" style="{$style.a}">
                                          {$product_name}
                                      </a>
                                    {else}
                                        <a href="{$product.id | url : ['scheme' => 'full']}" style="{$style.a}">
                                            {$product_name}
                                        </a>
                                    {/if}
                                {else}
                                    {$product_name}
                                {/if}
                                {if $product.options?}
                                  <div class="small">
                                      ??????????: {$product.options | join : '; '}
                                  </div>
                                {/if}
                            </td>
                            <td style="{$style.th}">{$product.count} {'ms2_frontend_count_unit' | lexicon}</td>
                            <td style="{$style.th}">{$product.price}</td>
                            {set $total_products_price = $product.price * $product.count}
                            <td style="{$style.th}">{$total_products_price}</td>
                          </tr>
                        {/foreach}
                      <tfoot>
                      <tr>
                        <th style="{$style.th}"></th>
                        <th style="{$style.th}"></th>
                        <th style="{$style.th}">
                            {$total.cart_count} {'ms2_frontend_count_unit' | lexicon}
                        </th>
                        <th style="{$style.th}"></th>
                        <th style="{$style.th}">
                            {$total.cart_cost} {'ms2_frontend_currency' | lexicon}
                        </th>
                      </tr>
                      </tfoot>
                    </table>
                    <h3 style="{$style.h3}">
                      {'ms2_email_cart_total' | lexicon}:
                        {if $total.delivery_cost}
                            {$total.cart_cost} {'ms2_frontend_currency' | lexicon} + {$total.delivery_cost}
                            {'ms2_frontend_currency' | lexicon} =
                        {/if}
                      <strong>{$total.cost}</strong> {'ms2_frontend_currency' | lexicon}
                    </h3>
                  {/block}
              </td>
            </tr>
          </table>
        </div>
        <!-- /content -->
      </td>
      <td></td>
    </tr>
  </table>
  <!-- /body -->
  <!-- footer -->
  <table style="clear:both !important;width: 100%;">
    <tr>
      <td></td>
      <td class="container">
        <!-- content -->
        <div class="content">
          <table style="width:100%;text-align: center;">
            <tr>
              <td align="center">
                <p style="{$style.p}">
                    {block 'footer'}
                      <a href="{$site_url}" style="color: #999999;">
                          {'site_name' | option}
                      </a>
                    {/block}
                </p>
              </td>
            </tr>
          </table>
        </div>
        <!-- /content -->
      </td>
      <td></td>
    </tr>
  </table>
  <!-- /footer -->
</div>
</body>
</html>