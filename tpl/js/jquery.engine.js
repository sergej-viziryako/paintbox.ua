jQuery(function() {
  initComparison();
  initColorChange();
});

function initComparison() {
  Comparison.add.initialize(".comparison-default", { minItems:7 } );
}

function initColorChange() {
  $('select#option_color').on('change', function () {
    var color_val = this.value;
    //$(this).attr('data-price');
    //console.log($(this).data('id'));
    //slideIndex = $(this).data('id');

    $(".slider-for .slick-track li").each(function () {
      var data_slick_index = $(this).attr('data-slick-index');
      var data_color = $(this).attr('data-color')
      if (color_val == data_color) {
        console.log(data_slick_index);
        slideIndex = data_slick_index;
        $('.slider-for').slick('slickGoTo', slideIndex, true);
      }
    });
  });
}