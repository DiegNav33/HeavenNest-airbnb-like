import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["startDate", "endDate", "totalGuests", "summary", "nightsCount", "period", "guestsCount", "totalPrice", "errorMessages"]

  checkDate(event) {
    event.preventDefault();

    let checkIn = this.startDateTarget.value;
    let checkOut = this.endDateTarget.value;
    let guests = this.totalGuestsTarget.value;
    let objDateCheckIn = new Date(checkIn);
    let objDateCheckOut = new Date(checkOut);

     // Get today's date
     let today = new Date();
     today.setHours(0, 0, 0, 0);  // Set time to 00:00:00 to avoid issues with time comparisons

    if (checkIn === "" || checkOut === "" || guests === "") {
      this.errorMessagesTarget.textContent = "Please fill in all the fields";
      this.summaryTarget.classList.remove("show");
      return
    }

    if (objDateCheckIn < today) {
      this.errorMessagesTarget.textContent = "Check-in date cannot be in the past";
      this.summaryTarget.classList.remove("show");
      return;
    }

    if (checkOut < checkIn || checkOut === checkIn) {
      this.errorMessagesTarget.textContent = "Check-out must be after check-in";
      this.summaryTarget.classList.remove("show");
      return
    }

    this.errorMessagesTarget.textContent = ""

    // Calculate the nbre of nights
    const millisecondsPerDay = 1000 * 60 * 60 * 24;
    const differenceInMilliseconds = objDateCheckOut - objDateCheckIn;
    const nights = Math.ceil(differenceInMilliseconds / millisecondsPerDay);

    // Calculate total price
    const pricePerNight = parseFloat(this.element.dataset.bookingPrice);
    const totalPrice = nights * pricePerNight;

    // Get dates
    const options = { month: 'long', day: 'numeric', year: 'numeric' };
    const startDateString = objDateCheckIn.toLocaleDateString('en-US', options);
    const endDateString = objDateCheckOut.toLocaleDateString('en-US', options);

    this.nightsCountTarget.textContent = `${nights} night(s)`;
    this.guestsCountTarget.textContent = `${guests} guest(s)`
    this.periodTarget.textContent = `From: ${startDateString} to ${endDateString}`;
    this.totalPriceTarget.textContent = `Total: € ${totalPrice.toFixed(2)}`;


    this.summaryTarget.classList.add("show");

    if (this.errorMessagesTarget.textContent !== "") {
      this.summaryTarget.classList.remove("show");
    }

  }
}
