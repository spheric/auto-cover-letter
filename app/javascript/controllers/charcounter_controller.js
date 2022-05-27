import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="charcounter"
export default class extends Controller {
  static targets = ["source", "count"]

  connect() {
    this.countTarget.innerText = this.sourceTarget.attributes.maxlength.value - this.sourceTarget.value.length
  }

  count(event) {
    this.countTarget.innerText = event.params.maxvalue - event.currentTarget.value.length
  }
}
