$(document).ready(function(){
  $(document).on("change", ".delivery-address", function(){
    var address = $(this).val();
    $.ajax({
      url: '/orders/new?format=json',
      method: 'GET',
      data: {
        address: address
      },
      success: function(r) {
        $(".name-address").val(r['address']['name']);
        $(".phone-address").val(r['address']['phone']);
        $(".current-address").val(r['address']['address']);
      }
    });
  });
});
