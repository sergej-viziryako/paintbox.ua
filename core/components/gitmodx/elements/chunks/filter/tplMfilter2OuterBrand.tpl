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
      <div class="brand-content-block">
        {if $_modx->config.cultureKey != 'ua'}
          {set $content = $_modx->resource.localizator_content}
        {else}
          {set $content = $_modx->resource.content}
        {/if}
        {if $_modx->resource.img? || $content?}
          <div class="brand-content">
            {if $_modx->resource.img?}
              <div class="img">
                <img src="{$_modx->runSnippet('phpthumbon', ['input' => "{$_modx->resource.img}",'options' => 'h=114&bg=ffff'])}" alt="{$pagetitle}">
              </div>
            {/if}
            <div class="text">
              {if $content?}
                {$content | notags | truncate : 500 : '...' | replace : "&nbsp;" : ""}
                 <a href="{$_modx->makeUrl($_modx->resource.id)}#content" class="more">
                   <p>{$_modx->lexicon('more_about_brand')}</p>
                 </a>
              {/if}
            </div>
          </div>
        {/if}
     </div>
      <div id="mse2_selected">
        {$_modx->lexicon('filter_current_choose')}:
      </div>

      <div class="slices-sort-block ">
        <div class="sort-block open-close-sorting">
          <a href="#" class="opener-sorting">
            <i class="icon-up-arrow"></i>
            <i class="icon-down-arrow"></i>
            <span>{$_modx->lexicon('sort_button')}</span>
          </a>
          <div class="slide-sorting">
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
      <div class="pagination-block">
        {$_modx->getPlaceholder('page.nav')}
      </div>
    </div>
  </div>
{else}
  {include 'category_filter_nothing_found'}
{/if}