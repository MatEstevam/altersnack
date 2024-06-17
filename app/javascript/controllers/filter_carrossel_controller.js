import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-carrossel"
export default class extends Controller {
  static targets = ['item', 'carrossel']
  static values = { prev: Number, next: Number, current: Number }

  connect() {
    this.carrosselTarget.setAttribute("data-filter-carrossel-prev-value", this.itemTargets.length - 1);
  }

  gotoPrev() {
    this.carrosselTarget.setAttribute("data-filter-carrossel-current-value", this.currentValue > 0 ? this.currentValue - 1 : this.itemTargets.length - 1)
    this.updateClasses();
  }

  gotoNext() {
    this.carrosselTarget.setAttribute("data-filter-carrossel-current-value", this.currentValue < this.itemTargets.length - 1 ? this.currentValue + 1 : 0)
    this.updateClasses();
  }

  updateClasses() {
    this.carrosselTarget.setAttribute("data-filter-carrossel-prev-value", this.currentValue === 0 ? this.itemTargets.length - 1 : this.currentValue - 1);
    this.carrosselTarget.setAttribute("data-filter-carrossel-next-value", this.currentValue === this.itemTargets.length - 1 ? 0 : this.currentValue + 1);

    this.itemTargets.forEach((item, index) => {
      item.classList.remove("active", "prev", "next");
      if (index === this.prevValue) item.classList.add("prev");
      else if (index === this.currentValue) item.classList.add("active");
      else if (index === this.nextValue) item.classList.add("next");
    })
  }
}
