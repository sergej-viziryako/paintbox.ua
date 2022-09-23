$(function(){
    // msFavoriter
    // https://github.com/TrywaR/msFavoriter
    // msFavoriter
    // https://github.com/TrywaR/msFavoriter
    //https://code.tutsplus.com/ru/tutorials/how-to-use-ajax-in-php-and-jquery--cms-32494
    // - Добавление или удаление избранных товаров
    $("select#select-mfa").change(function() {
        var car_id = $(this).find(":selected").attr('data-id');
        console.log(car_id);
        //alert( $(this).find(":selected").attr('data-id') );
        /*$.post('/searchauto', {'id': car_id}, function(data){
            console.log('data');
            console.log(data);
        })*/

        document.getElementById("select-type").innerHTML = "<option selected>Выберите модификацию</option>";
        document.getElementById('select-type').setAttribute("disabled","disabled");

        $.ajax({
            type: "post",
            //url: "/searchauto",
            url: "/assets/components/search_auto/connector.php",
            //dataType: 'json',
            data: {id: car_id},
            success: function(data){
                //if request if made successfully then the response represent the data
                //var jsonData = JSON.parse(data);
                console.log(data);
                document.getElementById("select-mod").innerHTML = "<option value=\"\">Выберите модель</option>";
                var select_mod = document.getElementById('select-mod');
                var i=0;
                JSON.parse(data, function(k, v) {
                    console.log(k+' '+v);
                    var opt_select_mod = document.createElement('option');
                    opt_select_mod.value = k;
                    opt_select_mod.innerHTML = v;
                    if (k != '') {
                        select_mod.appendChild(opt_select_mod);
                        i++;
                    }
                });
                if (i > 0) {
                    document.getElementById('select-mod').removeAttribute('disabled');
                } else {
                    document.getElementById('select-mod').setAttribute("disabled","disabled");
                    document.getElementById("select-mod").innerHTML = "<option selected>Нет данных</option>";
                }
            },

            /*statusCode: {
                404: function(data) {

                    alert(data.responseText);
                }
            }*/

            /*error: function(data) {
                console.log('failed');
            }*/
        });
    });
    $("select#select-mod").change(function() {
        //var mod_id = $(this).find(":selected").attr('data-id');
        var mod_id = $(this).find(":selected").val();
        console.log(mod_id);
        document.getElementById("select-type").innerHTML = "";

        $.ajax({
            type: "post",
            url: "/assets/components/search_auto/connector.php",
            data: {mod_id: mod_id},
            success: function(data){

                console.log(data.length);
                document.getElementById("select-type").innerHTML = "";
                var select_type = document.getElementById('select-type');
                var i=0;

                JSON.parse(data, function(k, v) {
                    console.log(k+' '+v);
                    var opt_select_type = document.createElement('option');
                    opt_select_type.value = k;
                    opt_select_type.innerHTML = v;
                    if (k != '') {
                        select_type.appendChild(opt_select_type);
                        i++;
                    }
                });

                if (i > 0) {
                    document.getElementById('select-type').removeAttribute('disabled');
                } else {
                    document.getElementById('select-type').setAttribute("disabled","disabled");
                }

                console.log(i);

            }
        });

    });

    $("button#filter-refresh-button").click(function() {
        var mfa_id = $("select#select-mfa").find(":selected").attr('data-id');
        var mod_id = $("select#select-mod").find(":selected").val();
        var type_id = $("select#select-type").find(":selected").val();
        $.ajax({
            type: "post",
            url: "/assets/components/search_auto/form_click.php",
            data: {mfa_id: mfa_id, mod_id: mod_id, type_id: type_id},
            success: function(data){
                var jsonData = JSON.parse(data);
                console.log(jsonData.url);
                if (jsonData.url != "") {
                    location.href = jsonData.url;
                } else {
                    alert('Введите правильно данные...');
                }
            }
        });
    });

    $("select#select-sup").change(function() {
        //var mod_id = $(this).find(":selected").attr('data-id');
        var sup_id = $(this).find(":selected").val();
        console.log(sup_id);
        $.ajax({
            type: "post",
            url: "/assets/components/search_auto/connector.php",
            data: {sup_id: sup_id},
            success: function(data){
                console.log(data.length);
                document.getElementById("select-series").innerHTML = "<option value=\"\">Выберите серию</option>";
                var select_type = document.getElementById('select-series');
                var i=0;

                JSON.parse(data, function(k, v) {
                    console.log(k+' '+v);
                    var opt_select_type = document.createElement('option');
                    opt_select_type.value = v;
                    opt_select_type.innerHTML = v;
                    if (k != '') {
                        select_type.appendChild(opt_select_type);
                        i++;
                    }
                });

                if (i > 0) {
                    document.getElementById('select-series').removeAttribute('disabled');
                } else {
                    document.getElementById('select-series').setAttribute("disabled","disabled");
                }

            }
        });

    });

    $("button#filter-refresh-button-param").click(function() {
        var sup_id = $("select#select-sup").find(":selected").val();
        var series_id = $("select#select-series").find(":selected").val();
        var fit_id = $("select#select-fit").find(":selected").val();
        var len_id = $("select#select-len").find(":selected").val();
        var autobrush_id = $("select#select-autobrush").find(":selected").val();
        var location_type_id = $("select#select-location-type").find(":selected").val();

        $.ajax({
            type: "post",
            url: "/assets/components/search_auto/form_click.php",
            data: {sup_id: sup_id, series_id: series_id, fit_id: fit_id, len_id: len_id, autobrush_id: autobrush_id, location_type_id: location_type_id},
            success: function(data){
                var jsonData = JSON.parse(data);
                console.log(jsonData.url);
                if (jsonData.url != "") {
                    location.href = jsonData.url;
                } else {
                    alert('Введите правильно данные...');
                }
            }
        });
    });

});