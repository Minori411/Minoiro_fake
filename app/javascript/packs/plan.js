
document.addEventListener("turbolinks:load", function () {
    $(function() {

    $('.js-searchable').select2({
      language: "ja" //日本語化
    });
    
      function buildField(index) {
        const html = `<div class="boxbaseP30 plan_module flex-wrap planbox m-b-20 z-depth-1 js-addfield-block" data-index="${index}", style="padding: 30px">
        <div class="left ">
        <input placeholder="チャットでの相談" type="text" name="plan[plans][plan_name]" id="plan_plans_plan_name">      
        </div>
    
        <div class="pricebox ">
        <input placeholder="5,000" type="text" name="plan[plans][price]" id="plan_plans_price">
          <div class="yenkais">
            <span class="yenkai">円/</span>
            <span class="kai">回</span>
            </div>
        </div>
    
    
        <div class="items">
            <div class="item_name flexbox">
                <h3>相談方式</h3><span class="optional_label">任意</span>
            </div>
            <input id="minoiro_checkbox" as="boolean" type="checkbox" value="1" name="plan[plans][chat]">
            <label for="plan_チャット">チャット</label>
            <input id="minoiro_video" as="boolean" type="checkbox" value="1" name="plan[plans][video]">              
            <label for="plan_ビデオ通話">ビデオ通話</label>
          </div>
    
        <div class="m-t2 left w100p ">
        <textarea class="w100p" placeholder="プランの内容を入力してください" name="plan[plans][plan_detail]" id="plan_plans_plan_detail"></textarea>
      </div>
          <div class="right m-b-20 smt_right m-t1" style="width: auto; margin-left: auto;">
          <a class="button delete-form-btn" data-deletefiled="true">
              <i class="fas fa-times-circle"></i> 削除
          </a>`;
        return html;
      }
    
      let fileIndex = [1, 2, 3, 4]
      var lastIndex = $(".certi-ficate:last").data("index");
      fileIndex.splice(0, lastIndex);
      let fileCount = $(".hidden-destroy").length;
      let displayCount = $(".certi-ficate").length
    
      $(".hidden-destroy").hide();
      if (fileIndex.length == 0) $(".add-form-btn").css("display","none");
    
      $(".add-form-btn").on("click", function(event) {
          event.preventDefault();
          console.log( "リンク先への遷移をストップ" );      
          $(".plan_area").append(buildField(fileIndex[0]));
        fileIndex.shift();
        if (fileIndex.length == 0) $(".add-form-btn").css("display","none");
        displayCount += 1;
        
      })

      $(document).on("click", ".delete-form-btn", function (e) {
        // $(this)でイベントが発生した要素を取得して削除する
        $("div").remove(".js-addfield-block");
    });
    fileIndex.pop()
    });

});

jQuery(function ($) {
  // セレクトボックスが変更されたら処理をする
  $('#pref-select').change(function () {
  
      // 選択した値を取得
      var select_val = $('#pref-select option:selected').val();
      
      // tbodyのtr数回 処理をする
      $.each($("#pref-table tbody tr"), function (index, element) {
      
          // 選択した値が空欄だったら、全ての行を表示する為の処理
          if (select_val == "") {
              $(element).css("display", "table-row");
              return true; // 次のtrへ
          }
          
          // 1行をテキストとして取り出し、セレクトボックスで選択した値があるかをチェック
          var row_text = $(element).text();
          
          if (row_text.indexOf(select_val) != -1) {
              // 見つかった場合は表示する
              $(element).css("display", "table-row");
          } else {
              // 見つからなかった場合は非表示に
              $(element).css("display", "none");
          }

      });
  });
});