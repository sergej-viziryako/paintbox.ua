<li data-aos="fade-up">
  <div class="inner">
    {var $file_exists = $_modx->runSnippet('ifFileExist',['filename' => "{$img | replace:'/ru/files/':'/files/'}"])}
    {if $file_exists == 1}
      <a href="{$id | url}" class="img">
        <img class="lazy" data-src="{$_modx->runSnippet('phpthumbon', ['input' => "{$img | replace:'/ru/files/':'/files/'}",'options' => 'w=180&h=140&zc=1&bg=ffff&f=webp'])}" alt="{$pagetitle}" width="180" height="140">
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
          <i class="icon-calendar"></i>
          <span>{$publishedon | date_format : "%d.%m.%Y"}</span> |
          <i class="icon-pencil"></i>
          <span>{$editedon | date_format:"%d.%m.%Y" }</span> |
          <i class="icon-eye"></i>
          {$_modx->runSnippet('!siteStatistics',['resource' => "{$id}"])} |
          {$_modx->runSnippet('!SimpleRating',['id' => "{$id}",'tpl' => 'tplSimpleRatingPage_1'])}
      </div>
      <div class="description">
        <p>{$content | notags | truncate : 200 : '...' | replace : "&nbsp;" : ""}</p>
      </div>
    </div>
  </div>
</li>