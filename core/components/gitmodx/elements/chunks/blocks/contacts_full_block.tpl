<div class="block contacts-block">
  <ul class="contacts">
      {if $_modx->config.tel_one?}
        <li>
          <a href="tel:{$_modx->config.tel_one | clean_string}">
            <i class="icon-phone-call1"></i>
            <span class="text">
              <span>{$_modx->config.tel_one}</span>
            </span>
          </a>
        </li>
      {/if}
      {if $_modx->config.tel_two?}
        <li>
          <a href="tel:+{$_modx->config.tel_two | clean_string}">
            <i class="icon-smartphone"></i>
            <span class="text">
              <span>{$_modx->config.tel_two}</span>
            </span>
          </a>
        </li>
      {/if}
      {if $_modx->config.tel_three?}
        <li>
          <a href="tel:+{$_modx->config.tel_three | clean_string}">
            <i class="icon-smartphone"></i>
            <span class="text">
              <span>{$_modx->config.tel_three}</span>
            </span>
          </a>
        </li>
      {/if}
      {if $_modx->config.tel_four?}
        <li>
          <a href="tel:+{$_modx->config.tel_four | clean_string}">
            <i class="icon-smartphone"></i>
            <span class="text">
              <span>{$_modx->config.tel_four}</span>
            </span>
          </a>
        </li>
      {/if}
      {if $_modx->config.email?}
        <li class="email">
          <a href="mailto:{$_modx->config.email}">
            <i class="icon-email"></i>
            <span class="text">
            <span>{$_modx->config.email}</span>
          </span>
          </a>
        </li>
      {/if}
  </ul>
</div>