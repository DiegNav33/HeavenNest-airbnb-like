import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["startDate", "endDate", "totalGuests", "summary", "nightsCount", "period", "totalPrice", "errorMessages"]

  checkDate(event) {
    event.preventDefault();
    console.log("ok");

    let checkIn = this.startDateTarget.value;
    let checkOut = this.endDateTarget.value;
    let guests = this.totalGuestsTarget.value;
    let objDateCheckIn = new Date(checkIn);
    let objDateCheckOut = new Date(checkOut);

    if (checkIn === "" || checkOut === "" || guests === "") {
      this.errorMessagesTarget.textContent = "Please fill in all the fields"
      return
    }

    if (checkOut < checkIn || checkOut === checkIn) {
      this.errorMessagesTarget.textContent = "Check-out must be after check-in"
      return
    }

    this.errorMessagesTarget.textContent = ""

    // Calculer le nombre de nuits
    const millisecondsPerDay = 1000 * 60 * 60 * 24;
    const differenceInMilliseconds = objDateCheckOut - objDateCheckIn;
    const nights = Math.ceil(differenceInMilliseconds / millisecondsPerDay);

    // Calculer le prix total
    const pricePerNight = parseFloat(this.element.dataset.bookingPrice);
    const totalPrice = nights * pricePerNight;

    // Formater les dates
    const options = { month: 'long', day: 'numeric', year: 'numeric' };
    const startDateString = objDateCheckIn.toLocaleDateString('en-US', options);
    const endDateString = objDateCheckOut.toLocaleDateString('en-US', options);

    this.nightsCountTarget.textContent = `${nights} night(s)`;
    this.periodTarget.textContent = `From: ${startDateString} to ${endDateString}`;
    this.totalPriceTarget.textContent = `Total: € ${totalPrice.toFixed(2)}`;


    this.summaryTarget.classList.remove("d-none");

  }
}
