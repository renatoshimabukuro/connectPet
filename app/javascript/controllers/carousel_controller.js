import { Controller } from "@hotwired/stimulus"

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["scroll"]

  connect() {
    console.log("Carousel connected and ready.")
  }

  scrollLeft() {
    this.scrollTarget.scrollBy({
      left: -150,
      behavior: "smooth"
    })
  }

  scrollRight() {
    this.scrollTarget.scrollBy({
      left: 150,
      behavior: "smooth"
    })
  }
}
