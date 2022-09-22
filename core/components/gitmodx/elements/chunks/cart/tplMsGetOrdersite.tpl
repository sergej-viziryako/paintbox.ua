<section class="section- section-settlements-order">
  <div class="container">
    <div class="column column100">
      <div class="leftcol column column50 section-order">
        <div class="forbuy forbasket">
          <div class="reg-dannie">
            <div class="ttu">
              {$_modx->lexicon('checkout_success_title')}
            </div>
            <hr>
            <div>
              <span>{$_modx->lexicon('checkout_success_order_number')}: </span> <b>№{$order.num}</b>
            </div>
            <div>
              <span>{$_modx->lexicon('checkout_success_order_status')}: </span>
              <b>
                {if 'cultureKey' | option != 'ru'}
                  {var $order_status = $_modx->runSnippet('!getOrderStatusName',['order_status_id' => "{$order.status}"])}
                  {var $order_status = $_modx->runSnippet('translit',['string'=>"{$order_status | lower | replace:"(":"" | replace:")":""}"])}
                  {$_modx->lexicon($order_status)}
                {else}
                  {$_modx->runSnippet('!getOrderStatusName',['order_status_id' => "{$order.status}"])}
                {/if}
              </b>
            </div>
            <div>
              <span>{$_modx->lexicon('checkout_success_payment_method')}: </span>
              <b>
                {if 'cultureKey' | option != 'ru'}
                  {var $payment_method = $_modx->runSnippet('translit',['string'=>"{$payment.name | lower | replace:"(":"" | replace:")":""}"])}
                  {$_modx->lexicon($payment_method)}
                {else}
                  {$payment.name}
                {/if}
              </b>
            </div>
            <div>
              <span>{$_modx->lexicon('checkout_success_delivery_method')}: </span>
              <b>
                {if 'cultureKey' | option != 'ru'}
                  {var $delivery_method = $_modx->runSnippet('translit',['string'=>"{$delivery.name | lower | replace:"(":"" | replace:")":""}"])}
                  {$_modx->lexicon($delivery_method)}
                {else}
                  {$delivery.name}
                {/if}
              </b>
              {if $order.properties.msnovaposhta.warehouse?}
                {if 'cultureKey' | option != 'ru'}
                  <p>{$order.properties.msnovaposhta.warehouse.SettlementAreaDescription}, м. {$order.properties.msnovaposhta.warehouse.CityDescription}, {$order.properties.msnovaposhta.warehouse.Description}</p>
                {else}
                  <p>{$order.properties.msnovaposhta.area} область, г. {$order.properties.msnovaposhta.warehouse.CityDescriptionRu}, {$order.properties.msnovaposhta.warehouse.DescriptionRu}</p>
                {/if}
              {/if}
              {if $address.properties.extfld_warehouse?}
                <p>{$_modx->lexicon('cart_warehouse_number_placeholder')}: {$address.properties.extfld_warehouse}</p>
              {/if}
            </div>

            {if $address.city?}
              <div>
                <span>{$_modx->lexicon('feedback_form_city_placeholder')}:</span>
                <b>
                  {if $delivery.id == 5}
                    {$order.properties.msnovaposhta.area} область, {$order.properties.msnovaposhta.warehouse.CityDescriptionRu}
                  {else}
                    {$address.city}
                  {/if}
                </b>
              </div>
            {/if}
            <hr>
            <div><b>{$_modx->lexicon('checkout_success_thx')}</b></div>
          </div>
        </div>
      </div>
        <div class="rightcol column column50 section-settlements">
          <div class="forbuy settlements settlements-content">
            <div class="row">
              <div class="title">
                <div class="number">{$_modx->lexicon('checkout_success_your_order')} №{$order.num}</div>
                <div class="date">{$order.createdon}</div>
                <div class="price">{$_modx->lexicon('total_sum_order')}: <b><span class="ms2_total_cost">{$total.cost}</span>  грн</b></div>
              </div>
              <ul>
                {foreach $products as $product}
                  {set $item_pagetitle = $_modx->runSnippet('!getContentLanguage', ['id' => "{$product.id}",'content' =>'pagetitle' ])}
                  <li>
                    <a href="{$product.id | url}" class="caption">
                      {$item_pagetitle}
                    </a>
                    {if $product.options?}
                      <p>{$_modx->lexicon('options')}: {$product.options | join : '; '}</p>
                    {/if}
                    <div class="summa-price">
                      <span class="price"><b>{$product.price}</b> грн</span>
                      <span class="nameral">{$_modx->lexicon('cart_count')}: <b>{$product.count}</b></span>
                      {set $summ =  $product.count * $product.price}
                      <div class="summa">{$_modx->lexicon('checkout_success_total_sum')}: <b>{$summ}</b> грн</div>
                    </div>
                  </li>
                {/foreach}
              </ul>
            </div>
          </div>
      </div>
    </div>
  </div>
</section>


