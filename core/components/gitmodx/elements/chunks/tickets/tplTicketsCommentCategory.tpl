<div class="review-category">
  <span class="review-category-author"><a href="{$url}">{$_pls['ticket.pagetitle']}</a></span>
  <span class="review-category-date">{$name}, {$createdon | date_format : '%d.%m.%Y'}</span>
  <span class="review-category-text">
    {$text | truncate : 600 : ' ...'}
  </span>
</div>