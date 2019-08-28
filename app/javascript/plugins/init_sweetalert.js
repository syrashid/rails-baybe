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
  const swalButton = document.querySelectorAll(selector);
  swalButton.forEach(function(element){
    if (element) { // protect other pages
      element.addEventListener('click', () => {
        swal(options)
        .then(callback); // <-- add the `.then(callback)`
      });
    }
  })
};

initSweetalertCallback('.delete-link', {
  title: "Are you sure?",
  text: "Are you sure the delete product?",
  icon: "warning",
  buttons: true,
  dangerMode: true,
  closeOnConfirm: false
}, (value) => {
  if (value) {
    const link = document.querySelector('#delete-link');
    link.click();
  }
});


const currentCart = document.querySelector('.currentcart')
if (currentCart) {
  swal({
    title: "Your Product",
    text: "Selected product added successfully!",
    icon: "success",
    timer: 4000
  })
}


const order = document.querySelector('.order-title')
if (order) {
  swal({
    title: "Your Product",
    text: "You order Paid, as soon as will be traking in your address!",
    icon: "success",
    timer: 5000
  })
}


export { initSweetalert };
export { initSweetalertCallback };

