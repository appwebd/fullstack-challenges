// return the proper <li> HTML tag with its content (as a string)
const listItem = (content) => {
  let result = `<li class="list-group-item">${content}</li>`;
  if (content.length === 0) {
    result = '<li class="list-group-item"></li>';
  }
  return result;
};

// return the proper <ul> markup (as a string)
const unorderedList = (items) => {
  let result = '<ul class="list-group">';
  items.forEach((item) => {
    if (item.length > 0) {
      result = result.concat('<li class="list-group-item">', item, '</li>');
    }
  });
  result = result.concat('</ul>');
  return result;
};

module.exports = { listItem, unorderedList }; // Do not remove.
