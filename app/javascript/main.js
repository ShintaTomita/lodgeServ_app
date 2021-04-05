$('#customer').change(function(){
  var price = '<%= @post.price %>';
  var start  = document.getElementByid('check-st');
  var start = new Date(start);
  var start = start.getTime();
  var end = document.getElementByid('check-en');
  var end = new date(end);
  var end = end.getTime();
  var end = document.getElementByid("check-en");
  var customer = document.getElementByid("customer");
  var num = (end - start) / 86400000;
  var result = Math.round((num * customer) * price * 1.1);
  $('#result').val("¥" + result);


})
