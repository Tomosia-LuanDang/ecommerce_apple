$(document).ready(function(){
  $(document).on("click", ".delete-product", function(){
    var id = $(this).attr("data-product-id");
    $.ajax({
      url: '/admin/products/' + id,
      method: 'DELETE'
    });
  });
});
