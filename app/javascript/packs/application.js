// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

//-------------------------------------------------------//

import $ from 'jquery';
global.$ = jQuery;

//-------------------------------------------------------//

$(document).ready(function () {

  const word = $('#word').data('word');
  const large = word.length;
  const letters = [];

  console.log(large);
  console.log(word);

  for (let step = 0; step < large; step++) {
    let xx = $('#letter-' + step);
    console.log(xx[0].value);
    letters[step] = xx[0].value.toLowerCase();
  }

  console.log(letters);
  console.log(letters.join(''));

  $("#answer").click(function () {
    $(".hide-definition").fadeIn();
  });

  $("#letter-1").click(function () {
    console.log(this.value);
  });

});
