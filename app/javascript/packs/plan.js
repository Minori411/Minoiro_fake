
    $(function() {
    
      function buildField(index) {
        const html = ` <div class="boxbaseP30 plan_module js-addfield-block"  data-index: "${index}" flex-wrap planbox m-b-20 z-depth-1" style="padding: 30px">
          <div class="left ">
              <input placeholder="チャットでの相談" type="text" name="plan[smallplans_attributes][0][plan_name]" id="plan_smallplans_attributes_0_plan_name" />
          </div>
      
          <div class="pricebox ">
              <input placeholder="5,000" type="text" name="plan[smallplans_attributes][0][price]" id="plan_smallplans_attributes_0_price" />
              <div class="yenkais">
              <span class="yenkai">円</span>
              <span class="kai">回</span>
              </div>
          </div>
      
      
          <div class="items">
              <div class="item_name flexbox">
                  <h3>相談方式</h3><span class="optional_label">任意</span>
              </div>
                  <input name="plan[smallplans_attributes][0][chat]" type="hidden" value="0" autocomplete="off" /><input id="minoiro_checkbox" as="boolean" type="checkbox" value="1" name="plan[smallplans_attributes][0][chat]" />
                  <label for="plan_smallplans_attributes_0_チャット">チャット</label>
                  <input name="plan[smallplans_attributes][0][video]" type="hidden" value="0" autocomplete="off" /><input id="minoiro_video" as="boolean" type="checkbox" value="1" name="plan[smallplans_attributes][0][video]" />
                  <label for="plan_smallplans_attributes_0_ビデオ通話">ビデオ通話</label>
          </div>
      
          <div class="m-t2 left w100p ">
              <textarea class="w100p" placeholder="プランの内容を入力してください" name="plan[smallplans_attributes][0][plan_detail]" id="plan_smallplans_attributes_0_plan_detail">
      </textarea>
          </div>
                  <div class="right m-b-20 smt_right m-t1" style="width: auto; margin-left: auto;">
                  <button class="button delete-form-btn" data-deletefiled="true" data-index="${index}">
                    <i class="fas fa-times-circle"></i> 削除
                  </button>
              </div>
          </div>
          </div>
          <div class="right m-b-20 smt_right m-t1" style="width: auto; margin-left: auto;">`;
        return html;
      }
    
      let fileIndex = [1, 2]
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
        
        let index = e.target.getAttribute('data-index')
        e.target.parentElement.parentElement.remove()
    });
    });


// TODO: 「料金の幅」選択が変更されたら、JS 側の制御で 自動的に submit する
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
