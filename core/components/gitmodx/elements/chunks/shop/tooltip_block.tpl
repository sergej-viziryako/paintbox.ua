<div class="tooltip-block">
  {if $_modx->config.include_credit_pp == 1}
    <span class="tooltip" data-tooltip-title="{$_modx->lexicon('form_choose_credit_pp_privat')} до 9 {$_modx->lexicon('credit_month')}">
      <img src="/tpl/images/pb1.webp" alt="{$_modx->lexicon('form_choose_credit_pp_privat')}" height="40" width="40">
      <span>9</span>
    </span>
  {/if}
  {if $_modx->config.include_credit_ii == 1}
    <span class="tooltip" data-tooltip-title="{$_modx->lexicon('form_choose_credit_rassrochka_privat')} до 24 {$_modx->lexicon('credit_month')}">
      <img src="/tpl/images/pb2.webp" alt="{$_modx->lexicon('form_choose_credit_rassrochka_privat')}" height="40" width="40">
      <span>24</span>
    </span>
  {/if}
  {if $_modx->config.include_credit_mb == 1}
    <span class="tooltip" data-tooltip-title="{$_modx->lexicon('form_choose_credit_pp_mono')} до 10 {$_modx->lexicon('credit_month')}">
      <img src="/tpl/images/mb1.webp" alt="{$_modx->lexicon('form_choose_credit_pp_mono')}" height="40" width="40">
      <span>10</span>
    </span>
  {/if}
</div>