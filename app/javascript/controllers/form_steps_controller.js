import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step", "progressBar", "breedGrid"]
  static values = { current: Number, stage: Number }

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
      el.classList.toggle("d-none", index !== this.currentValue)
    })
  }

  updateProgress() {
    const stage = this.stageValue || 1

    let percent = 0

    switch (this.stageValue) {
      case 1:
        percent =
          ((this.currentValue + 1) / this.stepTargets.length) * 33.33
        break

      case 2:
        percent = 66.66
        break

      case 3:
        percent = 100
        break

      default:
        percent =
          ((this.currentValue + 1) / this.stepTargets.length) * 100
    }

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

    const lastPage =
      Math.ceil(this.breeds.length / this.breedsPerPage) - 1

    // PREVIOUS FIRST
    if (this.currentBreedPage > 0) {
      const prevCard = document.createElement("div")
      prevCard.classList.add("species-card")

      prevCard.innerHTML = `
        <div class="card-content">
          <div class="icon">
            <i class="fa-solid fa-arrow-left"></i>
          </div>

          <div class="name">
            Previous breeds
          </div>
        </div>
      `

      prevCard.addEventListener("click", () => {
        this.prevBreedPage()
      })

      grid.appendChild(prevCard)
    }

    // BREEDS
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

    // NEXT LAST
    if (this.currentBreedPage < lastPage) {
      const nextCard = document.createElement("div")
      nextCard.classList.add("species-card")

      nextCard.innerHTML = `
        <div class="card-content">
          <div class="icon">
            <i class="fa-solid fa-arrow-right"></i>
          </div>

          <div class="name">
            More breeds
          </div>
        </div>
      `

      nextCard.addEventListener("click", () => {
        this.nextBreedPage()
      })

      grid.appendChild(nextCard)
    }
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
