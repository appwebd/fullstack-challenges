const cast = (data) => {
  if (data.match(/true|false/g)) {
    return data === 'true';
  }

  if ((data.match(/\d/g) || []).length === data.length) {
    return Number.parseInt(data, 10);
  }
  return data;
};

const dataset = (element) => {
  const openingTag = element.split('>')[0];
  const rawAttributes = openingTag.match(/data-\w+="\w+"/g) || [];
  const attributes = {};
  rawAttributes.forEach((attribute) => {
    const matchData = attribute.match(/data-(.+)="(.+)"/);
    attributes[matchData[1]] = cast(matchData[2]);
  });
  return attributes;
};

module.exports = dataset; // Do not remove.
