<form action="#" class="for-form popup-form">
  <input type="hidden" name="title" value="{$_modx->resource.pagetitle}" />
  <input type="hidden" name="urlproduct" value="{$_modx->config['site_url']}{$_modx->makeUrl($_modx->resource.id)}"/>
  <fieldset>
    <div class="row">
      <div>
        <input type="text" name="name" value="{$_pls['fi.name']}" placeholder="{$_modx->lexicon('call_back_form_name_placeholder')} *">
      </div>
    </div>
    <div class="row">
      <div>
        <input type="text" name="phone" placeholder="+38(___) ___-____" id="phone-callback">
      </div>
    </div>
    <div class="row">
      <button type="submit" class="send1 open-thanks1">{$_modx->lexicon('call_back_form_send_button')}</button>
    </div>
  </fieldset>
</form>