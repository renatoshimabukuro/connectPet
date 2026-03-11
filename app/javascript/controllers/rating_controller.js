import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "modal"]

  static values = {
    text: String
  }

  connect() {
    console.log("Hi")
  }

  select(event) {
    event.preventDefault()

    const button = event.currentTarget
    const value = button.dataset.ratingTextValue.split(" ")[0]
    const attribute = button.dataset.ratingTextValue.split(" ")[1]

    const formField = document.getElementById(`log_${attribute}_value`)
    formField.value = value

    this._setActive(button)
  }

  _setActive(clickedButton) {
    const buttons =
      clickedButton.closest(".rating-btns").querySelectorAll(".rating-btn")

    buttons.forEach(
      btn => btn.classList.remove("rating-btn-active")
    )
    clickedButton.classList.add("rating-btn-active")
  }

  openModal(event) {
    event.preventDefault()
    const ratingDiv = event.currentTarget.closest(".rating")
    const modal = ratingDiv.querySelector(".memo-modal")
    const tempTextarea = modal.querySelector(".memo-textarea")
    const hiddenInput = ratingDiv.querySelector("[id$='_memo_hidden']")

    if (hiddenInput && tempTextarea) {
      tempTextarea.value = hiddenInput.value || ""
    }

    modal.classList.toggle("d-none")
  }

  saveMemo(event) {
    event.preventDefault()
    const ratingDiv = event.currentTarget.closest(".rating")
    const modal = ratingDiv.querySelector(".memo-modal")
    const tempTextarea = modal.querySelector(".memo-textarea")
    const hiddenInput = ratingDiv.querySelector("[id$='_memo_hidden']")

    if (hiddenInput && tempTextarea) {
      hiddenInput.value = tempTextarea.value
    }

    modal.classList.add("d-none")
  }

  cancelMemo(event) {
    event.preventDefault()
    const ratingDiv = event.currentTarget.closest(".rating")
    const modal = ratingDiv.querySelector(".memo-modal")
    const tempTextarea = modal.querySelector(".memo-textarea")

    if (tempTextarea) {
      tempTextarea.value = ""
    }

    modal.classList.add("d-none")
  }

  closeModal(event) {
    event.preventDefault()
    this.modalTarget.classList.add("d-none")
  }

  closeBackground(event) {
    if (event.target === this.element) {
      this.closeModal(event)
    }
  }
}
