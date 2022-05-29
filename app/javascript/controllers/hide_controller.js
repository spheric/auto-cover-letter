import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hide"
export default class extends Controller {
  static targets = ["source"]

  connect() {
  }

  hide(event) {
    this.sourceTargets.forEach(function(target) {
      const dataset = target.dataset
      if(dataset.hide || dataset.hideLocation == window.location.pathname || dataset.hideLocation == (window.location.pathname + '/')) {
        target.classList.add('hidden')
      }
    })
  }
}
