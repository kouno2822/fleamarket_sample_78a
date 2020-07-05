// $(document).on('turbolinks:load', ()=> {
  // 画像用のinputを生成する関数
$(function(){
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="image-file_group">
                    <input class="image-file" type="file"
                    name="product[images_attributes][${index}][image]"
                    id="product_images_attributes_${index}_image"><br>
                    <div class="image-remove">削除</div>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('.selling-body__form__field__image').on('change', '.image-file', function() {
    // fileIndexの先頭の数字を使ってinputを作る
    $('.selling-body__form__field__image').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('.selling-body__form__field__image').on('click', '.image-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    // if ($('.image-file').length == 0) $('.selling-body__form__field__image').append(buildFileField(fileIndex[0]));
  });
});
// });