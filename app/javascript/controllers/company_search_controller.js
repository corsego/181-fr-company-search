import { Controller } from "@hotwired/stimulus"
import { get } from '@rails/request.js'

// Connects to data-controller="company-search"
export default class extends Controller {
  search(e) {
    let query = e.target.value
    if (query.length >= 3) {
      console.log(e.target.value)
      get(`/companies/search?query=${query}`,
        { headers: { 'Accept': 'text/vnd.turbo-stream.html'}})
    }
  }
}
