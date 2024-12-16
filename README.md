# Ascendant: The Astrology Dating App
Project is authored by Daisy Chen, Nhu Nguyen, and Alexandra Butler.

## Instructions to Run the Application
Start by opening Flutter and debug or run the application on the iPhone 16 Pro Max simulator. The user should be taken to a login screen where the user can use one of the following test profile or complete the steps to create a profile to be sent to review.
Username|Password
:------:|:------:
alex    | test

_Note: When creating a profile, be sure to use the **iPhone simulator**._ You will be redirected to a page that states your application is under review. There is also an option in the creating a profile form for users that do not know their signs to be redirected to a website to do so. **Important: information in creating profile does not save (as we focused more on front-end development).**

If **logged in under the test profile**, the user will be taken to the page containing the matches with a navigation screen at the button. The first tab is displayed on the navigation bar and in this, allows users to swipe through a given amount of test profiles using the thumbs up button for like or thumbs down button for dislike. The user can also click on the information button in the middle to see more information about the profile displayed such as how their zodiac big three traits impact their personality and prompts. _If the user likes all of the available matches, they will be notified they have run out of matches but only when all available matches are liked. Dislikes may reappear, as with other dating apps, to keep the available options open for user reconsideration._

The **second tab contains the messaging page** that shows the general messaging API with two predefined responses. Users can click on the messages and receive a specific response when saying hi to the automated messaging or receive the general response with any other form of messages. The messaging does not simulate actual messages but gives the user an idea of how actual implemented messaging would appear on the user end.

The **third and final tab contains the account page** that allows the user to modify aspects of their profile that would be viewed by other users. By tapping the pencil button, users can modify prompt questions and answers and click the newly appeared check icon when done completing the changes.
When exiting, the user may close the app or simply click the red X at the top left corner of the screen to return to the login page.

_Please note that user profile information and matches made are not saved during the application’s run time as doing so would require a more extensive backend with database support which would go beyond the scope of this course. When testing, it may be observed that matches are reset when clicking out or user profile information is not saved when exiting the account page. This is due to the use of fake data and creation of instances to keep user data consistent and with more time and further work on the backend, would be solved with database support._
