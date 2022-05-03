// implement the function and return an Object
const splitTheBill = (group) => {
  let sum = 0;
  let people = 0;
  const balance = {};

  Object.keys(group).forEach((key) => {
    sum += group[key];
    people += 1;
  });

  Object.keys(group).forEach((key) => {
    balance[key] = group[key] - (sum / people);
  });

  return balance;
};

module.exports = splitTheBill; // Do not remove this line.
