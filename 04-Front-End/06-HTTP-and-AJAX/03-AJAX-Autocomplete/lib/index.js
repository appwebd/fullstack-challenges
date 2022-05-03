// Autocomplete the input with AJAX calls.
const results = document.querySelector('#results');
const searchBox = document.getElementById('search');

const generateList = (data) => {
  data.words.forEach((word) => {
    const newWord = `<li class="list-group-item">${word}</li>`;
    results.insertAdjacentHTML('beforeend', newWord);
  });
};

const searchWord = (keyword) => {
  const wagonApi = `https://wagon-dictionary.herokuapp.com/autocomplete/${keyword}`;

  fetch(wagonApi)
    .then(response => response.json())
    .then(generateList);
};

searchBox.addEventListener('keyup', () => {
  searchWord(searchBox.value);
  results.innerHTML = '';
});
