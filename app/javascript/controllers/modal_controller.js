import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const modalFrame = document.getElementById("modal")
    if (modalFrame && modalFrame.innerHTML.trim() !== "") {
      document.body.classList.add("modal-open")
      console.log("Modal controller connected");
    }
  }

  close(e) {
    if (e) e.preventDefault()

    const modalFrame = document.getElementById("modal")

    if (modalFrame) {
      modalFrame.removeAttribute("src")
      modalFrame.innerHTML = ""
    }

    document.body.classList.remove("modal-open")
  }

  closeBackground(e) {
    if (e.target === this.element) {
      this.close(e)
    }
  }
}
