<li data-aos="zoom-in-up">
  <div class="inner">
    {var $file_exists = $_modx->runSnippet('ifFileExist',['filename' => "{$img | replace:'/ru/files/':'/files/'}"])}
    {if $file_exists == 1}
      <a href="{$id | url}" class="img">
        <img class="lazy" data-src="{$_modx->runSnippet('phpthumbon', ['input' => "{$img | replace:'/ru/files/':'/files/'}",'options' => 'w=305&h=200&zc=0&bg=ffff&f=webp'])}" alt="{$pagetitle}" height="200" width="305">
      </a>
    {else}
      <a href="{$id | url}" class="img">
        <span class="img-empty">
          <i class="icon-picture"></i>
        </span>
      </a>
    {/if}
    <div class="text">
      <a href="{$id | url}" class="caption">{$pagetitle}</a>
      {if $service_price?}
        <div class="price">{$_modx->lexicon('from_service_price')} {$service_price} грн</div>
      {/if}
    </div>
  </div>
</li>