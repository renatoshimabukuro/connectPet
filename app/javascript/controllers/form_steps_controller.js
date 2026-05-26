import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step", "progressBar", "breedGrid", "breedPrevButton",
  "breedNextButton"]
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

    const speciesIcon =
      event.target.closest("label")
        ?.querySelector(".icon i")
        ?.className || ""

    fetch(`/species/${speciesId}/breeds`)
      .then(res => res.json())
      .then(breeds => {
        this.breeds = breeds
        this.speciesIcon = speciesIcon
        this.currentBreedPage = 0
        this.breedsPerPage = 8

        this.renderBreedPage()
      })
  }

  renderBreedPage() {
    const grid = this.breedGridTarget
    grid.innerHTML = ""

    if (!this.breeds.length) {
      grid.innerHTML = "<p>No breeds found</p>"
      return
    }

    const start = this.currentBreedPage * this.breedsPerPage
    const end = start + this.breedsPerPage

    const visibleBreeds = this.breeds.slice(start, end)

    visibleBreeds.forEach(breed => {
      const card = document.createElement("label")
      card.classList.add("species-card")

      card.innerHTML = `
        <input
          type="radio"
          name="pet[breed_id]"
          value="${breed.id}"
          class="d-none"
        />

        <div class="card-content">
          <div class="icon">
            <i class="${this.speciesIcon}"></i>
          </div>

          <div class="name">
            ${breed.name}
          </div>
        </div>
      `

      grid.appendChild(card)
    })

    const lastPage =
      Math.ceil(this.breeds.length / this.breedsPerPage) - 1

    this.breedPrevButtonTarget.classList.toggle(
  "d-none",
  this.currentBreedPage === 0
)

this.breedNextButtonTarget.classList.toggle(
  "d-none",
  this.currentBreedPage >= lastPage
)
  }

  nextBreedPage() {
    this.currentBreedPage++
    this.renderBreedPage()
  }

  prevBreedPage() {
    this.currentBreedPage--
    this.renderBreedPage()
  }
}
