$(function() {
$(document).on("change",".preview-uploader",function(){
    let elem = this                                             //操作された要素を取得
    let fileReader = new FileReader();                          //ファイルを読み取るオブジェクトを生成
    fileReader.readAsDataURL(elem.files[0]);                    //ファイルを読み取る
    fileReader.onload = (function () {                          //ファイル読み取りが完了したら
        let imgTag = `<img src='${fileReader.result}'>`         //img要素を生成
        $(elem).next(".siza125").html(imgTag)                   //画像をプレビュー
    });
})
});
