// Implement the method and return an integer
const ageInDays = (day, month, year) => {
  const birthday = new Date(year, month - 1, day);
  return Math.round((Date.now() - birthday) / (1000 * 24 * 60 * 60));
};

module.exports = ageInDays; // Do not remove. We need this for the spec to know about your method.
