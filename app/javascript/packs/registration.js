// document.addEventListener("turbolinks:load", function () {

//     $('.icon_eye').click(event => {
//         const input = $('#passwordForm');
//         $('#passwordForm').get(0).type = 'text' == $('#passwordForm').get(0).type ? 'password' : 'text';
//     })
    
// })

// document.addEventListener("turbolinks:load", function () {

//     $('.icon_eye').click(event => {
//         const input = $('#password');
//     $('#password').get(0).type = 'text' == $('#password').get(0).type ? 'password' : 'text';
//     })
// })

// document.addEventListener("turbolinks:load", function () {

//     $('.icon_eye').click(event => {
//         const input = $('#passwordConfirm');
//     $('#passwordConfirm').get(0).type = 'text' == $('#passwordConfirm').get(0).type ? 'password' : 'text';
//     })
// })
document.addEventListener("turbolinks:load", function () {
    $('.icon_eye').click(function (e) {

        let target_id = $(this).data('target-element');
        let element = $("#" + target_id);

        if (element.attr('type') === 'password') {
            element.attr('type', "text");
            $(this).addClass("fa-eye-slash");
        } else {
            element.attr('type', "password");
            $(this).removeClass("fa-eye-slash");
        }
    })
});



