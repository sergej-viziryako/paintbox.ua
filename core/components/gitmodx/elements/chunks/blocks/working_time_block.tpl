{if $_modx->config.cultureKey != 'ua'}
  {set $adress = $_modx->config.adress}
{else}
  {set $adress = $_modx->config.adressUA}
{/if}
{if $adress?}
  <div class="block contacts-block">
    <ul class="contacts">
      <li class="adress">
        <a href="{$_modx->config.adress_google_maps}" target="_blank" rel="nofollow">
          <i class="icon-pin"></i>
          <span class="text">
            <span>{$adress}</span>
          </span>
        </a>
      </li>
    </ul>
  </div>
{/if}
<div class="footer-caption">
  <span>{$_modx->lexicon('working_time')}</span>
</div>
<div class="time-block">
  <ul class="time">
    {if $_modx->config.cultureKey != 'ua'}
      {$_modx->config.working_hours}
    {else}
      {$_modx->config.working_hoursUA}
    {/if}
  </ul>
</div>