<li data-aos="fade-up">
  <div class="inner">
    {var $file_exists = $_modx->runSnippet('ifFileExist',['filename' => "{$img | replace:'/ua/files/':'/files/'}"])}
    {if $file_exists == 1}
      <a href="{$id | url}" class="img">
        <img class="lazy" data-src="{$_modx->runSnippet('phpthumbon', ['input' => "{$img | replace:'/ua/files/':'/files/'}",'options' => 'w=180&h=140&zc=0&bg=ffff&f=webp'])}" alt="{$pagetitle}" width="180" height="140">
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
      <div class="date">
        <span>{$publishedon | date_format : "%d.%m.%Y"}</span>
      </div>
      <div class="description">
        <p>{$content | notags | truncate : 200 : '...' | replace : "&nbsp;" : ""}</p>
      </div>
    </div>
  </div>
</li>