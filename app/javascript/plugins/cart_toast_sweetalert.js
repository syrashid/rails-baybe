var swal_alert = localStorage.getItem("alert");
var currentcount = '<%= current_user.current_cart.stock_products.count %>'

if (swal_alert != currentcount) {
  var toast = SwalTwo.mixin({
    toast: true,
    position: 'bottom-end',
    showConfirmButton: false,
    timer: 3000
  })
  toast.fire({
    type: 'success',
    title: '<%= @currentcart.stock_products.last.product.name %> was successfully added to your cart'
  })
}

localStorage.setItem("alert", currentcount);
