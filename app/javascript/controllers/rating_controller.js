import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "memo"]
  static values = { url: String }

  select(event) {
    const value = event.currentTarget.dataset.ratingValue
    this.inputTarget.value = value
    this._setActive(event.currentTarget)
    this.save()
  }

  toggleMemo() {
    this.memoTarget.classList.toggle("d-none")
    this.memoTarget.querySelector("textarea")?.focus()
  }

  save() {
    this.element.closest("form").requestSubmit()
  }

  _setActive(button) {
    button.parentElement
    .querySelectorAll(".rating-btn")
    .forEach(btn => btn.classList.remove("active"))
    button.classList.add("active")
  }
}
