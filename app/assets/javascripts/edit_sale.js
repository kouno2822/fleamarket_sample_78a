$(function(){
  if (window.location.href.match(/\/items\/\d+/)){
    var price = parseInt($('#item_price').val());
    if (price >= 300 && price <= 9999999) {
      var fee = Math.floor(price/10);
      var profit = (price - fee);
      $('.sale-fee').text(`¥${fee.toLocaleString()}`);
      $('.sale-profit').text(`¥${profit.toLocaleString()}`);
    } else {
      $('.sale-fee').text("---");
      $('.sale-profit').text("---");
    }
  }
});