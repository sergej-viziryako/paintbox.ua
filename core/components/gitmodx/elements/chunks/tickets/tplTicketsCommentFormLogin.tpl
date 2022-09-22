<div class="column column30">
  <div class="call-measures-block">
    <div class="caption-form">
      <i class="icon-edit"></i>
      <span>{$_modx->lexicon('reviews_form_title')}</span>
    </div>
    <div class="description-form">
      <p>{$_modx->lexicon('reviews_form_desc')}</p>
    </div>
    <div class="call-measures">
      <form id="comment-form" action="" method="post" class="call-measures-form">
        <div id="comment-preview-placeholder"></div>
        <input type="hidden" name="thread" value="[[+thread]]" />
        <input type="hidden" name="parent" value="0" />
        <input type="hidden" name="id" value="0" />
        {if $_modx->user.id == 1}
          <input type="hidden" name="is_admin" value="1" />
        {/if}
        <fieldset>
          <div class="row">
            <textarea name="text" id="comment-editor" cols="30" rows="7" class="form-control" placeholder="{$_modx->lexicon('reviews_leave_review_text')}"></textarea>
            <span class="error"></span>
          </div>
          <div class="row row-actions">
            <button type="submit" class="open-thanks">
              <span>{$_modx->lexicon('reviews_send_button')}</span>
            </button>
          </div>
        </fieldset>
      </form>
    </div>
  </div>
</div>