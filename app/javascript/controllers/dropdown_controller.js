import { Controller } from "@hotwired/stimulus"
import {leave, toggle} from "el-transition"

export default class extends Controller {
  static targets = ["menu", "button"]

  toggle() {
    toggle(this.menuTarget)
  }

  hide(event) {
    const buttonClicked = this.buttonTarget.contains(event.target)

    console.log(buttonClicked)
    if (!buttonClicked) {
        leave(this.menuTarget)
    }
  }
}
