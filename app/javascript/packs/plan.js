
$(document).on('turbolinks:load', function() {
  add_btn_display();
});
function add_btn_display(){
  if ($(".smallplan").length >= 3){
    $(".add-form-btn").hide();
  }else{
    $(".add-form-btn").show();
  }
}
document.addEventListener("turbolinks:load", function () {
    $(function() {
    
      function buildField(index) {
        const html = ` <div class="boxbaseP30 plan_module smallplan js-addfield-block_${index} flex-wrap planbox m-b-20 z-depth-1" data-index="${index}" style="padding: 30px">
          <div class="left ">
              <input placeholder="チャットでの相談" type="text" name="plan[smallplans_attributes][${index}][plan_name]" id="plan_smallplans_attributes_${index}_plan_name" />
          </div>
      
          <div class="pricebox ">
              <input placeholder="5,000" type="text" name="plan[smallplans_attributes][${index}][price]" id="plan_smallplans_attributes_${index}_price" />
              <div class="yenkais">
              <span class="yenkai">円/</span>
              <span class="kai">回</span>
              </div>
          </div>
      
      
          <div class="items">
              <div class="item_name flexbox">
                  <h3>相談方式</h3><span class="optional_label">任意</span>
              </div>
                  <input name="plan[smallplans_attributes][${index}][chat]" type="hidden" value="0" autocomplete="off" /><input id="minoiro_checkbox" as="boolean" type="checkbox" value="1" name="plan[smallplans_attributes][${index}][chat]" />
                  <label for="plan_smallplans_attributes_${index}_チャット">チャット</label>
                  <input name="plan[smallplans_attributes][${index}][video]" type="hidden" value="0" autocomplete="off" /><input id="minoiro_video" as="boolean" type="checkbox" value="1" name="plan[smallplans_attributes][${index}][video]" />
                  <label for="plan_smallplans_attributes_${index}_ビデオ通話">ビデオ通話</label>
          </div>
      
          <div class="m-t2 left w100p ">
              <textarea class="w100p" placeholder="プランの内容を入力してください" name="plan[smallplans_attributes][${index}][plan_detail]" id="plan_smallplans_attributes_${index}_plan_detail"></textarea>
          </div>
                  <div class="right m-b-20 smt_right m-t1" style="width: auto; margin-left: auto;">
                  <a class="button delete-form-btn" data-deletefiled="true" data-index="${index}">
                    <i class="fas fa-times-circle"></i> 削除
                  </a>
              </div>
          </div>
          </div>
          <div class="right m-b-20 smt_right m-t1" style="width: auto; margin-left: auto;">`;
        return html;
      }
    
      $(".add-form-btn").on("click", function(event) {
        event.preventDefault();
        console.log( "リンク先への遷移をストップ" );

        let max_elements_index = 0
        if($(".smallplan").length > 0){
          max_elements_index = Math.max.apply(null, $('.smallplan').map(function() { return $(this).data('index')}).toArray())
        }

        $(".plan_area").append(buildField(max_elements_index + 1));
        add_btn_display();
      })

      $(document).on("click", ".delete-form-btn", function (e) {
        // $(this)でイベントが発生した要素を取得して削除する
        
        let index = e.target.getAttribute('data-index')
        $("div").remove(`.js-addfield-block_${index}`);
        add_btn_display();
    });
    });

});

// TODO: 「料金の幅」選択が変更されたら、JS 側の制御で 自動的に submit する
document.addEventListener("turbolinks:load", function () {
  const submitTarget = document.getElementById('search_plan')
  const priceSelect = document.querySelector('#price-select')
  const evaluationSelect = document.querySelector('#evaluation')
  const submitButton = document.querySelector('#search-submit')

  $(priceSelect).on('change', function() {
    submitTarget.submit()
  })
  $(evaluationSelect).on('change', function() {
    submitTarget.submit()
  })
})