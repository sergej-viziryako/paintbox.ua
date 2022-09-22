{if !count($products)}
  <section class="section- section-content">
    <div class="container">
      <div class="page404-block">
        <div class="page404">
          <div class="img">
            <i class="icon-shopping-bag"></i>
          </div>
          <div class="text">
            <div class="caption">
              {$_modx->lexicon('basket_empty_title')}
            </div>
            <p>
              {$_modx->lexicon('basket_empty_desc')}
            </p>
          </div>
        </div>
      </div>
    </div>
  </section>
{/if}


