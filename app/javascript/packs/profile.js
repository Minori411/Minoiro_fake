document.addEventListener("turbolinks:load", function () {

$(function() {

function buildField(index) {
    const html = `<div class="certificate1" data-index="${index}"> 
    <table class="editable">
        <tr>
            <th width="150">資格名</th>
            <td colspan="3">
                <div>
                    <div class="certificate-input-root">
                        <div class="certificate-input-wrapper-default input">
                            <input class="w300" placeholder="資格名" name="certificate" type="text">
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        <tr class="consultant-info">
            <th>資格証明書</th>
            <td>
                <div class="certificate">
                <img src="/sikaku.png" id= "img_prev_${index}" class="certificate_img">
                </div>
                <div class="upload m-t1" data-thumbnail-target="#selected-file">
                    画像をアップロードする
                    <div class="alignCenter m-t-20 m-b-20">
                    <input type="file" name="user[certificate]" id= "user_certificate_${index}" class="user_certificate">
                    </div>
                </div>
                <span class="help-block m-t-5"></span>
            </td>
        </tr>
        </table>
        <table>
        <tr class="consultant-info">
            <td></td>
            <td class="right" colspan="3">
                <span class="delete-form-btn">
                    <i class="fa fa-times red"></i>
                    削除する
                </span>
                <input name="user[users][_destroy]" type="hidden" value="0" autocomplete="off">
                <input class="hidden-destroy" type="checkbox" value="1" name="user[users][_destroy]" id="user_users__destroy" style="display: none;">
            </td>
        </tr>
    </table>
    </div>`;
    return html;
  }

  let fileIndex = [1, 2, 3, 4]
  var lastIndex = $(".certificate1:last").data("index");
  fileIndex.splice(0, lastIndex);
  let fileCount = $(".hidden-destroy").length;
  let displayCount = $(".certificate1").length
  $(".hidden-destroy").hide();
  if (fileIndex.length == 0) $(".add-btn").css("display","none");

  $(".add-btn").on("click", function() {
    $(".sikaku").append(buildField(fileIndex[0]));
    fileIndex.shift();
    if (fileIndex.length == 0) $(".add-btn").css("display","none");
    displayCount += 1;
  })

  $(document).on("click", ".delete-form-btn", function (e) {
    // $(this)でイベントが発生した要素を取得して削除する
    $("div").remove(".certificate1");
});



});

$(function() {

    function buildField(index) {
        const html = 
        `<div class="WorkResultBox" data-index="${index}">
            <table class="editable">
                <tr>
                <th>経歴・実績</th>
                    <td colspan="3">
                        <div class="m-t-5">
                            <textarea name="user[career]" id="user_career">
                            </textarea>
                        </div>
                    </td>
                </tr>
                <tr>
                <th class="ccc">期間</th>
                <td class="ddd">
                <select id="user_year_1i" name="user[year(1i)]">
                    <option value="" label=" "></option>
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                    <option value="2019">2019</option>
                    <option value="2020">2020</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                    </select>
                    <select id="user_year_2i" name="user[year(2i)]">
                    <option value="" label=" "></option>
                    <option value="1">1月</option>
                    <option value="2">2月</option>
                    <option value="3">3月</option>
                    <option value="4">4月</option>
                    <option value="5">5月</option>
                    <option value="6">6月</option>
                    <option value="7">7月</option>
                    <option value="8">8月</option>
                    <option value="9">9月</option>
                    <option value="10">10月</option>
                    <option value="11">11月</option>
                    <option value="12">12月</option>
                </select>
                <input type="hidden" id="user_year_3i" name="user[year(3i)]" value="1" autocomplete="off" />
                            〜
                <select id="user_year_1i" name="user[year(1i)]">
                    <option value="" label=" "></option>
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                    <option value="2019">2019</option>
                    <option value="2020">2020</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                    <option value="2026">2026</option>
                    <option value="2027">2027</option>
                    </select>
                    <select id="user_year_2i" name="user[year(2i)]">
                    <option value="" label=" "></option>
                    <option value="1">1月</option>
                    <option value="2">2月</option>
                    <option value="3">3月</option>
                    <option value="4">4月</option>
                    <option value="5">5月</option>
                    <option value="6">6月</option>
                    <option value="7">7月</option>
                    <option value="8">8月</option>
                    <option value="9">9月</option>
                    <option value="10">10月</option>
                    <option value="11">11月</option>
                    <option value="12">12月</option>
                </select>
                <input type="hidden" id="user_year_3i" name="user[year(3i)]" value="1" autocomplete="off" />
                </td>
            </tr>
        </table>
    </div>`;
return html;
}
    
      let fileIndex = [1, 2, 3, 4]
      var lastIndex = $(".WorkResultBox:last").data("index");
      fileIndex.splice(0, lastIndex);
      let fileCount = $(".hidden-destroy").length;
      let displayCount = $(".WorkResultBox").length
      $(".hidden-destroy").hide();
      if (fileIndex.length == 0) $(".add-btn").css("display","none");
    
      $(".add-btn2").on("click", function() {
        $(".keirekizisseki").append(buildField(fileIndex[0]));
        fileIndex.shift();
        if (fileIndex.length == 0) $(".add-btn").css("display","none");
        displayCount += 1;
      })

      $(document).on("click", ".delete-form-btn", function (e) {
        // $(this)でイベントが発生した要素を取得して削除する
        $("div").remove(".WorkResultBox");
    });
    fileIndex.pop()

     });

});


