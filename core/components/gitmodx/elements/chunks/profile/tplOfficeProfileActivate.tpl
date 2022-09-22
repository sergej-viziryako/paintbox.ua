{var $lang = $_modx->config.cultureKey}
{if $code?}
  {if $lang == 'ua'}
    Ваш код підтвердження нового номера: {$code}.
  {else}
    Ваш код подтверждения нового номера: {$code}.
  {/if}
{else}
  {if $lang == 'ua'}
    <p> Ви змінили email в своєму профілі на сайті {$_modx->config.form_site_name}. </p>
    <p> Для підтвердження нового адреси вам потрібно <a href="{$link}"> пройти за посиланням </a>. </p>
  {else}
    <p>Вы изменили email в своём профиле на сайте {$_modx->config.form_site_name}.</p>
    <p>Для подтверждения нового адреса вам нужно <a href="{$link}">пройти по ссылке</a>.</p>
  {/if}
{/if}