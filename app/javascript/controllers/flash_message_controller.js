import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash-message"
export default class extends Controller {

  static targets = ["flashNotice", "flashAlert"]

  connect() {
    setTimeout(() => {
      if (this.hasFlashNoticeTarget) {
        this.flashNoticeTarget.classList.add("show");
      }
      if (this.hasFlashAlertTarget) {
        this.flashAlertTarget.classList.add("show");
      }
    }, 100);

    setTimeout(() => {
      if (this.hasFlashNoticeTarget) {
        this.flashNoticeTarget.classList.remove("show");
      }
      if (this.hasFlashAlertTarget) {
        this.flashAlertTarget.classList.remove("show");
      }
    }, 3000);
  }
}
