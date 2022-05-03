// React to a click on the button!
const element = document.getElementById('clickme');
element.addEventListener("click", () => {
  const clickmeBtn = document.getElementById("clickme");
  clickmeBtn.disabled = true;
  clickmeBtn.innerText = "Bingo!";
  console.log("Clicked!");
});
