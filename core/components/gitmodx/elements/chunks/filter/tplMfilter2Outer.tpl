{if $results != ''}
  <div class="container msearch2" id="mse2_mfilter">
    <aside class="aside column column20 column-filter">
      <a href="#" class="open-popup open-filter">
        <span>{$_modx->lexicon('filter')}</span>
        <i class="icon-filter"></i>
      </a>
      <div class="popup-holder-content popup-holder-filter-content    filters-scroll">
        <div class="popup popup-filter">
          <div class="filters-block  accordion-filter  ">
            <form action="{$_modx->makeUrl($_modx->resource.id)}" method="post" id="mse2_filters" class="-form filters  ">
              {$filters}
              <div class="row clear-filter ">
                <button type="reset" class="reset hidden">{$_modx->lexicon('filter_reset')}</button>
                <button class="apply close-filter" disabled>{$_modx->lexicon('filter_apply')}</button>
              </div>
            </form>
          </div>
          <a href="#" class="close-popup close-filter">
            <i class="icon-cancel"></i>
          </a>
        </div>
      </div>
    </aside>
    <div class="column column80">
      <div id="mse2_selected" style="display: none;">
        {$_modx->lexicon('filter_current_choose')}:
      </div>
      <div class="slices-sort-block ">
        <div class="filter-slices-block">
          {if $_modx->config.cultureKey != 'ru'}
            {set $tags = $_modx->runSnippet(
            'pdoResources',
              [
                'elementClass' => 'modSnippet',
                'parents' => "{$_modx->resource.id}",
                'tpl' => 'tplMenu',
                'depth' => 0,
                'limit' => 0,
                'sortby' => 'menuindex',
                'sortdir' => 'ASC',
                'tvPrefix' => '',
                'includeContent' => 1,
                'includeTVs' => 'img',
                'leftJoin' => '{"localizator" : {"class" : "localizatorContent","alias" : "localizator","on" :"localizator.resource_id = modResource.id"}}',
                'select' => '{"localizator" : "modResource.*, localizator.*, modResource.id"}',
                'where' => '{"localizator.key" : "'~ ('localizator_key' | option) ~'","template:IN":[24,37]}',
              ]
            )}
            {else}
              {set $tags = $_modx->runSnippet(
              'pdoResources',
              [
                'elementClass' => 'modSnippet',
                'parents' => "{$_modx->resource.id}",
                'tpl' => 'tplMenu',
                'depth' => 0,
                'limit' => 0,
                'sortby' => 'menuindex',
                'sortdir' => 'ASC',
                'where' => '{"template:IN":[24,37]}',
                'tvPrefix' => '',
                'includeContent' => 1,
                'includeTVs' => 'img'
              ]
            )}
          {/if}
          {if $tags?}
            <div class="slices-block">
              <ul class="slices">
                {$tags}
              </ul>
            </div>
          {/if}
        </div>
        <div class="sort-block open-close-sorting">
          <a href="#" class="opener-sorting">
            <i class="icon-up-arrow"></i>
            <i class="icon-down-arrow"></i>
            <span>{$_modx->lexicon('sort_button')}</span>
          </a>
          <div class="slide-sorting js-slide-hidden">
            <ul class="sort" id="mse2_sort">
              <li>
                <a href="#" data-sort="ms|price" data-dir="{if $sort == 'ms|price:desc'}desc{/if}" data-default="asc" class="sort-product">
                  <span>{$_modx->lexicon('sort_by_price')}</span>
                  <i class="icon-left-arrow"></i>
                </a>
              </li>
              <li>
                <a href="#" data-sort="resource|pagetitle" data-dir="{if $sort == 'resource|pagetitle:desc'}desc{/if}" data-default="desc" class="sort-product">
                  <span>{$_modx->lexicon('sort_by_name')}</span>
                  <i class="icon-left-arrow"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="products-block">
        <ul id="mse2_results" class="products">
          {$results}
        </ul>
      </div>
      <div class="pagination-block mse2_pagination">
        {$_modx->getPlaceholder('page.nav')}
      </div>
    </div>
  </div>
{else}
  {include 'category_filter_nothing_found'}
{/if}