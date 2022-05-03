// computer score from rolls
const bowlingScore = (rolls) => {
  let total = 0;
  let i = 0;
  let frame = 1;

  while (i < rolls.length - 1 && frame < 10) {
    if (rolls[i] === 10) {
      total += rolls[i] + rolls[i + 1] + rolls[i + 2];
      i += 1;
    } else if (rolls[i] + rolls[i + 1] === 10) {
      total += rolls[i] + rolls[i + 1] + rolls[i + 2];
      i += 2;
    } else {
      total += rolls[i] + rolls[i + 1];
      i += 2;
    }
    frame += 1;
  }
  if (rolls[i] + rolls[i + 1] === 10 || rolls[i] === 10) {
    total += rolls[i] + rolls[i + 1] + rolls[i + 2];
  } else {
    total += rolls[i] + rolls[i + 1];
  }
  return total;
};

module.exports = bowlingScore; // Do not remove this line.
