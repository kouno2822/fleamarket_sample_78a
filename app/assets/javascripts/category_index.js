$(function(){
  $(function(){
    // #で始まるリンクをクリックしたらイベント発火
    $('a[href^="#"]').click(function() {
      // ここでいう$(this)とはクリックされたリンク要素のこと。
      var href= $(this).attr("href");
      // var target = $(href == "#" || href == "" ? 'html' : href);
      if (href == "#" || href == "") {
        target = 'html'
      } else {
        target = href
      }
     // offset().topを用いて数値として要素の左上の座標を代入。
      var position = target.offset().top;
      // animate関数でアニメーションを指定します。
      $('body,html').animate({scrollTop:position}, 400, 'swing');
      return false;
    });
    $('.to-top').click( function(){
      $('body,html').animate({scrollTop: 0}, 400, 'linear');
    })
  });
});