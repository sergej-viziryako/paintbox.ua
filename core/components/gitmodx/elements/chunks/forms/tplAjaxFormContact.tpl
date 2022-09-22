<div class="caption-form">{$_modx->lexicon('contacts_feedback_form_title')}:</div>
<div class="description-form">
</div>
<form action="#" class="for-form order-form send-form">
  <fieldset>
    <div class="row">
      <div>
        <input type="text" name="name" value="{$_pls['fi.name']}" placeholder="{$_modx->lexicon('call_back_form_name_placeholder')} *">
      </div>
    </div>
    <div class="row">
      <div>
        <input type="text" name="phone" placeholder="+38(___) ___-____" class="phone-callback">
      </div>
    </div>
    <div class="row">
      <div>
        <input type="text" name="email" value="{$_pls['fi.email']}" placeholder="E-mail">
      </div>
    </div>
    <div class="row">
      <div>
        <textarea name="text" id="" cols="30" rows="6" placeholder="{$_modx->lexicon('form_message_placeholder')}"></textarea>
      </div>
    </div>
   {* <div class="row">
      [[!recaptchav2_render]]
      [[!+fi.error.recaptchav2_error]]
    </div>*}
    <div class="row row-actions">
      <button type="submit" class="send1 open-thanks1">{$_modx->lexicon('call_back_form_send_button')}</button>
    </div>
  </fieldset>
</form>