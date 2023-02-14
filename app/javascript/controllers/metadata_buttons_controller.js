import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="metadata-buttons"
export default class extends Controller {
  toggle_button() {
    const button_id = this.element.getAttribute('data-button')
    const button = document.getElementById(button_id)

    if (this.element.childNodes.length >= 1) {
      button.innerHTML = button.getAttribute('data-hide-text')
      button.parentElement.setAttribute('action', button.getAttribute('data-hide-path'))
    }

    if (this.element.childNodes.length < 1) {
      button.innerHTML = button.getAttribute('data-show-text')
      button.parentElement.setAttribute('action', button.getAttribute('data-show-path'))
    }
  }
}
