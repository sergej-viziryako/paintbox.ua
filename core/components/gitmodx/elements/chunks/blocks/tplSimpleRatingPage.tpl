{*<div class="rating cell" style="width: 330px;">
  <div class="stars">
    <input type="number" name="your_awesome_parameter" id="some_id" class="rating" data-clearable="remove" data-icon-lib="fa" data-active-icon="fa-heart" data-inactive-icon="fa-heart-o" data-clearable-icon="fa-trash-o"/>
  </div>
  <div>
    {$_modx->lexicon('rating')}: <span>[[+rating_value]] / 5 - {$_modx->lexicon('rating_voices')}: [[+rating_count]]</span>
  </div>
</div>*}

<div class="rating cell" >
  <div class="rating[[+rating_active]] stars" >
    <div class="rating__best">
      <div class="rating__current" data-id="[[+id]]" style="display: block; width: [[+rating_width]]px;"></div>
      <div class="rating__star rating__star_5" data-title="5"></div>
      <div class="rating__star rating__star_4" data-title="4"></div>
      <div class="rating__star rating__star_3" data-title="3"></div>
      <div class="rating__star rating__star_2" data-title="2"></div>
      <div class="rating__star rating__star_1" data-title="1"></div>
    </div>
  </div>
  <span>
    {$_modx->lexicon('rating')}:<span> [[+rating_value]]/5 - {$_modx->lexicon('rating_voices')}: [[+rating_count]]</span>
  </span>
</div>