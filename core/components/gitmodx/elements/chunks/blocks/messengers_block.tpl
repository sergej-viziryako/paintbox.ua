<div class="block messengers-block">
  <ul class="messengers">
    {if $_modx->config.telegram?}
      <li>
        <a href="tg://resolve?domain={$_modx->config.telegram}">
          <span class="img">
            <img class="lazy" data-src="/tpl/images/telegram-min.webp" alt="" height="28" width="28">
          </span>
          <span class="caption">Telegram</span>
        </a>
      </li>
    {/if}
    {if $_modx->config.whatsapp?}
      <li>
        <a href="whatsapp://send?phone={$_modx->config.whatsapp}">
          <span class="img">
            <img class="lazy" data-src="/tpl/images/whatsapp-min.webp" alt="" height="28" width="28">
          </span>
          <span class="caption">WhatsApp</span>
        </a>
      </li>
    {/if}
    {if $_modx->config.viber?}
      <li>
        <a href="viber://chat?number={$_modx->config.viber}">
          <span class="img">
            <img class="lazy" data-src="/tpl/images/viber-min.webp" alt="" height="28" width="28">
          </span>
          <span class="caption">Viber</span>
        </a>
      </li>
    {/if}
    {if $_modx->config.skype?}
      <li>
        <a href="skype://{$_modx->config.skype}">
      <span class="img">
        <img class="lazy" data-src="/tpl/images/skype-min.webp" alt="" height="28" width="28">
      </span>
          <span class="caption">Skype</span>
        </a>
      </li>
    {/if}
  </ul>
</div>