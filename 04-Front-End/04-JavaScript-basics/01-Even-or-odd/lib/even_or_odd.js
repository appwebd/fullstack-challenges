// this should return "even" if the number is even, "odd" otherwise
const evenOrOdd = (number) => {
  let result = "odd"; // Impar
  if (number % 2 === 0) {
    result = "even"; // par
  }
  return result;
};

module.exports = evenOrOdd; // Do not remove. We need this for the spec to know about your method.
