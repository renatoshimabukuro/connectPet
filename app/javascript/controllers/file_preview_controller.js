import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "name", "remove"]

  show() {
    const file = this.inputTarget.files[0]

    if (file) {
      this.nameTarget.textContent = file.name
      this.removeTarget.classList.remove("d-none")
    }
  }

  remove() {
    this.inputTarget.value= ""
    this.nameTarget.textContent = ""
    this.removeTarget.classList.add("d-none")
  }
}
