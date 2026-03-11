import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["text", "file", "send"]

  connect() {
    this.check()
  }

  check() {
    const text = this.textTarget.value.trim()
    const file = this.fileTarget.files.length > 0

    this.sendTarget.disabled = !(text || file)
  }

  sending() {
    this.sendTarget.disabled = true
    this.sendTarget.innerHTML = "..."
  }

  reset() {
    this.sendTarget.innerHTML = '<i class="fa-solid fa-arrow-up"></i>'
    this.check()
  }
}
