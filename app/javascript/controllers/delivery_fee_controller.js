import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["restaurant", "deliveryFee"]

  connect() {
    this.toggleDeliveryFeeField();
  }

  toggleDeliveryFeeField() {
    if (this.restaurantTarget.value === "true" || this.restaurantTarget.value === true) {
      this.deliveryFeeTarget.style.display = "block";
    } else {
      this.deliveryFeeTarget.style.display = "none";
    }
  }
}
