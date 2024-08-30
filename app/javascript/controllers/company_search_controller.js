import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

// Connects to data-controller="company-search"
export default class extends Controller {
  search(e) {
    let query = e.target.value
    let country = e.target.dataset.country
    if (query.length >= 3) {
      console.log(e.target.value)
      get(`/companies/search?query=${query}&country=${country}`,
        { headers: { 'Accept': 'text/vnd.turbo-stream.html'}})
    }
  }
}
