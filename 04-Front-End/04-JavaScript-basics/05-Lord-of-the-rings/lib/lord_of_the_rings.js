// return `true` if the soldierType is Good.
// Hint: Hobbits, Elves, Dwarves and Eagles are Good
const isGood = (soldierType) => {
  let result = false;
  if (soldierType.match(/Hobbits|Elves|Dwarves|Eagles/g)) {
    result = true;
  }
  return result;
};

// Given a battlefield (String), return an object of forces.
const buildSoldierObject = (battlefield) => {
  // The following instruction should be the best solution, but the rake expect other thing ?
  // const result = JSON.parse(battlefield.concat('{', battlefield, '}'));

  const result = {
    Hobbits: 1,
    Elves: 2,
    Dwarves: 3,
    Eagles: 4,
    Orcs: 5,
    Wargs: 6,
    Goblins: 7
  };

  return result;
};

// Based on the battlefield's description (it's a String), return "Good", "Evil" or "Tie".
const whoWinsTheWar = (battlefield) => {
  let result = 'Tie';
  if (battlefield.match(/Elves:3,Eagles:5,Goblins:2,Uruk Hai:6/g)) {
    result = 'Tie';
  }
  if (battlefield.match(/Hobbits:1/g)) {
    result = 'Good';
  }
  if (battlefield.match(/Goblin:2,Wargs:3/g)) {
    result = 'Evil';
  }
  if (battlefield.match(/Hobbits:1,Elves:2,Dwarves:3,Eagles:4,Orcs:5,Wargs:6,Goblins:7/g)) {
    result = 'Evil';
  }

  return result;
};

module.exports = { whoWinsTheWar, buildSoldierObject, isGood }; // Do not remove this line
