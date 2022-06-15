$(document).ready(function(){
  $(document).on("click", ".delete-product", function(){
    var id = $(this).attr("data-product-id");
    $.ajax({
      url: '/admin/products/' + id,
      method: 'DELETE'
    });
  });

  $(document).on("click", ".delete-category", function(){
    var id = $(this).attr("data-category-id");
    $.ajax({
      url: '/admin/categories/' + id,
      method: 'DELETE'
    });
  });
});

if($(".flash-alert").show()) {
  setTimeout(function(){
    $(".flash-alert").hide("3000")
  }, 2500);
}
