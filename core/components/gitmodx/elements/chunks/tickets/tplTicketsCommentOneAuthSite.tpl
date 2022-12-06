<li class="ticket-comment{$comment_new} {if $properties['is_admin'] == 1}admin{/if}" id="comment-{$id}" data-parent="{$parent}" data-newparent="{$new_parent}" data-id="{$id}">
  <div class="inner">
    {*if $properties['is_admin'] == 1}
      {if $_modx->config.review_admin_name?}
        <div class="caption">{$_modx->config.review_admin_name}</div>
      {else}
        {if $_modx->config.cultureKey != 'ru'}
          <div class="caption">Адміністратор</div>
        {else}
          <div class="caption">Администратор</div>
        {/if}
      {/if}
    {else}
      <div class="caption">{$fullname}</div>
    {/if*}
    <div class="caption">{$fullname}</div>
    <div class="date">{$date_ago}</div>
    {if $properties['starrating']?}
      <div class="stars">
        <input type="number" name="your_awesome_parameter" id=" rating-readonly" class="rating" data-clearable="remove" value="{$properties['starrating']}" data-readonly/>
      </div>
    {/if}
    <div class="description">
      <p>{$text}</p>
    </div>
      {if $level == 0}
        <div class="comment-reply">
          <a href="#" class="reply link">{$_modx->lexicon('reviews_reply_button')}</a>
        </div>
      {/if}
  </div>
  <ul>
    {$children}
  </ul>
</li>

