// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

// const slides = document.querySelectorAll(".item");
// const buttons = document.querySelectorAll(".button");

// let current = 0;
// let prev = slides.length - 1;
// let next = 1;

// buttons.forEach((button, index) => {
//   button.addEventListener("click", () => {
//     if (index === 0) {
//       gotoPrev();
//     } else {
//       gotoNext();
//     }
//   });
// });

// const gotoPrev = () => {
//   current = current > 0 ? current - 1 : slides.length - 1;
//   updateClasses();
// };

// const gotoNext = () => {
//   current = current < slides.length - 1 ? current + 1 : 0;
//   updateClasses();
// };

// const updateClasses = () => {
//   prev = current === 0 ? slides.length - 1 : current - 1;
//   next = current === slides.length - 1 ? 0 : current + 1;

//   slides.forEach((slide, index) => {
//     slide.classList.remove("active", "prev", "next");
//     if (index === prev) slide.classList.add("prev");
//     else if (index === current) slide.classList.add("active");
//     else if (index === next) slide.classList.add("next");
//   });
// };

document.addEventListener('DOMContentLoaded', function() {
  // Função para mostrar a notificação de confirmação
  function showConfirmation(message, link) {
    var container = document.createElement('div');
    container.className = 'alert alert-warning alert-dismissible fade show';
    container.role = 'alert';
    container.style.position = 'fixed';
    container.style.top = '10px';
    container.style.left = '50%';
    container.style.transform = 'translateX(-50%)';
    container.style.zIndex = '1000';
    container.innerHTML = `
      ${message}
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      <div class="mt-2">
        <button id="confirm-yes" class="btn btn-danger btn-sm">Yes</button>
        <button id="confirm-no" class="btn btn-secondary btn-sm">No</button>
      </div>
    `;
    document.body.appendChild(container);

    // Adiciona evento para os botões de confirmação
    document.getElementById('confirm-yes').addEventListener('click', function() {
      window.location.href = link.getAttribute('href') + "?confirm=true";
      container.remove();
    });
    document.getElementById('confirm-no').addEventListener('click', function() {
      container.remove();
    });
  }

  // Intercepta cliques em links com o data-action 'delete-product'
  document.querySelectorAll('a[data-action="delete-product"]').forEach(function(link) {
    link.addEventListener('click', function(event) {
      event.preventDefault();
      showConfirmation('Are you sure you want to delete this product?', link);
    });
  });
});

