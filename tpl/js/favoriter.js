$(function(){
  // msFavoriter
  // https://github.com/TrywaR/msFavoriter
  //Р”РѕР±Р°РІР»РµРЅРёРµ РёР»Рё СѓРґР°Р»РµРЅРёРµ РёР·Р±СЂР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ
  $(document).on('click', '.msFavoriterToggle', function(){
    msProductId = $(this).attr('data-id');
    itemProduct = $(this).parents('.block-favorite-item');
    msFavoriterButton = $(this);
    $.post('/msfavoriter', {'id': msProductId}, function(){
      msFavoriterButton.toggleClass('active');
      itemProduct.toggleClass('active');
      msFavoriterCount();
    })
    return false
  })

  $(document).on('click', '.delete.msFavoriterToggle', function(){
    //location.href;
    //window.location.href;
    //location.reload();
  })

  //РљРѕР»РёС‡РµСЃС‚РІРѕ РёР·Р±СЂР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ
  function msFavoriterCount(){
    $.post('/msfavoriter', {}, function(data){
      if (data > 0) {
        //$('#msFavoriter').show().find('span').text(data);
        $('#msFavoriter').find('span.number').text(data);
      } else {
        //$('#msFavoriter').hide();
        $('#msFavoriter').find('span.number').text('0');
        $('.favoriter-count .favoriter-count-section').toggleClass('active');
      }
    })
  }
  msFavoriterCount()
  // msFavoriter x
})