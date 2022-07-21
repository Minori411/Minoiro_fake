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
$('.icon_eye').click(function(e) {
    //passにtypeを取得して代入する
    //定数にtypeを設定。定数からテキスト、パスワードに変換できるようにする。パスワードからテキストに再変換できるようにする。
    var pass1 = $('#password').attr('type');
    var pass2 = $('#passwordConfirm').attr('type');
    var pass3 = $('#paswordForm').attr('type');
        
    type = 'text' == 'type' ? 'password' : 'text'
    })
});



