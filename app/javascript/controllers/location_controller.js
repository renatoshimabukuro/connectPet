import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["country", "city"]

  updateCities() {
    console.log("updateCities fired") // 👈 check this

    const country = this.countryTarget.value

    const citiesByCountry = {
      JP: ["Tokyo", "Osaka", "Kyoto", "Matsuyama"],
      US: ["New York", "Chicago", "Los Angeles"]
    }

    const cities = citiesByCountry[country] || []

    // Clear existing options
    this.cityTarget.innerHTML = ""

    cities.forEach(city => {
      const option = document.createElement("option")
      option.value = city
      option.textContent = city
      this.cityTarget.appendChild(option)
    })
  }
}
