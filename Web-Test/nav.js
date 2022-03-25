'use strict';

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
  const home = document.getElementById('home');
  const about = document.getElementById('about');
  const corpus = document.getElementById('corpus');
  const analysis = document.getElementById('analysis');
  const conclusion = document.getElementById('conclusion');
  const cur = document.getElementById(text);
  
  if (text === 'about' | text === 'corpus' | text === 'analysis'){
    document.getElementById('img').src = 'https://growingapologist.files.wordpress.com/2012/09/openbible-005-001.jpg';
  }
  else if (text === 'home'){
    document.getElementById('img').src = 'https://g.christianbook.com/dg/product/cbd/f400/160341.jpg';
  }
  else {
    document.getElementById('img').src = 'https://www.restorationlibrary.org/library/WWBB/WWBB_000_F_Cover%20Back.jpg';
  }

  home.style.display = 'none';
  about.style.display = 'none';
  corpus.style.display = 'none';
  analysis.style.display = 'none';
  conclusion.style.display = 'none';
  cur.style.display = 'block';
}