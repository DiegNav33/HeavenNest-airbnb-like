import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourite"
export default class extends Controller {

  stopPropagation(event) {
    event.stopPropagation();
  }
}
