import swal from 'sweetalert';
import jquery from 'jquery';


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
    console.log('print link', link);
    console.log('print link href', link.getAttribute("href"));
    const deleteLink = link.getAttribute("href");
    const splitUrl = deleteLink.split('?');
    const splitPath = splitUrl[0].split('/');
    const id = splitPath[2];
    const path = splitPath[1];
    const parent = splitUrl[1].split('=')[1];
    // example link: /stock_products/153?parent=cart
    deleteProduct(id, path, parent);

  }
});


function deleteProduct(id, path, parent) {
  jquery.ajax({
        type: "POST",
        url: `/${path}/${id}?id=${id}&parent=${parent}`,
        data: {"_method": "delete"},
        success: function() {
            console.log('Print success: ');
        },
        error: function(err) {
            alert('error');
            console.log('Print status: ', err.status);
            console.log('Print responseText: ', err.responseText);
            console.log('Print statusText: ', err.statusText);
        }
    });
}

export { initSweetalert };
export { initSweetalertCallback };

