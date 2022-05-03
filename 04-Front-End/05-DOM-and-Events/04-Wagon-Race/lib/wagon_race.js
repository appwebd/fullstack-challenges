// write your code here
const moveForward = (player) => {
  const wagon = document.querySelector(`#player${player}-race .active`);
  if (wagon.nextElementSibling) {
    wagon.nextElementSibling.classList.add('active');
    wagon.classList.remove('active');
  } else {
    alert(`Player ${player} wins! Play again?`);
    window.location.reload();
  }
};

const moveWagons = (event) => {
  if (event.key === "q") {
    moveForward(1);
  } else if (event.key === "p") {
    moveForward(2);
  }
};

document.addEventListener("keyup", moveWagons);
