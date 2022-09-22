<section class="section- section-content section-registration">
  <div class="container">
    <div class="column column100 ">
      <div class="column column50">
        <div class="forbuy fororder" id="office-auth-form">
          <form method="post" class="for-form order-form" id="office-auth-login">
            <input type="hidden" name="action" value="auth/formLogin"/>
            <input type="hidden" name="return" value=""/>
            <fieldset>
              <div class="row">
                <div class="form-group">
                  <input type="text" name="username" placeholder="{$_modx->lexicon('profile_login_or_email')} *" class="form-control" id="office-auth-login-username" value=""/>
                </div>
              </div>
              <div class="row">
                <div class="form-group">
                  <input type="password" name="password" placeholder="{$_modx->lexicon('profile_password')} *" class="form-control" id="office-login-form-password" value=""/>
                  <small>{$_modx->lexicon('profile_password_hint')}</small>
                </div>
              </div>
              <hr>
              <div class="row">
                <p>{$_modx->lexicon('profile_are_you_register')} - <a href="{$_modx->makeUrl(405)}">{$_modx->lexicon('profile_register')}</a></p>
              </div>
              <hr>
              <div class="row">
                <button type="submit" class="order">
                  <i class="icon-user-1"></i>
                  <span>{$_modx->lexicon('profile_enter_area_button')}</span>
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

