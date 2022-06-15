$(function(){
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
              <a href="#" class="button is-danger" data-deletefiled="true">
                  <i class="fas fa-times-circle"></i> 削除
              </a>`;
      return html;
    }
  
    let fileIndex = [1, 2, 3, 4]
    var lastIndex = $(".js-addfield-block:last").data("index");
    fileIndex.splice(0, lastIndex);
    let fileCount = $(".hidden-destroy").length;
    let displayCount = $(".js-addfield-block").length
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
  
    $(".plan_area").on("click", "", function() {
      $(".add-form-btn").css("display",".hidden-destroy","block");
      const targetIndex = $(this).parent().parent().data("index")
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
      var lastIndex = $(".js-addfield-block:last").data("index");
      displayCount -= 1;
      if (targetIndex < fileCount) {
        $(this).parent().parent().css("display","none")
        hiddenCheck.prop("checked", true);
      } else {
        $(this).parent().parent().remove();
      }
      if (fileIndex.length >= 1) {
        fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      } else {
        fileIndex.push(lastIndex + 1);
      }
      if (displayCount == 0) {
        $(".plan_area").append(buildField(fileIndex[0] - 1));
        fileIndex.shift();
        displayCount += 1;
      } 
    })
})