{if $_modx->config.cultureKey != 'ua'}
    {set $current_items = $_modx->runSnippet(
    'msProducts',
    [
    'tpl'=>'tplProductTable',
    'parents' => "{$_modx->resource.id}",
    'depth' => 1,
    'showLog' => 0,
    'limit' => 8,
    'sortby' => 'RAND()',
    'sortdir' => 'ASC',
    'tvPrefix' => '',
    'includeContent' => 1,
    'showZeroPrice' => 0,
    'leftJoin' => '{"localizator" : {"class" : "localizatorContent","alias" : "localizator","on" : "localizator.resource_id = msProduct.id"}}',
    'select' => '{ "localizator" : "msProduct.*, localizator.*, msProduct.id" }',
    'where' => '{ "localizator.key" : "' ~ ('localizator_key' | option) ~ '"}',
    ]
    )}
{else}
    {set $current_items = $_modx->runSnippet(
    'msProducts',
    [
    'tpl'=>'tplProductTable',
    'parents' => "{$_modx->resource.id}",
    'depth' => 1,
    'showLog' => 0,
    'limit' => 8,
    'sortby' => 'RAND()',
    'sortdir' => 'ASC',
    'tvPrefix' => '',
    'showZeroPrice' => 0,
    'includeContent' => 1,
    ]
    )}
{/if}

{if $current_items?}
  <section class="section- section-content">
    <div class="container">
      <div class="section-caption">
        <div class="caption">
          <span>{$_modx->lexicon('items_by_table_desc')}, {$_modx->runSnippet('dateTodayMin')}</span>
        </div>
      </div>
      <div class="content">
        <table>
          <tr>
            <th>{$_modx->lexicon('items_by_table_item_colum')}</th>
            <th>{$_modx->lexicon('items_by_table_price_colum')}</th>
          </tr>
            {$current_items}
        </table>
      </div>
    </div>
  </section>
{/if}