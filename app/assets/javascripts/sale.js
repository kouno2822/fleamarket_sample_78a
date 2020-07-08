$(function(){
  $('#item_price').on('keyup', function(){
    var price = parseInt($(this).val());
    if (price >= 300 && price <= 9999999) {
      var fee = Math.floor(price/10);
      var profit = (price - fee);
      $('.sale-fee').text(`¥${fee.toLocaleString()}`);
      $('.sale-profit').text(`¥${profit.toLocaleString()}`);
    } else {
      $('.sale-fee').text("---");
      $('.sale-profit').text("---");
    }
  })
});