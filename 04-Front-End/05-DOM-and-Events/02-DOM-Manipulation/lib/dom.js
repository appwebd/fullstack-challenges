/* eslint-disable no-multiple-empty-lines */
/* eslint-disable prefer-const */

// INSTRUCTIONS - PLEASE READ!!
// Here are some challenges. Solve them from top to bottom

// **Each time** you complete a challenge, please commit and push!
// This is a good practise. Each time you make some progress in software
// development, you want to save a snapshot.

module.exports = function runChallenges(check) {
  // Ex 1. Read what's written in the email input
  //       Make the function getEmail() return it
  //       return the email

  const getEmail = () => {
    return document.getElementById('email').value;
  };

  // /!\ DO NOT CHANGE THIS LINE - TEST PURPOSES
  const borisesEmail = getEmail();

  // Ex 2. Change the content of the email input by writing your own email address
  let myEmail = document.getElementById("email");
  myEmail.value = 'patricio-rojaso@outlook.com';

  // Ex 3. Replace the email hint (next to the input) with 'This is my email now'
  //       The text should be emphasized using a <strong> tag

  let myEmailHint = document.getElementById("email-hint");
  myEmailHint.innerHTML = "<strong>This is my email now</strong>";


  // Ex 4. Add the .blue CSS class to the th elements

  const addBlue = document.querySelectorAll("#data > table > thead > tr > th");

  addBlue.forEach((item) => {
    item.classList.add("blue");
  });

  // Ex 5. Count the number of table body rows there are
  //       Make the function teamCount() return it
  //       return the number of teams
  const teamCount = () => {
    const teamNumber = document.querySelectorAll("#data > table > tbody > tr");
    return teamNumber.length;
  };

  // /!\ DO NOT CHANGE THIS LINE - TEST PURPOSES
  const teamCountBeforeAddition = teamCount();

  // Ex 6. Say there is a 15th team added to the table.
  //       Add a row at the bottom, this new team should have zero points.

  const addTeam = document.querySelector("#data > table > tbody");
  addTeam.insertAdjacentHTML('beforeend', '<tr><td>15</td><td>Arsenal FC</td><td>0</td></tr>');

  // Ex 7. Write some code to sum all points given to all teams
  //       Make the function summarizePoints() return it
  //       return the sum of points
  //       return the sum

  const summarizePoints = () => {
    let sumPoints = 0;
    const points = document.querySelectorAll("#data > table > tbody > tr > td:nth-child(3)");
    points.forEach((item) => {
      sumPoints += parseInt(item.innerHTML, 10);
    });

    return sumPoints;
  };


  // Ex 8. Change the background color of all `<th>` cells to #DDF4FF
  const changeBgColor = document.querySelectorAll("#data > table > thead > tr > th");

  changeBgColor.forEach((item) => {
    item.style.backgroundColor = "#DDF4FF";
  });

  // Ex 9. Remove the "Email:" label from the DOM

  const removeEmailLabel = document.querySelector("#data > div > label");
  removeEmailLabel.parentNode.removeChild(removeEmailLabel);


  // Checking exercise answers. DO NOT MODIFY THIS LINE
  check(borisesEmail, teamCountBeforeAddition, summarizePoints());
};

