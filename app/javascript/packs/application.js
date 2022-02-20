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
  if (document.getElementById("letter-0")) {
    document.getElementById("letter-0").focus();
    document.getElementById("letter-0").setSelectionRange(1, 1);
  }
  const word = $('#word').data('word').split('');
  const large = word.length;
  const letters = new Array(large).fill('');
  const elem = document.activeElement;

  function validate(input) {
    // console.log("🚀 ~ input: ", input.keyCode || input.which)
    const pos = parseInt(input.id.split('-')[1]);
    // console.log("🚀 ~ pos: ", pos)
    const large = input.value.length
    let letter = '';
    if (large === 1) {
      letter = input.value.replace(/[^abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZáéíóúÁÉÍÓÚ ]/g, '')
    } else {
      letter = input.value.split('')[0]
      const lastLetter = input.value.split('').slice(-1).join().replace(/[^abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZáéíóúÁÉÍÓÚ ]/g, '')
      if (lastLetter !== '') letter = lastLetter;
    }
    letters[pos] = letter.toLowerCase();
    if (input.value !== '') input.value = letter.toUpperCase();
    input.setSelectionRange(1, 1);
    analize(pos);
    changeFocus();
  }
  window.validate = validate;

  function changeFocus() {


    let num = Number(document.activeElement.id.split('-')[1]);
    var cont = 0;
    while (true) {
      cont++;
      num == (large - 1) ? num = 0 : num++;
      if ($('#letter-' + num).is(':enabled')) {
        $('#letter-' + num).focus();
        break
      }
      // console.log('large:', large)
      // console.log('num:', num)
      if (cont > large) break;
    }
    document.activeElement.setSelectionRange(1, 1);
  }

  function toTheEnd(input) {
    input.setSelectionRange(1, 1);
  }
  window.toTheEnd = toTheEnd;

  function analize(pos) {
    const letter = letters[pos];

    if (word.join('') === letters.join('')) {
      $('#letter-' + pos).css('background', '#00FF00'); // green
      document.getElementById('letter-' + pos).disabled = true;
      $(".hide-definition").fadeIn();
      alert('You Win!!!');
      return
    }

    if (word[pos] === letter) {
      $('#letter-' + pos).css('background', '#00FF00'); // green
      // $('#letter-' + pos).readOnly = true;
      document.getElementById('letter-' + pos).disabled = true;
      // document.getElementById("letter-1").disabled = true;
      for (let step = 0; step < large; step++) {
        // if (letters[step] !== '' && pos !== step && letters[step] !== word[step] && letters[step] === letter) {
        // if (letters[step] !== '' && letters[step] !== word[step] && letters[step] === letter) {
        if (letters[step] !== word[step] && letters[step] === letter) {
          $('#letter-' + step).css('background', '#CCCCCC'); // gray
          break;
        }
      }

    } else if (word.includes(letter)) {
      const totalWord = word.filter(x => x == letter).length
      const totalLetters = letters.filter(x => x == letter).length
      let greens = 0;
      for (let step = 0; step < large; step++) {
        if (word[step] !== '' && word[step] === letters[step]) {
          greens++;
        }
      }
      if (totalLetters > totalWord) {
        $('#letter-' + pos).css('background', '#CCCCCC'); // gray
      } else {
        $('#letter-' + pos).css('background', '#F90000'); // red
      }

    } else if (letters[pos] === '') {
      $('#letter-' + pos).css('background', '#FFFFFF'); // white

    } else {
      $('#letter-' + pos).css('background', '#CCCCCC'); // gray
    }

  }
  $("#answer").click(function () {
    $(".hide-definition").fadeIn();
  });

  $("#reset").click(function () {
    for (let step = 0; step < large; step++) {
      $('#letter-' + step)[0].value = '';
      document.getElementById('letter-' + step).disabled = false;
      letters[step] = '';
      // $('#letter-' + step).value = 'h';
      $('#letter-' + step).css('background', '#FFFFFF'); // white
    }
    document.getElementById("letter-0").focus();
    $(".hide-definition").fadeOut();
  });
});

$(document).on('turbolinks:load', function () {
});