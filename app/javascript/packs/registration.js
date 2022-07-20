document.addEventListener("turbolinks:load", function () {



})

$('.icon_eye').click(event => {
    // const input = $('#passwordForm');
    $('#passwordForm').get(0).type = 'text' == $('#passwordForm').get(0).type ? 'password' : 'text';
    // const input = $('#password');
    $('#password').get(0).type = 'text' == $('#password').get(0).type ? 'password' : 'text';
    // const input = $('#passwordConfirm');
    $('#passwordConfirm').get(0).type = 'text' == $('#passwordConfirm').get(0).type ? 'password' : 'text';
})


