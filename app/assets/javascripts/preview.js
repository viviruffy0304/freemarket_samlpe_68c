$(function(){
  // let file_field = document.querySelector('input[type=file]')
  $('.upload_image').first().off('change').on('change', function(){
    // num = $(".imageBox").length
    let files = $('input[type="file"]').prop('files')[0]
    let fileReader = new FileReader();
    fileReader.onloadend = function(){
      let src = fileReader.result
      let html = 
      `
      <div class="imageBox">
        <div>
          <img src=${src} width="120px" height="140px">
        </div>
        <div class="bottomBtn">

          <div class="item_image_deleteBtn">削除</div>
        </div>
      </div>
      `
      if($(".imageBox").length >= 5){
        $("#item_image_six_to_ten").before(html)
      }else{
        $("#item_image_one_to_five").before(html)
      }
    }
    fileReader.readAsDataURL(files)
    $(".image_text").remove()
    if($(".imageBox").length == 4){
      $("#item_image_one_to_five").css('display', 'none')
      html = 
      `
      <div class="flexBox" id='flexBox_six_to_ten'>
        <label class="product_default_image" id="item_image_six_to_ten" for="item_image">
          <i class="fas fa-camera"></i>
          <input class="upload_image" type="file" name="item[image]" id="upload_image_six_to_ten">
          <div class="image_text">クリックしてファイルをアップロード</div>
        </label>
      </div>
      `
      $(".flexBox").after(html)
    }
    else if($(".imageBox").length == 9){
      $("#item_image_six_to_ten").css('display', 'none')
    }

    // ここから画像機能編集
    if (true) {
      console.log("imageBoxが追加されました")
      image_number = $(".imageBox").length + 1
      html = 
      `
      <input accept="image/jpg,image/jpeg,image/png,image/gif" class="upload_image" type="file" name="item[images_attributes][${image_number}][image]" id="item_images_attributes_${image_number}_image">
      `
      $(".product_default_image").last().prepend(html)
      $(".product_default_image").last().removeAttr("for")
      $(".product_default_image").last().attr("for", `item_images_attributes_${image_number}_image`)
    }
    console.log("処理終了")
  })
  $(document).off('click').on('click', ".item_image_deleteBtn", function(){
    let delete_object = $(this).parent().parent()
    delete_object.remove()
    // 冗談を削除したときの処理
    if($(".imageBox").length >= 5){
      if($("#flexBox_one_to_five").children(".imageBox").length == 4){
        // 上段を削除した際に下段の初めから要素をとってきて移動させる
        image = $("#flexBox_six_to_ten").children(".imageBox:first").insertBefore($('#flexBox_one_to_five').children('#item_image_one_to_five'))
      }
    }
    // imageBoxが残っていないとき
    if($(".imageBox").length == 0){
      let html =
      `
      <div class="image_text">クリックしてファイルをアップロード</div>
      `
      $(".upload_image").after(html)
    }
    else if($(".imageBox").length == 9){
      $('#item_image_six_to_ten').css('display', 'block')
    }
    else if($(".imageBox").length == 5){
      let html =
      `
      <div class="image_text">クリックしてファイルをアップロード</div>
      `
      // ここのクラスを変える必要がある(6-10にいれる)
      $("#upload_image_six_to_ten").after(html)
    }
    else if($(".imageBox").length == 4){
      $('#flexBox_six_to_ten').remove()
      $('#item_image_one_to_five').css('display', 'block')
      
    }
  })
  $(".priceBox").off("keyup").on("keyup", function(){
    if($(this).val() >= 300 && $(this).val() <= 9999999){
      console.log($(this).val())
      $('.price_text').remove()
      a_html =
      `
      <div class="price_text">
        ¥${$(this).val()*0.1}
      </div>
      `
      p_html =
      `
      <div class="price_text">
        ¥${$(this).val()*0.9}
      </div>
      `
      $(".tax_Box").children(".topBox").after(a_html)
      $("#profit_Box").children(".topBox").after(p_html)
    }else{
      $('.price_text').remove()
      html =
      `
      <div class="price_text">
        ー
      </div>
      `
      $(".tax_Box").children(".topBox").after(html)
      $("#profit_Box").children(".topBox").after(html)
    }
  })
  


})


// {<input class="upload_image" type="file" name="item[images_attributes][0][image]" id="item_images_attributes_0_image"> */}