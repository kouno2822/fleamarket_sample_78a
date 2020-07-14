$(function(){
  //DataTransferオブジェクトで、データを格納する箱を作る
  var dataBox = new DataTransfer();
  //querySelectorでfile_fieldを取得
  var file_field = document.querySelector('input[type=file]')
  //fileが選択された時に発火するイベント
  $('#img-file').change(function(){
    //選択したfileのオブジェクトをpropで取得
    var files = $('input[type="file"]').prop('files')[0];
    $.each(this.files, function(i, file){
      //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
      var fileReader = new FileReader();

      //DataTransferオブジェクトに対して、fileを追加
      dataBox.items.add(file)
      //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
      file_field.files = dataBox.files

      var num = $('.item-image').length + 1 + i
      fileReader.readAsDataURL(file);
      if (num != 0){
        $('.click').remove();
      }
      //画像が5枚になったらドロップボックスを削除する
      if (num == 5){
        $('.selling-body__form__field__image--input').css('display', 'none')   
      }   
      //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html= `<div class='item-image' data-image="${file.name}">
                    <div class='item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="124" height="110" >
                      </div>
                    </div>
                    <div class='image-remove'>削除</div>
                  </div>`;
        $('.selling-body__form__field__image--input').before(html);
      };
      $('.selling-body__form__field__image--input').attr('id', `item-num-${num}`)
    });
  });
  $(document).on('click', '.image-remove', function() {
    //削除を押されたプレビューimageのfile名を取得
    var target_name = $(this).parent().data('image')
    //プレビューがひとつだけの場合、file_fieldをクリア
    if(file_field.files.length==1){
      //inputタグに入ったファイルを削除
      $('input[type=file]').val(null)
      dataBox.clearData();
      console.log(dataBox)
      $('.fa-camera').after(`<div class="click">クリックしてファイルをアップロード</div>`);
    }else{
      //プレビューが複数の場合
      $.each(file_field.files, function(i,input){
        //削除を押された要素と一致した時、index番号に基づいてdataBoxに格納された要素を削除する
        if(input.name==target_name){
          dataBox.items.remove(i) 
        }
      })
      //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に再度代入
      file_field.files = dataBox.files
    }
    $(this).parent().remove();
    var num = $('.item-image').length
    $('.selling-body__form__field__image--input').show()
    $('.selling-body__form__field__image--input').attr('id', `item-num-${num}`)
  });
});

