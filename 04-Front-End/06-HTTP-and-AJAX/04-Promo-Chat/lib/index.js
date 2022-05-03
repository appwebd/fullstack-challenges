const promo = 638; // change to your own promo id
const url = `https://wagon-chat.herokuapp.com/${promo}/messages`;

const comment = document.getElementById("your-message");
const name = document.getElementById("your-name");
const refresh = document.getElementById("refresh");
const messages = document.getElementById("messages-list");
const form = document.getElementById('comment-form');

const refreshChat = () => {
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      messages.innerHTML = "";
      data.messages.forEach((message) => {
        const minutesAgo = Math.round((new Date() - new Date(message.created_at)) / 60000);
        const msgElement = `<li>${message.content} (posted <span class="date">${minutesAgo} minutes</span> ago) by ${message.author}</li>`;
        messages.insertAdjacentHTML("afterbegin", msgElement);
      });
    });
};

const postMessage = (message, callback) => {
  fetch(url, {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(message)
  }).then(response => response.json())
    .then((data) => {
      console.log(data);
      callback();
    });
};

form.addEventListener("submit", (event) => {
  event.preventDefault();
  const data = { author: name.value, content: comment.value };
  postMessage(data, refreshChat);
});

refresh.addEventListener("click", refreshChat);

document.addEventListener("DOMContentLoaded", refreshChat);

setInterval(refreshChat, 5000);
