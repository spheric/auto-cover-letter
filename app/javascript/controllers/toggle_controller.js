import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["show", "hide"]

  connect() {
  }

  toggle(event) {
    event.preventDefault()

    this.showTarget.classList.add("hidden")
    this.hideTarget.classList.remove("hidden")

    setTimeout(() => {
      this.showTarget.classList.remove("hidden")
      this.hideTarget.classList.add("hidden")
    }, 1000)
  }
}
