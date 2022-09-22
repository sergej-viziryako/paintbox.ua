<form action="" method="post" id="office-profile-form" enctype="multipart/form-data" class="for-form order-form">
  <fieldset>
    <input type="hidden" name="username" value="[[+username]]" placeholder="Логин" class="form-control"/>
    <div class="row">
      <div class="form-group">
        <input type="text" name="fullname" placeholder="{$_modx->lexicon('profile_name')}" class="form-control" id="office-register-form-fullname" value="[[+fullname]]"/>
      </div>
    </div>
    <div class="row">
      <div class="form-group">
        <input type="text" name="email" value="[[+email]]" placeholder="Email" class="form-control"/>
        <small>{$_modx->lexicon('profile_new_email_hint')}</small>
      </div>
    </div>
    <div class="row">
      <div class="form-group">
        <input type="password" name="specifiedpassword" value="" placeholder="********" class="form-control"/>
        <small>{$_modx->lexicon('profile_new_password_hint')}</small>
      </div>
    </div>
    <div class="row">
      <div class="form-group">
        <input type="password" name="confirmpassword" value="" placeholder="********" class="form-control"/>
        <small>{$_modx->lexicon('profile_new_password_again_hint')}</small>
      </div>
    </div>
    <div class="row">
      <div class="form-group">
        <input type="text" name="phone" placeholder="+38(___) ___-____" class="phone-callback" value="[[+phone]]"/>
      </div>
    </div>
    <hr>
    <div class="row">
      <div class="form-group">
        <input type="text" name="city" placeholder="{$_modx->lexicon('feedback_form_city_placeholder')}" class="form-control" id="office-register-form-city" value="[[+city]]"/>
      </div>
    </div>
    <div class="row">
      <div class="form-group">
        <input type="text" name="zip" placeholder="{$_modx->lexicon('cart_warehouse_number_placeholder')}" class="form-control" id="office-register-form-metro" value="[[+zip]]"/>
      </div>
    </div>
    <div class="row">
      <div class="form-group">
        <input type="text" name="address" placeholder="{$_modx->lexicon('cart_street_nomer_doma_kvartiry_placeholder')}" class="form-control" id="office-register-form-address" value="[[+address]]"/>
      </div>
    </div>
    <hr>
    <div class="row">
      <button type="submit" class="order">
        <span>{$_modx->lexicon('profile_save_form_button')}</span>
      </button>
    </div>
  </fieldset>
</form>
