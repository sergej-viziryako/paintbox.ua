<li data-aos="zoom-in-up">
  <div class="inner">
    {var $file_exists = $_modx->runSnippet('ifFileExist',['filename' => "{$img | replace:'/ru/files/':'/files/'}"])}
    {if $file_exists == 1}
      <a href="{$id | url}" class="img">
        <img class="lazy" data-src="{$_modx->runSnippet('phpthumbon', ['input' => "{$img | replace:'/ru/files/':'/files/'}",'options' => 'h=80&zc=0&bg=ffff&f=webp'])}" alt="{$pagetitle}" height="80">
      </a>
    {else}
      <a href="{$id | url}" class="img img-empty">
        <i class="icon-picture"></i>
      </a>
    {/if}
      <div class="text">
          <a href="{$id | url}">{$pagetitle}</a>
      </div>
  </div>
</li>