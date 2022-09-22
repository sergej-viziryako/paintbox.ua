{var $getItemsCount = $_modx->runSnippet('!getItemsCount', ['parents' => $id, 'depth' => 4, 'where' => '{"template":"20","Data.availability":"1"}'])}
{var $file_exists = $_modx->runSnippet('ifFileExist',['filename' => "{$icon | replace:'/ua/files/':'/files/'}"])}
{if $file_exists?}
    {set $picture = $icon}
{else}
    {set $picture = $img}
{/if}

<li data-aos="zoom-in-up">
  <div class="inner">
    <a href="{$id | url}" class="img">
      <img src="{$_modx->runSnippet('phpthumbon', ['input' => "{$picture | replace:'/ua/files/':'/files/'}", 'options' => 'w=305&h=160&zc=0&bg=ffffff&f=webp'])}" alt="{$pagetitle}" width="305" height="160">
      <span class="number">
      {$_modx->lexicon('items_count')}: <span> {$getItemsCount == ''? '0': $getItemsCount }</span>
      </span>
    </a>
    <div class="text">
      <a href="{$id | url}" class="caption">{$pagetitle}</a>
    </div>
  </div>
</li>