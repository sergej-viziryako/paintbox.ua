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
  </ul>
  <a href="#" class="contacts-more open-popup open-contacts">
    <i class="icon-down-chevron"></i>
  </a>
</div>