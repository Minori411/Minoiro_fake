document.addEventListener("turbolinks:load", function () {
    $(function() {
        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
        $('#img_prev_2').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
            }
        }
        $('#user_image').change(function(){
            readURL(this);
        });
    });

    $(function() {

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#img_prev_1').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        $('#user_disability_passport').change(function(){
            readURL(this);
        });
    });


    $(function() {

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#img_prev_2').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $('#user_certificate_0').change(function(){
                readURL(this);
            });

        function readURL(input,index) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    console.log(e.target.result)
                    console.log(index)

                    $(`#img_prev_${index}`).attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }
        $('body').on('change', '.user_certificate' , function() {
            let hoge = this.id
            let fuga = hoge.replace('user_certificate_', '')
            readURL(this,fuga);
        });
        // $("input[type='file']").change(function(){
        //     console.log(this)
            // readURL(this);
        // });
    });
});
