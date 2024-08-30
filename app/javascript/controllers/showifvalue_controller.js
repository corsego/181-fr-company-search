import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="showifvalue"
// show div if value of input is equal to data-showif-value
// hidden divs have all inputs and selects disabled
export default class extends Controller {
  static targets = ['input', 'output']

  connect() {
    this.toggle()
  }

  toggle() {
    var value = this.inputTarget.value

    this.outputTargets.forEach(outputTarget => {
      var selectedValue = outputTarget.dataset.showifValue
      if (selectedValue === value) {
        this.showOutputTarget(outputTarget)
      } else {
        this.hideOutputTarget(outputTarget)
      }
    })
  }

  hideOutputTarget(outputTarget) {
    outputTarget.hidden = true
    outputTarget.disabled = true
    outputTarget.querySelectorAll('select').forEach(select => {
      select.setAttribute('disabled', true)
    })
    outputTarget.querySelectorAll('input').forEach(input => {
      input.setAttribute('disabled', true)
    })
  }

  showOutputTarget(outputTarget) {
    outputTarget.hidden = false
    outputTarget.disabled = false
    outputTarget.querySelectorAll('select').forEach(select => {
      select.removeAttribute('disabled')
    })
    outputTarget.querySelectorAll('input').forEach(input => {
      input.removeAttribute('disabled')
    })
  }

  inputTargetConnected() {
    this.toggle()
  }

  inputTargetDisconnected() {
    this.toggle()
  }

  outputTargetConnected() {
    this.toggle()
  }

  outputTargetDisconnected() {
    this.toggle()
  }
}