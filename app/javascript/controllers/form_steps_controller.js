import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step", "progressBar", "breedGrid"]
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
  const speciesIcon = event.target.closest("label")
    ?.querySelector(".icon i")?.className || ""

  fetch(`/species/${speciesId}/breeds`)
    .then(res => res.json())
    .then(breeds => {
      const grid = this.breedGridTarget
      grid.innerHTML = ""

      if (!breeds.length) {
        grid.innerHTML = "<p>No breeds found</p>"
        return
      }

      breeds.forEach(breed => {
        const card = document.createElement("label")
        card.classList.add("species-card")

        card.innerHTML = `
          <input type="radio" name="pet[breed_id]" value="${breed.id}" class="hidden" />
          <div class="card-content">
            <div class="icon"><i class="${speciesIcon}"></i></div>
            <div class="name">${breed.name}</div>
          </div>
        `

        grid.appendChild(card)
      })
    })
}
}
