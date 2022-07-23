document.addEventListener("turbolinks:load", function () {
    $('.dropdown-trigger').dropdown({
        constrainWidth:false,
        coverTrigger:false,
        alignment:'left'
    });

    $(document).ready(function(){
        $('.collapsible').collapsible();
    });


    $(document).ready(function(){
        $('.modal').modal();
    });

    $(document).on('click', function(e) {
        // ２．クリックされた場所の判定
        if(!$(e.target).closest('.dropdown-trigger').length && !$(e.target).closest('#button').length){
            $('.dropdown-content').fadeOut();
        }else if($(e.target).closest('#button').length){
            // ３．ポップアップの表示状態の判定
            if($('.dropdown-content').is(':hidden')){
                $('dropdown-content').fadeIn();
            }else{
                $('.dropdown-content').fadeOut();
            }
        }
    });
});

$(document).ready(function(){
    $('.sidenav').sidenav();
});
