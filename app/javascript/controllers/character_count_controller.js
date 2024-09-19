import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="character-count"
export default class extends Controller {
  static targets = ["input", "message"]

  connect() {
  }

  count () {
    let minimumCharacters = parseInt(this.element.dataset.characterMin);
    let maximumCharacters = parseInt(this.element.dataset.characterMax);
    let numberOfCharactersInput = this.inputTarget.value.length;
    let countCharacters = minimumCharacters - numberOfCharactersInput;
    let countCharactersMax = numberOfCharactersInput - maximumCharacters
    let message = this.messageTarget;

    if (this.inputTarget.value === "") {
      message.innerText = "";
    }

    if (numberOfCharactersInput < minimumCharacters && numberOfCharactersInput >= 1) {
      message.style.color = "red";
      message.innerText = `Minimum ${minimumCharacters} characters | ${countCharacters} left`
    }

    if (numberOfCharactersInput >= minimumCharacters) {
      message.style.color = "#198753";
      message.innerText = `${numberOfCharactersInput}/${maximumCharacters}`
    }

    if (numberOfCharactersInput > maximumCharacters) {
      message.style.color = "red";
      message.innerText = `Maximum ${maximumCharacters} characters | ${countCharactersMax} exceded`
    }
  }
}
