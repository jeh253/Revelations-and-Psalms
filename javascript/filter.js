"use strict";

const checkboxesEmotion = document.querySelectorAll('.emotion-filtering-container > input');
const checkboxesTone = document.querySelectorAll('.tone-filtering-container > input');
const readingCheckboxes = document.querySelectorAll('.texts-filtering-container > input');
window.addEventListener('DOMContentLoaded', (event) => {
    /* Attach event listeners to checkboxes */
    for (var i = 0; i < checkboxesEmotion.length; i++) {
        checkboxesEmotion[i].addEventListener('change', high, false) /* high for emotion */
    }
    for (var i = 0; i < checkboxesTone.length; i++) {
        checkboxesTone[i].addEventListener('change', light, false) /* light for tone */
    }
    for (var i = 0; i < readingCheckboxes.length; i++) {
        readingCheckboxes[i].addEventListener('change', filter, false) 
    }
});
/* for emotion */
function high() {
  const emotion = this.id;
  const emotionElements = document.getElementsByClassName(emotion);
  for(var i = 0; i < emotionElements.length; i++){
      emotionElements[i].classList.toggle("high");
  }
}

/* for tone */
function light() {
  const tone = this.id;
  const toneElements = document.getElementsByClassName(tone);
  for(var i = 0; i < toneElements.length; i++){
      toneElements[i].classList.toggle("light");
  }
}

function filter(){
    var check_array = Array.from(readingCheckboxes).filter(item => item.checked).map(item => item.id)
    
    const corpora = document.getElementsByClassName('corpora');
    console.log(corpora);
    for(var i = 0; i < corpora.length; i++){
        corpora[i].style.display = 'none';
        if(Array.from(corpora[i].classList).some(item => check_array.includes(item))){
            corpora[i].style.display = 'block';
        }
    }
    
}