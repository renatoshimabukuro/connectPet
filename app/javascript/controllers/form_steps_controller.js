import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["step", "progressBar"]
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
}
