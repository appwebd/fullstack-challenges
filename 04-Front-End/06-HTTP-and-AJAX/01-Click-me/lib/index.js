// Select the big green button
// Bind the `click` event to the button On click,
// display `Thank you!` in a JavaScript alert!
const displayAlertOnButtonClick = () => {
  const button = document.querySelector('button');
  button.addEventListener('click', () => {
    alert('Thank you!');
  });
};

displayAlertOnButtonClick(); // Do not remove!
