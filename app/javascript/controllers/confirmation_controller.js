// controllers/confirmation_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["link"];

  connect() {
    this.element.querySelectorAll('[data-action="delete-product"]').forEach(link => {
      link.addEventListener('click', (event) => {
        event.preventDefault();
        this.showConfirmation('Are you sure you want to delete this product?', link);
      });
    });
  }

  showConfirmation(message, link) {
    const container = document.createElement('div');
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

    // Adicionar eventos para os botões de confirmação
    container.querySelector('#confirm-yes').addEventListener('click', () => {
      this.sendDeleteRequest(link);
      container.remove();
    });
    container.querySelector('#confirm-no').addEventListener('click', () => {
      container.remove();
    });
  }

  sendDeleteRequest(link) {
    const url = link.getAttribute('href');
    fetch(url, {
      method: 'DELETE',
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      }
    }).then(response => {
      if (response.ok) {
        // Aqui você pode adicionar lógica para remover o item do DOM ou fazer outra atualização na página
        link.closest('.item-class').remove(); // Substitua '.item-class' pela classe do item no seu HTML
      } else {
        console.error('Failed to delete the item.');
      }
    }).catch(error => {
      console.error('Error:', error);
    });
  }
}
