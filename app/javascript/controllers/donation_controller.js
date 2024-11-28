import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="donation"
export default class extends Controller {
  static targets = ["donationInput"]

  setPreset(event) {
    let value = event.target.dataset.value; // Get the preset value from the button
    value = parseFloat(value); // Convert the value to a number
    this.donationInputTarget.value = value;
  }
}
