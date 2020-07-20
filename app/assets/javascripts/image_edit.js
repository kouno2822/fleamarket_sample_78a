$(function(){

  function buildHTML(count) {
    var html = `<div class="prev-box" id='prev-box__${count}' >
                  <div class="prev-box-top">
                    <img src= 'image'>
                  </div>
                  <div class="prev-box-bottom">
                    <div class="prev-box-bottom-delete" id = "prev-box-bottom-delete_btn_${count}">
                      削除
                    </div>
                  </div>
                </div>`

    return html;
  }

  function label_number(){
    var count = $('.prev-box').length;
    if ($('#item_images_attributes_0__destroy').prop('checked')){
      $('.label-box').attr({id: `label-box--0`,for: `item_images_attributes_0_image`});
    }else if ($('#item_images_attributes_1__destroy').prop('checked')){
      $('.label-box').attr({id: `label-box--1`,for: `item_images_attributes_1_image`});
    }else if ($('#item_images_attributes_2__destroy').prop('checked')){
      $('.label-box').attr({id: `label-box--2`,for: `item_images_attributes_2_image`});
    }else if ($('#item_images_attributes_3__destroy').prop('checked')){
      $('.label-box').attr({id: `label-box--3`,for: `item_images_attributes_3_image`});
    }else if ($('#item_images_attributes_4__destroy').prop('checked')){
      $('.label-box').attr({id: `label-box--4`,for: `item_images_attributes_4_image`});
    }else if ($('#item_images_attributes_5__destroy').prop('checked')){
      $('.label-box').attr({id: `label-box--5`,for: `item_images_attributes_5_image`});
    }else{
      $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
    }
  }

  if (window.location.href.match(/\/items\/\d+\/edit/)){
    var prevContent = $('.label').prev();
    labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label').css('width', labelWidth);
    $('.prev-box').each(function(index, box){
      $(box).attr('id', `prev-box__${index}`);
    })
    $('.prev-box-bottom-delete').each(function(index, box){
      $(box).attr('id', `delete_btn_${index}`);
    })
    var count = $('.prev-box').length;
    if (count == 5) {
      $('.label').hide();
    }
  }
  
  function setLabel() {
    var prevContent = $('.label').prev();
    labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label').css('width', labelWidth);
  }
  
  $(document).on('change', '.hidden-field', function(){
    setLabel();
    var id = $('.label-box').attr('id').replace(/[^0-9]/g, '');
    var file = $(this)[0].files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
      var image = this.result;
      if ($(`#prev-box__${id}`).length == 0) {
        var count = $('.prev-box').length;
        var html = buildHTML(id);
        var prevContent = $('.label').prev();
        $(prevContent).append(html);
      }
      $(`#prev-box__${id} img`).attr('src', `${image}`);
      var count = $('.prev-box').length;
      if (count == 5) { 
        $('.label').hide();
      }
      if ($(`#item_images_attributes_${id}__destroy`)){
        $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
      } 

      setLabel();
      if(count < 5){
        label_number();
      }
    }
  });
  $(document).on('click', '.prev-box-bottom-delete', function() {
    $(`#item_images_attributes_${id}_image`).val("");
    var count = $('.prev-box').length;
    setLabel(count);
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    $(`#prev-box__${id}`).remove();
    var count = $('.prev-box').length;
    console.log(count);
    
      if (count == 4) {
        $('.label').show();
        setLabel(count);
      }

    if ($(`#item_images_attributes_${id}__destroy`).length == 0) {
      $(`#item_images_attributes_${id}_image`).val("");
      var count = $('.prev-box').length;
      if (count == 4) {
        $('.label').show();
        setLabel(count);
      }

      if(id < 5){
        $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
        setLabel(count);
        label_number();
      }
    } else {
      $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
      $(`#item_images_attributes_${id}_image`).val("");
      label_number();
      setLabel();
      if (count == 4) {
        $('.label').show();
        setLabel(count);
        label_number();
      }
      if(id < 5){
        setLabel(count);
        label_number();
      }
    }
  });
});