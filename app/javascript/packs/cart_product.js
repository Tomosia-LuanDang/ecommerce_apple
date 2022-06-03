$(document).ready(function(){
  $(".btn-add-to-cart").on("click", function(){
    var product_id = $(this).attr("data-product-id");
    var quantity = $('.product-quatity').val();
    $.ajax({
      url: '/cart_items',
      method: 'POST',
      data: {
              quantity: quantity,
              product_id: product_id
            }
    });
  });
});
