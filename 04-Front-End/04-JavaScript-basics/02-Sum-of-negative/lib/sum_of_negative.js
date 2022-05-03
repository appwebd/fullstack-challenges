// You are getting a `numbers` array. Return the sum of **negative** numbers only.
const sumOfNegative = (numbers) => {
  let sum = 0;
  numbers.forEach((item) => {
    if (item < 0) {
      sum += item;
    }
  });
  return sum;
};

module.exports = sumOfNegative; // Do not remove.
