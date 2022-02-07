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

  document.getElementById("letter-0").focus();
  document.getElementById("letter-0").setSelectionRange(1, 1);
  const word = $('#word').data('word');
  // const xx = word.split
  const large = word.length;
  const letters = [];
  const elem = document.activeElement;

  console.log('elem', elem)
  function validate(input) {
    console.log('input: ', input)
    const large = input.value.length - 1
    input.value = input.value.replace(/[^abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ ]/g, '').substr(large, 1).toUpperCase();
    input.setSelectionRange(1, 1);
    recorre();
    changeFocus();
  }
  window.validate = validate;

  function changeFocus() {
    let num = Number(document.activeElement.id.split('-')[1]);
    num == (large - 1) ? num = 0 : num++;
    console.log('active: ', num);
    console.log('active: ', large);
    $('#letter-' + num).focus();
    document.activeElement.setSelectionRange(1, 1);
  }

  function toTheEnd(input) {
    input.setSelectionRange(1, 1);
  }
  window.toTheEnd = toTheEnd;

  console.log('large: ', large);
  console.log('word: ', word);

  function recorre() {
    for (let step = 0; step < large; step++) {
      let xx = $('#letter-' + step);
      letters[step] = xx[0].value.toLowerCase();
    }
    console.log('letters: ', letters);
    console.log('letters join: ', letters.join(''));
  }

  $("#answer").click(function () {
    $(".hide-definition").fadeIn();
  });

  $("#reset").click(function () {
    for (let step = 0; step < large; step++) {
      $('#letter-' + step)[0].value = '';
    }
    document.getElementById("letter-0").focus();
  });

});

$(document).on('turbolinks:load', function () {
});