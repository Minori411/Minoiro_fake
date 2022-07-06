document.addEventListener("turbolinks:load", function () {
$('.icon_eye').click(event => {
    const input = $(event.target).parent().find('input')[0];
    input.type = input.type == 'text' ? 'password' : 'text';
})
})