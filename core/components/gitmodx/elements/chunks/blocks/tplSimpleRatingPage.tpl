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
  <span class="rating-description">
    {*$_modx->lexicon('rating')*}<span> [[+rating_value]]/5 - {$_modx->lexicon('rating_voices')}: [[+rating_count]]</span>
  </span>
</div>