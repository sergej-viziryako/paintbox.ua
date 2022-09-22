$(function(){
    $("ul.lang li a").click(function(e) {
        e.preventDefault();
        var lang = $(this).data('lang');
        var url = $(this).attr("href");
        document.cookie = "langkey="+lang+"; secure; max-age=2592000; path=/";
        if (this.href != '') {
            location.href = this.href;
        }
    });
});