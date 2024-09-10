// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

import "./cafe_image_preview";

// Bootstrap
import "jquery";
// Import CSS
import "popper.js";
import "bootstrap";
import "../stylesheets/application.scss";

// import Raty from "./raty.js"
import $ from "jquery";

//= require review_rating
window.$ = window.jQuery = require("jquery");
import Raty from "raty.js";
window.raty = function (elem, opt) {
  let raty = new Raty(elem, opt);
  raty.init();
  return raty;
};

Rails.start();
Turbolinks.start();
ActiveStorage.start();

function loadPreview(input) {
  var preview = document.getElementById("profile-preview");
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      preview.src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  }
}

$(document).on("turbolinks:load", function () {
  $("body").on("ajax:success", ".relationship_form", function (event) {
    var response = event.detail[0];
    $("#follow_form").html(response);
  });
});
