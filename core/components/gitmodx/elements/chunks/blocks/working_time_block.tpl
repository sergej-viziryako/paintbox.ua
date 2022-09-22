{if $_modx->config.cultureKey != 'ru'}
  {set $adress = $_modx->config.adressUA}
{else}
  {set $adress = $_modx->config.adress}
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
    {if $_modx->config.cultureKey != 'ru'}
      {$_modx->config.working_hoursUA}
    {else}
      {$_modx->config.working_hours}
    {/if}
  </ul>
</div>