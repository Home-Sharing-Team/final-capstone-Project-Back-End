![](https://img.shields.io/badge/Microverse-blueviolet)

<br />
<p align="center">
  <a href="https://github.com/David-Verde/final-capstone-Project-Back-End">
 

  <h3 align="center">Ruby on Rails --> [final-capstone-Project-Back-End-App]</h3>

  <p align="center">
    This project is part of the Microverse curriculum Capstone Project in Ruby on rails module!
    <br />
    <a href="https://github.com/David-Verde/final-capstone-Project-Back-End"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/David-Verde/final-capstone-Project-Back-End/issues">Report Bug</a>
    ·
    <a href="https://github.com/David-Verde/final-capstone-Project-Back-End/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
  * [Usage](#usage)
  * [Automated Test](#automated-test)
* [Contributors](#contributors)
* [Acknowledgements](#acknowledgements)
* [License](#license)

<!-- ABOUT THE PROJECT -->
## About The Project
Final Capstone Project Back-End production



###
 <a href="https://github.com/David-Verde/final-capstone-Project-Back-End">
    
  </a>


## Project requirements:

The project requirements are according to the following User stories:

A) When I go to the home page:
1. I can see a selection of the latest properties to rent on the home page, with 1 photo, property title, country, city,  and the rate per cycle. Also, inside a parenthesis, must be the minimum_cycle_amount.
2. If I click on a photo or property title, I can see:
- The property title,
- The whole address,
- The category or categories assigned by the owner (beach, family, honeymoon, mountain, etc.),
- A big photo and 2 photo miniatures that can show bigger in a popup if clicked,
- A description,
- The guest_capacity, the number of bedrooms, beds, baths,
- The type (house or apartment),
- The size (must indicate what measurement unit is the size, mts2 or ft2, etc),
- The rate per cycle,
- The minimum_cycle_amount,
- The cleaning_fee,
- A button or link to go to the reservation page for this property,
- A button or link to go back to the home page 

3. I can also see a select button to select a country to show properties for that country only.
4. After selecting a country, I can see a title indicating the selected country, and the list of properties for that country with 1 photo, property title, country, city,  and the rate per cycle.  Also, inside a parenthesis, must be the minimum_cycle_amount.
5. After clicking on one photo or property title, I can see all I can see in A.2. But the button or link to go back must take me to the country list page.
6. When I click the reservation button, I can see the fields to enter check_in and check-out dates, and also a field to enter the number of guests that will stay in the property (the entered number of guests must be greater than 0, and smaller or equal to the guest capacity of the property). Optionally, I can see a calendar that shows 12 months in advance, with indicated available dates highlighted.
7. I can see a “Check dates” button to check if the requested reservation period is available.
8. After clicking in this button, I can see the messages: “The property is available for your requested dates” or “Sorry, the property is not available for your requested dates. Please try a different time period”.
9. If there isn’t availability, I can enter different dates to start a new check with the Check dates button.
10. I can also see a button to go back to the properties list (home page or country list page).
11. If there is availability, the page also shows the total amount to pay for the reservation.
12. If there is availability, the page also shows a “Reserve” button.
13. If I click the “Reserve” button, that takes the user to a page for signing up (with name, email, and password) or logging in (with email and password).
14. After successfully sing up or logging in, the page opens again the reservation page with the reservation information (user name, property title, check_in and check-out dates, total amount to pay). It shows also a confirmation message with the reservation ID and tells the user that an email will be sent to her/his email address with instructions for paying the reservation.
15. If the user was already logged in, the signup or log-in is skipped.

B) In the navbar I can see a button or link to “Become a Host”. If I click this button I will see:
- The page for signing up (with name, email, and password) or logging in (with email and password).
- After successfully sing up or logging in, I can see a form to upload all information and photos for a new property (see A.2).
- If the user was already logged in, the “Become a Host” button takes the user directly to the form, without requesting sign up or log in.
- After entering the new property info, the page shows the homepage and a message with: “Thank you for uploading your property”.

C) In the navbar I can see also buttons or links to sign up, log in, and log out.

D) In the navbar I can see a button to show the list of all uploaded properties for the logged-in user.
In each item in this list (indicated only by property title), I can see a button for updating information and a button for deleting the property from the list.

E) In the navbar I can see a button to show the list of all the reservations created by the logged-in user, with the name of the property, reservation Id, and a button to update and a button to delete it.


## Entity Relation Diagram:

./images/ERD.jpeg



### Built With
This project was built using these technologies.
* Ruby
* Visual Studio
* Rubocop
* Rails
* Css
* Capibara
* Devise
* CanCanCan

<!-- INSTALLATION -->
## Usage

To have this app on your pc, you need to:

  - Clone with SSH:
  ```
git@github.com:David-Verde/final-capstone-Project-Back-End.git
  ```
  - Clone with HTTPS
  ```
https://github.com/David-Verde/final-capstone-Project-Back-End.git
  ```

* In the project directory, you can run:

  - `$ bundle install` - installs all the dependencies required by the project

  Run Rails s command to run Ruby on Rails console

## Automated Test
 > you can run Rspec spec to check the test



## Show your support

Give a :star: if you like this project!




Authors
👤 **David Verde Alvarez**
- This is My **GitHub**: [![@David-Verde](https://img.shields.io/github/followers/omarramoun?label=David&style=social)](https://github.com/David-Verde)
- This is My **Twitter**: [![@Unyielding1](https://img.shields.io/twitter/follow/omarramoun?label=David16&style=social)](https://twitter.com/UnyieldingOne)
)

👤 Dario Alessio

GitHub: https://github.com/DarioAlessioR

Slack: https://microverse-students.slack.com/team/U039GCFRK9B

LinkedIn: https://www.linkedin.com/in/dario-alessio-3a3b7911b

This project is [MIT](https://github.com/David-Verde/final-capstone-Project-Back-End/blob/develop/LICENSE) licensed.

