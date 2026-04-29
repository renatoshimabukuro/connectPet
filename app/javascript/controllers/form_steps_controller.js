import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step", "progressBar", "breedSelectContainer"]
  static values = { current: Number }

  connect() {
    this.currentValue = this.currentValue || 0
    this.showStep()
    this.updateProgress()
  }

  next() {
    if (this.currentValue < this.stepTargets.length - 1) {
      this.currentValue++
      this.showStep()
      this.updateProgress()
    }
  }

  prev() {
    if (this.currentValue > 0) {
      this.currentValue--
      this.showStep()
      this.updateProgress()
    }
  }

  showStep() {
    this.stepTargets.forEach((el, index) => {
      el.classList.toggle("hidden", index !== this.currentValue)
    })
  }

  updateProgress() {
    const percent = ((this.currentValue + 1) / this.stepTargets.length) * 100
    this.progressBarTarget.style.width = `${percent}%`
  }

  filterBreeds(event) {
  const speciesId = event.target.value

  console.log("species selected:", speciesId)

  fetch(`/species/${speciesId}/breeds`)
    .then(res => res.json())
    .then(breeds => {
      console.log("breeds received:", breeds)

      const select = this.breedSelectContainerTarget.querySelector("select")

      if (!breeds || breeds.length === 0) {
        select.innerHTML = `<option value="">No breeds found</option>`
        return
      }

      select.innerHTML = `<option value="">Select breed</option>`

      breeds.forEach(breed => {
        const option = document.createElement("option")
        option.value = breed.id
        option.textContent = breed.name
        select.appendChild(option)
      })
    })
    .catch(err => {
      console.error("breed fetch failed:", err)
    })
}
}
