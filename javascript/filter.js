"use strict";

const button = document.querySelectorAll('button');
window.addEventListener('DOMContentLoaded', (event) => {
    /* Attach event listeners to checkboxes */
    for (var i = 0; i < button.length; i++) {
        button[i].addEventListener('click', hideShow, false)
    }
});
function hideShow() {
  let text = this.textContent;
  text = text.toLowerCase();
  const home = document.getElementById("home");
  const about = document.getElementById('about');
  const corpus = document.getElementById('corpus');
  const analysis = document.getElementById('analysis');
  const conclusion = document.getElementById('conclusion');
  const cur = document.getElementById(text);
  
  home.style.display = "none";
  about.style.display = "none";
  corpus.style.display = "none";
  analysis.style.display = "none";
  conclusion.style.display = "none";
  cur.style.display = "block";
}