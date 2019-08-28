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
  swal({
    title: "Your Product",
    text: "Selected produckt added successfully!",
    icon: "success",
    timer: 4000
  })
}


const order = document.querySelector('.order-title')
if (order) {
  swal({
    title: "Your Product",
    text: "You order Paid, as soon as will be traking in your adress!",
    icon: "success",
    timer: 5000
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

