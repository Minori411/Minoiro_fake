$(function() {

    function buildField(index) {
        const html = 
        `<div class="WorkResultBox data-index: "${index}">
            <table class="editable">
                <tr>
                    <th>経歴・実績</th>
                    <td colspan="3">
                        <div class="m-t-5">
                            <textarea name="user[careers_attributes][0][content]" id="user_careers_attributes_0_content">
</textarea>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="ccc">期間</th>
                    <td class="ddd">
                    <select id="user_careers_attributes_0_started_at_1i" name="user[careers_attributes][0][started_at(1i)]">
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
<select id="user_careers_attributes_0_started_at_2i" name="user[careers_attributes][0][started_at(2i)]">
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
<input type="hidden" id="user_careers_attributes_0_started_at_3i" name="user[careers_attributes][0][started_at(3i)]" value="1" autocomplete="off" />

                    〜
                    <select id="user_careers_attributes_0_end_at_1i" name="user[careers_attributes][0][end_at(1i)]">
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
<select id="user_careers_attributes_0_end_at_2i" name="user[careers_attributes][0][end_at(2i)]">
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
<input type="hidden" id="user_careers_attributes_0_end_at_3i" name="user[careers_attributes][0][end_at(3i)]" value="1" autocomplete="off" />

                    </td>
                    <div class="right m-b-20 smt_right m-t1" style="width: auto; margin-left: auto;">
                  <button class="button delete-form-btn" data-deletefiled="true" data-index="${index}">
                    <i class="fas fa-times-circle"></i> 削除
                  </button>
              </div>
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


