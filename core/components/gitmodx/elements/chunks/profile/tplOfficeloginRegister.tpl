<section class="section- section-content section-registration">
  <div class="container">
    <div class="column column100 ">
      <div class="column column50">
        <div class="forbuy fororder" id="office-auth-form">
          <form method="post" class="for-form order-form" id="office-auth-register">
            <fieldset>
              <div class="row">
                <div class="form-group">
                  <input type="email" name="email" placeholder="Email *" class="form-control" id="office-auth-register-email" value=""/>
                  <small>{$_modx->lexicon('profile_email_hint')}</small>
                </div>
              </div>
              <div class="row">
                <div class="form-group">
                  <input type="text" name="fullname" placeholder="{$_modx->lexicon('profile_name')} *" class="form-control" id="office-register-form-fullname" value=""/>
                  <small>{$_modx->lexicon('profile_name_hint')}</small>
                </div>
              </div>
              <hr>
              <div class="row">
                <button type="submit" class="order">
                  <i class="icon-user-1"></i>
                  <span>{$_modx->lexicon('profile_register_button')}</span>
                </button>
              </div>
            </fieldset>
          </form>
        </div>
      </div>
      <div class="column column50">
        <div class="forbuy forbasket">
          {include 'advantages_profile'}
        </div>
      </div>
    </div>
  </div>
</section>



