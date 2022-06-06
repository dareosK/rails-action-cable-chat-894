import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    // console.log("this works!")
    // console.log(this.chatroomIdValue)
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue},
      { received: data => this.#insertMessageAndScroll(data) }
    )
  }

  #insertMessageAndScroll(data) {
    // adds the message into the dom
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    // scrolls down
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event){
    event.target.reset()
  }
}
