import swal from 'sweetalert';
import Swal from 'sweetalert2'

global.swal = swal


global.SwalTwo = Swal

const currentCart = document.querySelector('.currentcart')
if (currentCart) {
  currentCart.querySelectorAll("[data-swal='true']").forEach(btn => {
    btn.addEventListener("click", (e) => {
      const clicked = e.currentTarget;
      if (clicked.dataset.confirmed == "false") {
        e.stopImmediatePropagation()
        e.preventDefault()
        swal({
          title: "Are you sure?",
          text: clicked.dataset.text,
          icon: "warning",
          buttons: true,
          dangerMode: true,
        })
        .then((willDelete) => {
          if (willDelete) {
            clicked.dataset.confirmed = "true"
            clicked.click()
          }
        })
      }
    })
  })
}
