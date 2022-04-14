/* Change text color for clicked element only */

 /* emotions - colored text */
const anger = document.getElementById('anger');
btn.addEventListener('click', function onClick(event) {
    event.target.style.color = 'red';
});

const joy = document.getElementById('joy');
btn.addEventListener('click', function onClick(event) {
    event.target.style.color = 'light pink';
});

const contentment = document.getElementById('contentment');
btn.addEventListener('click', function onClick(event) {
    event.target.style.color = 'green';
});

const fear = document.getElementById('fear');
btn.addEventListener('click', function onClick(event) {
    event.target.style.color = 'yellow';
});

const sorrow = document.getElementById('sorrow');
btn.addEventListener('click', function onClick(event) {
    event.target.style.color = 'light blue';
});

/* tones - currently be colored, need to be underlined */
const pleading = document.getElementById('pleading');
btn.addEventListener('click', function onClick(event) {
    event.target.style.color = 'yellow';
});

const petitioning = document.getElementById('petitioning');
btn.addEventListener('click', function onClick(event) {
    event.target.style.color = '#FF0099'; // hot pink
});

const violence = document.getElementById('violence');
btn.addEventListener('click', function onClick(event) {
    event.target.style.color = 'red';
});

const boasting = document.getElementById('boasting');
btn.addEventListener('click', function onClick(event) {
    event.target.style.color = 'green';
});

const anxiety = document.getElementById('anxiety');
btn.addEventListener('click', function onClick(event) {
    event.target.style.color = 'light blue';
});

const praise = document.getElementById('praise');
btn.addEventListener('click', function onClick(event) {
    event.target.style.color = 'light pink';
});

/* this is gonna give me an error bc of having 
 * fear in the emotion section too so rn it's listed as fear2 
 * lol sorry!! */
const fear2 = document.getElementById('fear2');
btn.addEventListener('click', function onClick(event) {
    event.target.style.color = 'yellow';
});

const righteousness = document.getElementById('righteousness');
btn.addEventListener('click', function onClick(event) {
    event.target.style.color = '#CC80CC';
});