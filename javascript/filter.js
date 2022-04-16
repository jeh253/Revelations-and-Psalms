"use strict";

const checkboxes = document.querySelectorAll('.texts-filtering-container > input');
const readingCheckboxes = document.querySelectorAll('.texts-filtering-box > input');
window.addEventListener('DOMContentLoaded', (event) => {
    /* Attach event listeners to checkboxes */
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].addEventListener('change', highlight, false)
    }
    for (var i = 0; i < readingCheckboxes.length; i++) {
        readingCheckboxes[i].addEventListener('change', filter, false)
    }
});
function highlight() {
/* This function works for both emotion and tone, CSS will control how each tone/emotion is highlighted or colored */
  const emotion = this.id;
  const emotionElements = document.getElementsByClassName(emotion);
  for(var i = 0; i < emotionElements.length; i++){
      emotionElements[i].classList.toggle("highlight");
  }
}
function filter(){
    var check_array = Array.from(readingCheckboxes).filter(item => item.checked).map(item => item.id)
    
    const corpora = document.getElementsByClassName('corpora');
    for(var i = 0; i < corpora.length; i++){
        corpora[i].style.display = 'none';
        if(Array.from(corpora[i].classList).some(item => check_array.includes(item))){
            corpora[i].style.display = 'block';
        }
    }
    
}