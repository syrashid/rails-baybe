import swal from 'sweetalert';


global.swal = swal
// const deleteButtons = document.querySelectorAll('.sweet-alert-demo');

// const initSweetalert = () => {
//   deleteButtons.forEach(button => {
//     button.addEventListener('click', (e) => {
//       const btn = e.currentTarget
//       swal({
//         title: btn.dataset.swalTitle,
//         text: btn.dataset.swalText,
//         icon: btn.dataset.swalIcon
//       })
//     });
//   });
// };

// initSweetalert();


// const initSweetalertCallback = (selector, options = {}, callback = () => {}) => {
//   deleteButtons.forEach(button => {
//     if (button) { // protect other pages
//       button.addEventListener('click', () => {
//         swal(options).then(callback); // <-- add the `.then(callback)`
//       });
//     }
//   })
// };

// const currentCart = document.querySelector('.currentcart')
// if (currentCart) {
//   swal({
//     title: "Your Product",
//     text: "Selected produckt added successfully!",
//     icon: "success",
//     timer: 4000
//   })
// }


// const order = document.querySelector('.order-title')
// if (order) {
//   swal({
//     title: "Your Product",
//     text: "You order Paid, as soon as will be traking in your adress!",
//     icon: "success",
//     timer: 5000
//   })
// }


// initSweetalertCallback(deleteButtons, {
//   title: "Are you sure?",
//   text: "Are you sure the delete product?",
//   icon: "warning",
//   buttons: true,
//   dangerMode: true,
// }, (value) => {
//   if (value) {
//     const link = document.querySelector('.delete-link');
//     link.click();
//   }
// });

// export { initSweetalert };

// export { initSweetalertCallback };
