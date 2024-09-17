import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="character-count"
export default class extends Controller {
  static targets = ["input", "message"]
  connect() {
  }

  count () {
    let minimumCharacters = parseInt(this.element.dataset.characterNumber);
    let numberOfCharactersInput = this.inputTarget.value.length;
    let countCharacters = minimumCharacters - numberOfCharactersInput;
    let message = this.messageTarget;

    if (this.inputTarget.value === "") {
      message.innerText = "";
    }

    if (numberOfCharactersInput < minimumCharacters && numberOfCharactersInput >= 1) {
      message.style.color = "red";
      message.innerText = `${minimumCharacters} characters min | ${countCharacters} left`
    }

    if (numberOfCharactersInput >= minimumCharacters) {
      message.style.color = "#198753";
      message.innerText = `${numberOfCharactersInput} characters`
    }
  }
}
