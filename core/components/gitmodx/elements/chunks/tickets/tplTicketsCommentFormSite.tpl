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
          <div class="form-group row">
            <input type="text" name="name" value="[[+name]]" placeholder="{$_modx->lexicon('call_back_form_name_placeholder')}" id="comment-name" class="form-control" />
            <span class="error"></span>
          </div>
          <div class="form-group row">
            <input type="text" name="email" value="[[+email]]" placeholder="E-mail" id="comment-email" class="form-control" />
            <span class="error"></span>
          </div>
          <div class="row">
            <textarea name="text" id="comment-editor" cols="30" rows="7" class="form-control" placeholder="{$_modx->lexicon('reviews_leave_review_text')}"></textarea>
            <span class="error"></span>
          </div>
          <div class="row">
            <div class="stars">
              <input type="number" name="starrating" id="starrating" class="rating" data-clearable="remove" data-icon-lib="fa" data-active-icon="fa-heart" data-inactive-icon="fa-heart-o" data-clearable-icon="fa-trash-o"/>
            </div>
          </div>
          <div class="row row-actions">
            <button type="submit" class="">
              <i class="icon-pencil"></i>
              <span>{$_modx->lexicon('reviews_send_button')}</span>
            </button>
          </div>
        </fieldset>
      </form>
    </div>
  </div>
</div>