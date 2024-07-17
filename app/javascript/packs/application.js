// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

//import "bootstrap/dist/js/bootstrap"

// Bootstrap
import 'jquery';
// Import CSS
import "popper.js";
import "bootstrap";
import "../stylesheets/application.scss";

// jQuery
// import $ from 'jquery'
// global.$ = jQuery;

//import { library, dom } from '@fortawesome/fontawesome-svg-core';
//import { fas } from '@fortawesome/free-solid-svg-icons';
//import { far } from '@fortawesome/free-regular-svg-icons';
//import { fab } from '@fortawesome/free-brands-svg-icons';

//library.add(fas, far, fab);

// この行はDOMを監視してFontAwesomeアイコンを自動的に置き換える
//dom.watch();

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("DOMContentLoaded", () => {
  const imageInput = document.querySelector('input[type="file"][multiple]');
  const previewContainer = document.getElementById("image-preview");

  if (imageInput && previewContainer) {
    imageInput.addEventListener("change", () => {
      previewContainer.innerHTML = "";
      Array.from(imageInput.files).forEach(file => {
        const reader = new FileReader();
        reader.onload = (event) => {
          const img = document.createElement("img");
          img.src = event.target.result;
          img.classList.add("img-preview");
          previewContainer.appendChild(img);
        };
        reader.readAsDataURL(file);
      });
    });
  }
});