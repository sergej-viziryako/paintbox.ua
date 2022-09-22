<li data-aos="fade-up">
  <div class="inner">
    <div class="text">
      <a href="{$id | url}" class="caption">{$pagetitle}</a>
      <div class="date">
        <span>{$publishedon | date_format : "%d.%m.%Y"}</span>
      </div>
      <div class="description">
        <p>{$content | notags | truncate : 220 : '...' | replace : "&nbsp;" : ""}</p>
      </div>
    </div>
  </div>
</li>