import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-carrossel"
export default class extends Controller {
  static targets = ['item', 'carrossel']
  static values = { prev: Number, next: Number, current: Number }


  connect() {
    const urlParams = new URLSearchParams(window.location.search)
    const currentItem = document.getElementById(urlParams.get("filter") ? urlParams.get("filter") : "vegan")
    const nextItem = currentItem.nextElementSibling ? currentItem.nextElementSibling : this.itemTarget
    const previousItem = currentItem.previousElementSibling ? currentItem.previousElementSibling : this.itemTargets[this.itemTargets.length - 1]
    currentItem.classList.add("active")
    nextItem.classList.add("next")
    previousItem.classList.add("prev")

    this.carrosselTarget.setAttribute("data-filter-carrossel-current-value", this.itemTargets.indexOf(currentItem));
    this.carrosselTarget.setAttribute("data-filter-carrossel-prev-value", this.itemTargets.indexOf(previousItem));
    this.carrosselTarget.setAttribute("data-filter-carrossel-next-value", this.itemTargets.indexOf(nextItem));

  }

  gotoPrev() {
    this.carrosselTarget.setAttribute("data-filter-carrossel-current-value", this.currentValue > 0 ? this.currentValue - 1 : this.itemTargets.length - 1)
    this.updateClasses();
    window.location.replace(this.itemTargets[this.currentValue].querySelector("a").href)
  }

  gotoNext() {
    this.carrosselTarget.setAttribute("data-filter-carrossel-current-value", this.currentValue < this.itemTargets.length - 1 ? this.currentValue + 1 : 0)
    this.updateClasses();
    window.location.replace(this.itemTargets[this.currentValue].querySelector("a").href)
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
