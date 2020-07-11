document.addEventListener(
  "DOMContentLoaded", function(e){
    if ($("#token_submit") != null) { //token_submitというidがnullの場合、下記コードを実行しない
      Payjp.setPublicKey("pk_test_e0182fd565758614f20265fb"); //ここに公開鍵を直書き
      $("#token_submit").on("click", function(e){ //ボタンが押されたときに作動します
        e.preventDefault(); //ボタンを一旦無効化します
        let card = {
          number: $("#card_number").val(),
          cvc: $("#cvc").val(),
          exp_month: $("#exp_month").val(),
          exp_year: $("#exp_year").val()
        }; //入力されたデータを取得します。
        Payjp.createToken(card, function(status, response){
          if (status === 200) { //成功した場合
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); //取得したトークンを送信できる状態にします
            $("#charge-form").submit();
            alert("登録が完了しました"); //確認用
          } else {
            alert("カード情報が正しくありません。"); //確認用
          }
        });
      });
    }
  },
  false
);
