{var $lang = $_modx->config.cultureKey}
{if $code?}
  {if $lang == 'ua'}
    Для активації пароля {$password}, вкажіть секретний код: {$code}.
  {else}
    Для активации пароля {$password}, укажите секретный код: {$code}.
  {/if}
{else}
  {if $lang == 'ru'}
    <p>Вы (или кто-то другой) запросил сброс пароля для вашей учётной записи на сайте {'site_name' | config}.</p>
    <p>Если это действительно были вы, то вам нужно <a href="{$link}">пройти по ссылке</a>,
      для активации нового пароля: <strong>{$password}</strong><br/>
      В противном случае, просто удалите это письмо.</p>
  {else}
    <p> Ви (або хтось інший) зробив запит скидання пароля для вашого облікового запису на сайті {'site_name' | config}. </p>
    <p> Якщо це дійсно були ви, то вам потрібно <a href="{$link}"> пройти за посиланням </a>,
      для активації нового пароля: <strong> {$password}</strong> <br/>
      В іншому випадку, просто видаліть цей лист. </p>

  {/if}
{/if}