import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["preview", "input"]

  openFilePicker() {
    this.inputTarget.click()
  }

  previewImage(event) {
    const file = event.target.files?.[0]
    if (!file) return

    const reader = new FileReader()

    reader.onload = (e) => {
      this.previewTarget.innerHTML =
        `<img src="${e.target.result}" alt="Pet photo preview">`

      this.previewTarget.classList.add("has-image")
    }

    reader.readAsDataURL(file)
  }
}
