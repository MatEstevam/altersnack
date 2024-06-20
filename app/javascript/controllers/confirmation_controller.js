// // app/javascript/controllers/cart_controller.js
// import { Controller } from "stimulus";

// export default class extends Controller {
//   async removeItem(event) {
//     event.preventDefault();

//     if (!confirm(event.target.getAttribute('data-confirm'))) {
//       return;
//     }

//     try {
//       const response = await fetch(event.target.href, {
//         method: 'DELETE',
//         headers: {
//           'Accept': 'application/json',
//           'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
//         }
//       });

//       if (!response.ok) {
//         throw new Error('Network response was not ok.');
//       }

//       const itemId = event.target.getAttribute('data-item-id');
//       this.showFlashAlert(`Item ${itemId} foi removido do carrinho.`);
//     } catch (error) {
//       console.error('Error removing item:', error);
//     }
//   }

//   showFlashAlert(message) {
//     const flashElement = document.getElementById('flash-alert');

//     if (flashElement) {
//       flashElement.innerText = message;
//     } else {
//       const flashElement = document.createElement('div');
//       flashElement.id = 'flash-alert';
//       flashElement.className = 'alert alert-danger';
//       flashElement.innerText = message;
//       document.body.appendChild(flashElement);
//     }
//   }
// }
