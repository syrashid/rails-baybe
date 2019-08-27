import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options);
    });
  }
};

const initSweetalertCallback = (selector, options = {}, callback = () => {}) => {
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback); // <-- add the `.then(callback)`
    });
  }
};

const currentCart = document.querySelector('.currentcart')
if (currentCart) {
  console.log(currentCart)
  swal({
    title: "A nice alert",
    text: "<%= @currentcart.stock_products.last.product.name %>",
    icon: "success",
    timer: 9000
  })
}



initSweetalertCallback('#sweet-alert-demo', {
  title: "Are you sure?",
  text: "Are you sure the delete product?",
  icon: "warning",
  buttons: true,
  dangerMode: true,
}, (value) => {
  if (value) {
    const link = document.querySelector('#delete-link');
    link.click();
  }
});

export { initSweetalert };
export { initSweetalertCallback };

