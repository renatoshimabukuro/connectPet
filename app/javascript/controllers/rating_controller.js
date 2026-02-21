import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button"]
  static values = {
    text: String
  }

  connect() {
    console.log("Hi")
  }

  select(event) {
    event.preventDefault();
    const button = event.currentTarget
    const value = button.innerText
    const attribute = this.buttonTarget.dataset.ratingTextValue.split(" ")[1]
    const formField = document.getElementById(`log_${attribute}_value`)
    formField.value = value
  }
}
