import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="company-autocomplete"
export default class extends Controller {
  static targets = ["paste", "results"]

  paste(e) {
    console.log(e.target.innerText)
    // this.pasteTarget.value = e.target.innerText
    this.pasteTarget.value = e.target.dataset.companyid
    this.resultsTarget.innerHTML = ""
  }
}
