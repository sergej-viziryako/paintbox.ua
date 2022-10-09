<div class="popup-holder-content popup-holder-menu-content">
  <div class="popup popup-menu">
    <div class="popup-content popup-menu-content">
    </div>
    <a href="#" class="close-popup close-menu">
      <i class="icon-cancel"></i>
    </a>
  </div>
</div>
<div class="popup-holder-content popup-holder-catalog-content">
  <div class="popup popup-catalog">
    <div class="popup-content popup-catalog-content">
    </div>
    <a href="#" class="close-popup close-catalog">
      <i class="icon-cancel"></i>
    </a>
  </div>
</div>
<div class="popup-holder-content popup-holder-contacts-content">
  <div class="popup popup-contacts">
    <div class="popup-content popup-contacts-content">
      {include 'contacts_full_block'}
      {include 'messengers_block'}
      <div class="block callback-block">
        <a href="#" class="callback open-popup open-callback">
          <i class="icon-phone-call"></i>
          <span>{$_modx->lexicon('call_back_button')}</span>
        </a>
      </div>
    </div>
    <a href="#" class="close-popup close-contacts">
      <i class="icon-cancel"></i>
    </a>
  </div>
</div>
<div class="popup-holder-content  popup-holder-callback-content">
  <div class="popup popup-callback">
    <div class="popup-content popup-callback-content">
      <div class="caption-popup">{$_modx->lexicon('call_back_form_title')}:</div>
      <div class="description-popup">
        <p>{$_modx->lexicon('call_back_form_desc')}</p>
      </div>
      {$_modx->runSnippet(
      '!AjaxForm',
        [
        'snippet' => 'FormIt',
        'form' => 'tplAjaxFormCallback',
        'formName' => 'Форма заказа обратного звонка с сайта',
        'formFields' => 'name,phone,title,urlproduct',
        'fieldNames' => 'name==Имя,phone==Телефон, title==Название страницы, urlproduct==Заказ обратного звонка был вызван со страницы',
        'hooks' => 'FormItSaveForm,email,telegrambot',
        'emailSubject' => "Заказ обратного звонка с сайта {$_modx->config.form_site_name}",
        'emailTo' => "{$_modx->config.email_sender}",
        'emailTpl' => 'tplOrderFormCallback',
        'emailFrom' => "{$_modx->config.from_email_sender}",
        'validate' => 'name:required,phone:required',
        'validationErrorMessage' => "{$_modx->lexicon('callback_form_error')}",
        'successMessage' => "{$_modx->lexicon('callback_form_success')}"
        ]
      )}
    </div>
    <a href="#" class="close-popup close-callback">
      <i class="icon-cancel"></i>
    </a>
  </div>
</div>

{if $_modx->resource.template in list [20]}
{*Credit Begin*}
<div class="popup-holder-content  popup-holder-credit-content">
  <div class="popup popup-credit">
    <div class="popup-content popup-credit-content">
      <div class="caption-popup">{$_modx->lexicon('form_choose_credit_title')}:</div>
      <div class="description-popup">
        <p>{$_modx->lexicon('form_choose_credit_desc')}</p>
      </div>
      <div id="ukrcredit-popup" class="white-popup mfp-with-anim">
        {if $_modx->config.include_credit_pp == 1}
          <div id="propPP" class="proposition" >
            <div class="prop_name">
              <img src="/tpl/images/credit_pp_logo.webp" alt="{$_modx->lexicon('form_choose_credit_pp_privat')}">
              <span>{$_modx->lexicon('form_choose_credit_pp_privat')}</span>
              <form method="post" action="cart?payment=5">
                <input type="hidden" name="id" value="{$_modx->resource.id}">
                <input type="hidden" name="count" value="1">
                <button type="submit" class="credit-link" name="ms2_action" value="cart/add">{$_modx->lexicon('form_choose_credit_submit_button')}</button>
              </form>
            </div>
          </div>
        {/if}
        {if $_modx->config.include_credit_ii == 1}
          <div id="propII" class="proposition">
            <div class="prop_name">
              <img src="/tpl/images/credit_ii_logo.webp" alt="{$_modx->lexicon('form_choose_credit_rassrochka_privat')}">
              <span>{$_modx->lexicon('form_choose_credit_rassrochka_privat')}</span>
              <form method="post" action="cart?payment=6">
                <input type="hidden" name="id" value="{$_modx->resource.id}">
                <input type="hidden" name="count" value="1">
                <button type="submit" class="credit-link" name="ms2_action" value="cart/add">{$_modx->lexicon('form_choose_credit_submit_button')}</button>
              </form>
            </div>
          </div>
        {/if}
        {if $_modx->config.include_credit_mb == 1}
          <div id="propMB" class="proposition">
            <div class="prop_name">
              <img src="/tpl/images/credit_mb_logo.webp" alt="{$_modx->lexicon('form_choose_credit_pp_mono')}">
              <span>{$_modx->lexicon('form_choose_credit_pp_mono')}</span>
              <form method="post">
                <input type="hidden" name="id" value="{$_modx->resource.id}">
                <input type="hidden" name="count" value="1">
                <button type="submit" class="credit-link" name="ms2_action" value="cart/add">{$_modx->lexicon('form_choose_credit_submit_button')}</button>
              </form>
            </div>
          </div>
        {/if}
      </div>
    </div>
    <a href="#" class="close-popup close-credit">
      <i class="icon-cancel"></i>
    </a>
  </div>
</div>
{*Credit End*}
{/if}

<div class="popup-holder-content  popup-holder-thanks-content">
  <div class="popup popup-thanks">
    <div class="popup-content popup-thanks-content">
      <div class="caption-popup">{$_modx->lexicon('call_back_form_tnx_title')}</div>
      <div class="description-popup">
        <p>{$_modx->lexicon('call_back_form_tnx_desc')}</p>
      </div>
    </div>
    <a href="#" class="close-popup close-thanks">
      <i class="icon-cancel"></i>
    </a>
  </div>
</div>

<script>
function checkParams() {
  var query = $('#query').val();
  if(query.length != 0) {
    $('#submit-query').removeAttr('disabled');
  } else {
    $('#submit-query').attr('disabled', 'disabled');
  }
}
</script>

<a href="#totop" id="gototop">
  <i class="icon-up-chevron"></i>
</a>

{if $_modx->config.footer_scripts?}
  {$_modx->config.footer_scripts}
{/if}

{if $_modx->config.show_cookie_info?}
  <script type="text/javascript" id="cookieinfo"
    {if $_modx->config.cultureKey != 'ua'}
      src="/tpl/js/cookieinfo.js"
    {else}
      src="/tpl/js/cookieinfoUA.js"
    {/if}
    data-bg="#333333"
    data-fg="#FFFFFF"
    data-link="#DC153D"
    data-cookie="CookieInfoScript"
    data-text-align="left"
    data-message-text="{$_modx->lexicon('cookie_info')}"
    data-close-text="{$_modx->lexicon('cookie_button')}" defer>
  </script>
{/if}

{if $_modx->config.spoil_copy_content?}
<script type="text/javascript">function addTrans() { var d=document.getElementsByTagName('body')[0];var e=window.getSelection();var c=e+"";var f="С с Е е Т О о р Р А а Н К Х х В М y З 3".split(/ +/g);var g="C c E e T O o p P A a H K X x B M у 3 З".split(/ +/g);var b;for(var b=0;b<f.length;b++) { c=c.split(f[b]).join(g[b]) } var a=document.createElement('div');a.style.position='absolute';a.style.left='-99999px';d.appendChild(a);a.innerHTML=c;e.selectAllChildren(a);window.setTimeout(function() { d.removeChild(a) } ,0) } document.oncopy=addTrans;</script>
{/if}

{if $_modx->config.add_copy_paste_info?}
  <script>
    document.oncopy = function () {
      var bodyElement = document.body;
      var selection = getSelection();
      var href = document.location.href;
      var copyright = "<br>---------<br>{$_modx->lexicon('additional_text_copy')}";
      var text = selection + copyright;
      var divElement = document.createElement('div');
      divElement.style.position = 'absolute';
      divElement.style.left = '-99999px';
      divElement.innerHTML = text;
      bodyElement.appendChild(divElement);
      selection.selectAllChildren(divElement);
      setTimeout(function() {
        bodyElement.removeChild(divElement);
      }, 0);
    };
  </script>
{/if}
