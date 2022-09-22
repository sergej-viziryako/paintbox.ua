<section class="section- section-cabinet">
  <div class="container">
    <div class="column column100">
      <ul class="tabset-cabinet">
        <li>
          <a title="#tab1-0">
            <span>{$_modx->lexicon('profile_orders')}</span>
          </a>
        </li>
        <li>
          <a title="#tab2-0">
            <span>{$_modx->lexicon('profile_your_data')}</span>
          </a>
        </li>
        <li>
          <a title="#tab3-0">
            <span>{$_modx->lexicon('profile_edit_your_data')}</span>
          </a>
        </li>
      </ul>
      <div class="tab-content">
        <div id="tab1-0" class="tab active">
          <div class="total-settlements">
            <div class="forbuy settlements settlements-content">
              {$_modx->runSnippet('!msOrders',['limit' => 0])}
            </div>
          </div>
        </div>
        <div id="tab2-0" class="tab js-tab-hidden">
          <div class="column column50">
            <div class="forbuy forbasket">
              <div class="reg-dannie">
                {include 'profile_data'}
              </div>
              <a href="{$_modx->makeUrl($_modx->resource.id)}?action=auth/logout" class="perehod">{$_modx->lexicon('profile_logout')}</a>
            </div>
          </div>
        </div>
        <div id="tab3-0" class="tab js-tab-hidden">
          <div class="column column50">
            <div class="forbuy fororder">
              {$_modx->runSnippet(
              '!officeProfile',
              [
                'HybridAuth' => 0,
                'tplProfile' => 'tplOfficeProfileForm',
                'tplActivate' => 'tplOfficeProfileActivate',
                'profileFields' => 'username:50,email:50,fullname:50,phone:20,mobilephone:20,dob:10,gender,address,country,city,state,zip,fax,photo,comment,website,specifiedpassword,confirmpassword,birthdate'
              ]
              )}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

