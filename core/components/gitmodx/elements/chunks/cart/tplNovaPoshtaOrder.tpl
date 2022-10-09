<section class="section- section-leftright section-order">
  <div class="container">
    <div class="column column100">
      <div class="column column50 leftcol">
        <div class="forbuy forbasket">
            {$_modx->runSnippet('!mspcForm', ['tpl' => 'tplMspcForm'])}
            {$_modx->runSnippet('!msCart',['tpl'=>'tplMsCartSite'])}
        </div>
      </div>
      <div class="column column50 rightcol">
        <div class="forbuy fororder">
          <form class="for-form order-form ms2_form" id="msOrder" method="post">
            <fieldset>
              <div class="row">
                <div id="deliveries">
                  <h4>{$_modx->lexicon('delivery_name_title')}:</h4>
                    {foreach $deliveries as $delivery index=$index}
                        {var $checked = !($order.delivery in keys $deliveries) && $index == 0 || $delivery.id == $order.delivery}
                      <label class="delivery input-parent">
                        <input type="radio" style="box-shadow: none; padding: 0px; width: auto" name="delivery" value="{$delivery.id}" id="delivery_{$delivery.id}" data-payments="{$delivery.payments | json_encode}"{$checked ? 'checked' : ''}>
                          {if 'cultureKey' | option != 'ua'}
                              {var $delivery_method = $_modx->runSnippet('translit',['string'=>"{$delivery.name | lower | replace:"(":"" | replace:")":""}"])}
                              {if $delivery.logo?}
                                <img src="{$delivery.logo}" alt="{$_modx->lexicon($delivery_method)}" title="{$_modx->lexicon($delivery_method)}"/>
                              {else}
                                <span>{$_modx->lexicon($delivery_method)}</span>
                              {/if}
                              {if $delivery.description?}
                                  {var $delivery_method_description = 'delivery_'~$delivery.id~'_description'}
                                <p class="small">
                                  <span>{$_modx->lexicon($delivery_method_description)}</span>
                                </p>
                              {/if}
                          {else}
                              {if $delivery.logo?}
                                <img src="{$delivery.logo}" alt="{$delivery.name}" title="{$delivery.name}"/>
                              {else}
                                <span>{$delivery.name}</span>
                              {/if}
                              {if $delivery.description?}
                                <p class="small">
                                  <span>{$delivery.description}</span>
                                </p>
                              {/if}
                          {/if}
                      </label>
                    {/foreach}
                </div>
              </div>
              <div class="row">
                <div id="payments">
                  <h4>{$_modx->lexicon('payment_name_title')}:</h4>
                    {foreach $payments as $payment index=$index}
                        {var $checked = !($order.payment in keys $payments) && $index == 0 || $payment.id == $order.payment}
                        {if $.get.payment == 6 AND $payment.id == 6}
                            {var $checked = 'checked'}
                        {elseif $.get.payment == 5 AND $payment.id == 5}
                            {var $checked = 'checked'}
                        {else}
                            {var $checked = ''}
                        {/if}
                      <label class="payment input-parent">
                        <input style="box-shadow: none; padding: 0px; width: auto" type="radio" name="payment" value="{$payment.id}" id="payment_{$payment.id}" {*if $payment.id == 1}checked{/if*} {$checked}>

                          {if 'cultureKey' | option != 'ua'}
                              {var $payment_method = $_modx->runSnippet('translit',['string'=>"{$payment.name | lower | replace:"(":"" | replace:")":""}"])}
                              {if $payment.logo?}
                                <img src="{$payment.logo}" alt="{$_modx->lexicon($payment_method)}" title="{$_modx->lexicon($payment_method)}"/>
                              {else}
                                <span>{$_modx->lexicon($payment_method)}</span>
                              {/if}
                              {if $payment.description?}
                                  {var $payment_method_description = 'payment_'~$payment.id~'_description'}
                                <p class="small">
                                    {$_modx->lexicon($payment_method_description)}
                                </p>
                              {/if}
                          {else}
                              {if $payment.logo?}
                                <img src="{$payment.logo}" alt="{$payment.name}" title="{$payment.name}"/>
                              {else}
                                <span>{$payment.name}</span>
                              {/if}
                              {if $payment.description?}
                                <p class="small">
                                  <span>{$payment.description}</span>
                                </p>
                              {/if}
                          {/if}
                      </label>

                        {if $payment.id == 6}
                          <div class="prop_select_ii" style="{$checked ? 'display: block' : 'display: none'}">
                            <select id="termInputII" name="selectII" class="form-control" min="1" max="24">
                              <option value="2">1 {$_modx->lexicon('payment_month')}</option>
                              <option value="3">2 {$_modx->lexicon('payment_month')}</option>
                              <option value="4">3 {$_modx->lexicon('payment_month')}</option>
                              <option value="5">4 {$_modx->lexicon('payment_month')}</option>
                              <option value="6">5 {$_modx->lexicon('payment_month')}</option>
                              <option value="7">6 {$_modx->lexicon('payment_month')}</option>
                              <option value="8">7 {$_modx->lexicon('payment_month')}</option>
                              <option value="9">8 {$_modx->lexicon('payment_month')}</option>
                              <option value="10">9 {$_modx->lexicon('payment_month')}</option>
                              <option value="11">10 {$_modx->lexicon('payment_month')}</option>
                              <option value="12">11 {$_modx->lexicon('payment_month')}</option>
                              <option value="13">12 {$_modx->lexicon('payment_month')}</option>
                              <option value="14">13 {$_modx->lexicon('payment_month')}</option>
                              <option value="15">14 {$_modx->lexicon('payment_month')}</option>
                              <option value="16">15 {$_modx->lexicon('payment_month')}</option>
                              <option value="17">16 {$_modx->lexicon('payment_month')}</option>
                              <option value="18">17 {$_modx->lexicon('payment_month')}</option>
                              <option value="19">18 {$_modx->lexicon('payment_month')}</option>
                              <option value="20">19 {$_modx->lexicon('payment_month')}</option>
                              <option value="21">20 {$_modx->lexicon('payment_month')}</option>
                              <option value="22">21 {$_modx->lexicon('payment_month')}</option>
                              <option value="23">22 {$_modx->lexicon('payment_month')}</option>
                              <option value="24">23 {$_modx->lexicon('payment_month')}</option>
                              <option value="25">24 {$_modx->lexicon('payment_month')}</option>
                            </select>
                              {var $order_cost_pp = $order.cost | replace : " " : "" / 2}
                            <div class="prop_permounth_ii"> {$_modx->lexicon('payments_count')} <span id="payment_val_ii">2</span> по <span id="prop_permounth_ii">{$order_cost_pp}</span> грн/{$_modx->lexicon('payment_month')}</div>
                          </div>
                        {/if}
                        {if $payment.id == 5}
                          <div class="prop_select_pp" style="{$checked ? 'display: block' : 'display: none'}">
                            <select id="termInputPP" name="selectPP" class="form-control" min="1" max="9">
                              <option value="2">1 {$_modx->lexicon('payment_month')}</option>
                              <option value="3">2 {$_modx->lexicon('payment_month')}</option>
                              <option value="4">3 {$_modx->lexicon('payment_month')}</option>
                              <option value="5">4 {$_modx->lexicon('payment_month')}</option>
                              <option value="6">5 {$_modx->lexicon('payment_month')}</option>
                              <option value="7">6 {$_modx->lexicon('payment_month')}</option>
                              <option value="8">7 {$_modx->lexicon('payment_month')}</option>
                              <option value="9">8 {$_modx->lexicon('payment_month')}</option>
                              <option value="10">9 {$_modx->lexicon('payment_month')}</option>
                            </select>
                              {var $order_cost_pp = $order.cost | replace : " " : "" / 2}
                            <div class="prop_permounth_pp"> {$_modx->lexicon('payments_count')} <span id="payment_val_pp">2</span> по <span id="prop_permounth_pp">{$order_cost_pp}</span> грн/{$_modx->lexicon('payment_month')}</div>
                          </div>
                        {/if}
                    {/foreach}
                </div>
              </div>
              <hr>
              <div class="row">
                <div class="form-group">
                    {foreach ['receiver'] as $field}
                      <input type="text" id="{$field}" placeholder="{$_modx->lexicon('feedback_form_name_placeholder')} *" name="{$field}" value="{$form[$field]}"  class="form-control{($field in list $errors) ? ' error' : ''}">
                    {/foreach}
                </div>
              </div>
              <div class="row">
                <div class="form-group">
                    {foreach ['email'] as $field}
                      <input type="text" id="{$field}" placeholder="Email" name="{$field}" value="{$form[$field]}"  class="form-control{($field in list $errors) ? ' error' : ''}">
                    {/foreach}
                </div>
              </div>
              <div class="row">
                <div class="form-group">
                    {foreach ['phone'] as $field}
                      <input type="text" id="phone-contact" placeholder="+38(___) ___-__-__"  name="{$field}" value="{$form[$field]}"  class="form-control{($field in list $errors) ? ' error' : ''}">
                    {/foreach}
                </div>
              </div>

              {var $pls = $_modx->getPlaceholders()}
              {var $active =  $order.delivery == $pls['msnovaposhta_delivery']['ids']['default'] ? 'msnp-address-set--active' : ''}
              {var $hide =  $order.delivery == $pls['msnovaposhta_delivery']['default_hide'] ? 'msnp-address-set--hide' : ''}
              <div class="col-md-6 msnp-address-set {$active} {$hide} msnp-address-set-{$pls['msnovaposhta_delivery']['ids']['default']}">
                {foreach ['city'] as $field}
                  <div class="row address-block-city">
                    <div class="form-group input-parent">
                      <input type="text" id="{$field}" placeholder="{$_modx->lexicon('delivery_ukrposhta_city')}" name="{$field}" value="{$form[$field]}" class="form-control{($field in list $errors) ? ' error' : ''}">
                    </div>
                  </div>
                {/foreach}
                <div class="row address-block ">
                  <div class="form-group">
                    <input type="text" placeholder="{$_modx->lexicon('delivery_ukrposhta_otdelenie')}"  name="extfld_warehouse" value=""  class="">
                  </div>
                </div>
              </div>

              <!-- msnovaposhta pickup -->
                {if $pls['msnovaposhta_delivery']['ids']['pickup']?}
                  {var $active =  $order.delivery == $pls['msnovaposhta_delivery']['ids']['pickup'] ? 'msnp-address-set--active' : ''}
                  <div class="col-md-6 msnp-address-set {$active} msnp-address-set-{$pls['msnovaposhta_delivery']['ids']['pickup']}">
                    {var $name = 'msnovaposhta_area_ref'}
                    <div class="form-group input-parent">
                      <label class="col-md-4 control-label" for="{$name}_pickup">
                        <span class="required-star">*</span> {$name | lexicon}
                      </label>
                      <div class="col-sm-6">
                        <select name="{$name}" class="input-sm form-control{($name in list $errors) ? ' error' : ''}"
                                id="{$name}_pickup">
                          <option value="" data-name="">-</option>
                            {foreach $pls[$name] as $row}
                              <option value="{$row['Ref']}"
                                      data-name="{$row['Ref']}">
                                  {if 'cultureKey' | option != 'ua'}
                                      {$row['DescriptionRu']}
                                  {else}
                                      {$row['Description']}
                                  {/if}
                              </option>
                            {/foreach}
                        </select>
                      </div>
                    </div>
                    {var $name = 'msnovaposhta_city_ref'}
                    <div class="form-group input-parent">
                      <label class="col-md-4 control-label" for="{$name}_pickup">
                        <span class="required-star">*</span> {$name | lexicon}
                      </label>
                      <div class="col-md-6">
                        <select name="{$name}" class="input-sm form-control{($name in list $errors) ? ' error' : ''}" id="{$name}_pickup">
                          {foreach $pls[$name] as $row}
                            <option value="{$row['Ref']}" data-name="{$row['Ref']}">
                                {$row['DescriptionRu']}
                            </option>
                          {/foreach}
                        </select>
                      </div>
                    </div>
                    {var $name = 'msnovaposhta_warehouse_ref'}
                    <div class="form-group input-parent">
                      <label class="col-md-4 control-label" for="{$name}_pickup">
                        <span class="required-star">*</span> {$name | lexicon}
                      </label>
                      <div class="col-md-6">
                        <select name="{$name}" class="input-sm form-control{($name in list $errors) ? ' error' : ''}" id="{$name}_pickup">
                          {foreach $pls[$name] as $row}
                            <option value="{$row['Ref']}" data-name="{$row['Ref']}">
                                {if 'cultureKey' | option != 'ua'}
                                    {$row['DescriptionRu']}
                                {else}
                                    {$row['Description']}
                                {/if}
                            </option>
                          {/foreach}
                        </select>
                        <div class="msnp-marker msnp-marker--pulse msnp-marker--right" data-animate="bounce">
                          <div class="msnp-marker-pin"></div>
                          <div class="msnp-marker-pulse"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                {/if}
              <!-- / msnovaposhta pickup -->
              <!-- msnovaposhta courier -->
                {if $pls['msnovaposhta_delivery']['ids']['courier']?}
                  {var $active =  $order.delivery == $pls['msnovaposhta_delivery']['ids']['courier'] ? 'msnp-address-set--active' : ''}
                  <div class="col-md-6 msnp-address-set {$active} msnp-address-set-{$pls['msnovaposhta_delivery']['ids']['courier']}">
                    {var $name = 'msnovaposhta_area_ref'}
                    <div class="form-group input-parent">
                      <label class="col-md-4 control-label" for="{$name}_courier">
                        <span class="required-star">*</span> {$name | lexicon}
                      </label>
                      <div class="col-md-6">
                        <select name="{$name}" class="input-sm form-control{($name in list $errors) ? ' error' : ''}" id="{$name}_courier">
                          <option value="" data-name="">-</option>
                          {foreach $pls[$name] as $row}
                            <option value="{$row['Ref']}" data-name="{$row['Ref']}">
                              {if 'cultureKey' | option != 'ua'}
                                  {$row['DescriptionRu']}
                              {else}
                                  {$row['Description']}
                              {/if}
                            </option>
                          {/foreach}
                        </select>
                      </div>
                    </div>

                    {var $name = 'msnovaposhta_city_ref'}
                    <div class="form-group input-parent">
                      <label class="col-md-4 control-label" for="{$name}_courier">
                        <span class="required-star">*</span> {$name | lexicon}
                      </label>
                      <div class="col-md-6">
                        <select name="{$name}" class="input-sm form-control{($name in list $errors) ? ' error' : ''}" id="{$name}_courier">
                          {foreach $pls[$name] as $row}
                            <option value="{$row['Ref']}" data-name="{$row['Ref']}">
                              {$row['Description']}
                            </option>
                          {/foreach}
                        </select>
                      </div>
                    </div>
                    <div class="form-group input-parent">
                      <label class="col-md-4 control-label" for="street"><span class="required-star">*</span> {'ms2_frontend_street' | lexicon}</label>
                      <div class="col-md-6 row">
                          {foreach ['street','building','room'] as $field}
                            <div class="col-md-4">
                              <input type="text" id="{$field}_courier" placeholder="{('ms2_frontend_' ~ $field) | lexicon}" name="{$field}" value="{$form[$field]}" class="form-control{($field in list $errors) ? ' error' : ''}">
                            </div>
                          {/foreach}
                      </div>
                    </div>
                  </div>
                {/if}
              <!-- / msnovaposhta courier -->

              <div class="row">
                <div>
                  <textarea name="comment" id="comment" placeholder="{$_modx->lexicon('order_comment_placeholder')}" class="form-control{('comment' in list $errors) ? ' error' : ''}">{$form.comment}</textarea>
                </div>
              </div>
              <hr>
              <div class="row summa-order">
                <span>{$_modx->lexicon('total_sum_order')}:</span>
                <span class="allprice"><span id="ms2_order_cost">{$order.cost ?: 0}</span> грн</span>
              </div>
              <hr>
              <div class="row">
                <button type="submit" class="order" name="ms2_action" value="order/submit">
                  <span>{$_modx->lexicon('button_order_submit')}</span>
                </button>
              </div>
            </fieldset>
          </form>
        </div>
      </div>
    </div>
</section>