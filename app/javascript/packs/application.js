// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
import '@fortawesome/fontawesome-free/js/all';

window.addEventListener('turbolinks:load', function() {
  $('#file').on('change', function(e) {
    const file = e.currentTarget.files[0]
    const reader = new FileReader()
    const $preview = $("#img_field")
    reader.onload = (function(file) {
      return function(e) {
        $preview.empty()
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }))
      }
    })(file)
    reader.readAsDataURL(file)
  })
})
