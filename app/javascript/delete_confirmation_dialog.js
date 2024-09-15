// window.addEventListener(('turbo:load'), () => {
//   document.addEventListener('submit', (event) => {
//     if (event.target && event.target.className === 'delete-alertbox') {
//       event.preventDefault()
//       Swal.fire({
//           title: 'Are you sure?',
//           text: "You won't be able to revert this!",
//           icon: 'warning',
//           showCancelButton: true,
//           confirmButtonColor: '#3085d6',
//           cancelButtonColor: '#d33',
//           confirmButtonText: 'Yes, delete it!'
//       })
//         .then((result) => {
//           if (result.isConfirmed) {
//             Swal.fire({
//               title: "Deleted!",
//               text: "Your file has been deleted.",
//               icon: "success"
//             });
//             document.querySelector('.delete-alertbox').submit()
//           }
//         })
//         .catch(event.preventDefault())
//     }
//   })
// })




window.addEventListener('turbo:load', () => {
  document.addEventListener('submit', (event) => {
    if (event.target && event.target.className === 'delete-alertbox') {
      event.preventDefault();

      Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
      }).then((result) => {
        if (result.isConfirmed) {
          // Show confirmation
          Swal.fire({
            title: "Deleted!",
            text: "It has been deleted.",
            icon: "success"
          }).then(() => {
            // Submit form after click on ok
            event.target.submit();
          });
        }
      });
    }
  });
});
