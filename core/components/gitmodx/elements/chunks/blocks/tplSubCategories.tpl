{var $getItemsCount = $_modx->runSnippet('!getItemsCount', ['parents' => $id, 'depth' => 4, 'where' => '{"template":"20","Data.availability":"1"}'])}
{var $minPrice = $_modx->runSnippet('msProducts',['parents'=>$id, 'limit' => 1, 'tpl' => '@INLINE {$price}', 'depth' => 1, 'sortby' => 'Data.price', 'sortdir' => 'ASC', 'showZeroPrice' => 0, 'where' => '{"template":"20","Data.availability":"1"}'])}
{var $file_exists = $_modx->runSnippet('ifFileExist',['filename' => "{$img | replace:'/ru/files/':'/files/'}"])}
<li data-aos="zoom-in-up">
  {if $file_exists == 1}
    <div class="inner">
      <a href="{$id | url}" class="img">
        <img src="{$_modx->runSnippet('phpthumbon', ['input' => "{$img | replace:'/ru/files/':'/files/'}", 'options' => 'w=305&h=160&zc=0&bg=ffffff'])}" alt="{$pagetitle}" height="160" width="305">
        <span class="number">
        {$_modx->lexicon('items_count')}: <span> {$getItemsCount == ''? '0': $getItemsCount }</span>
      </span>
      </a>
      <div class="text">
        <a href="{$id | url}" class="caption">{$pagetitle}</a>
        {if $minPrice > 0}
          <div class="price">{$_modx->lexicon('from_service_price')} {$minPrice} грн</div>
        {/if}
        <div class="description">
          {$content | notags | truncate : 150 : '...'}
        </div>
      </div>
    </div>
  {else}
    <div class="inner" style="min-height: inherit;padding: 5px;">
      <div class="text">
        <a href="{$id | url}" class="caption" style="font-weight: inherit;">{$pagetitle}</a>
        <div class="description">
          {$content | notags | truncate : 150 : '...'}
        </div>
      </div>
    </div>
  {/if}
</li>