import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

// Connects to data-controller="company-search"
export default class extends Controller {
  async search(e) {
    let query = e.target.value
    let country = e.target.dataset.country
    await get(`/companies/search?query=${query}&country=${country}`,
      { responseKind: 'turbo-stream' })
  }
}
