import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button"]

  connect() {
    console.log("Hi")
  }

  select(event) {
    event.preventDefault();
    console.log(event.currentTarget.innerText)
  }
}
