{var $lang = $_modx->config.cultureKey}
{if $code?}
  {if $lang == 'ua'}
    Ви зареєструвалися на {$_modx->config.form_site_name} {if $password?}, ваш пароль: {$password} {/if}. Ваш код активації: {$code}.
  {else}
    Вы зарегистрировались на {$_modx->config.form_site_name} {if $password?}, ваш пароль: {$password}{/if}. Ваш код активации: {$code}.
  {/if}
{else}
  {if $lang == 'ua'}
    <p> Ви успішно зареєструвалися на сайті {$_modx->config.form_site_name}, вказавши email {$email}. </p>
    <p> Тепер вам потрібно <a href="{$link}"> пройти за посиланням </a>, щоб активувати обліковий запис. <br/>
        {if $password?}
      <br/> Ваш пароль: <strong> {$password} </strong>. Не забудьте поміняти його на свій!
      {/if}
    </p>
  {else}
    <p>Вы успешно зарегистрировались на сайте {$_modx->config.form_site_name}, указав email {$email}.</p>
    <p>Теперь вам нужно <a href="{$link}">пройти по ссылке</a>, чтобы активировать учётную запись.<br/>
      {if $password?}
        <br/>Ваш пароль: <strong>{$password}</strong>. Не забудьте поменять его на свой!
      {/if}
    </p>
  {/if}
{/if}