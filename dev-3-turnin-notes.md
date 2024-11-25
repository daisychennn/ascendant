# Key Tasks
The tasks that we completed were creating a profile/logging in, the initial survey, and the messaging. The user is able to login using mock data for accounts or go through the steps of creating a profile by filling in personal information like their name, age, and astrological signs. Following this, the user will be directed to fill out our initial survey (to ensure safety of our app). Furthermore, our messaging key task has fake data that mimics other profiles on the app that the user will be able to message so that, like in other existing dating apps, they would be able to talk and get to know the person beyond the profile. Our other key tasks which are starting to be implemented are the matching and swiping through fine tuning the front end with our profile view in the matching section and the account view in the editable account section.

# User Story Behind Decisions
Our app focuses on matching based on astrology which is reflected both in the name and design of the app. Our name stems from the alternative name of rising or star signs typically called ascendant signs and our logo is based on the concept of star signs. In making our app, we drew inspiration from queer dating culture which has subsections that focus on astrology with a common bio listing the sun, moon, and rising signs to help decide on dating a certain person. The sun, moon, and rising sign, often called the Big Three, represent different aspects of a person with the sun sign representing a person’s core identity, the moon sign representing emotional and internal needs, and the rising sign representing the outward presentation of the person. For those interested in astrology and in our app, using the astrological signs is important to differentiate different personality types and compatibility towards their own needs. Our app shows the sun, moon, and rising signs, which are represented by the sun icon, moon icon, and star icon within our app, directly on the profile along with other key points of information including the age, name, and profile picture of the person to emphasize in the importance of astrology in this dating app as avid astrology enthusiasts can understand the meaning of these signs from this information alone. To further extend our astrological influence, we will be providing small descriptions of common behaviors of each sign’s needs and presentations under the sun, moon, and rising and if time allows, creating a matching algorithm based on these features.

# Major Changes from Software Architecture
One change from DEV-1 was with the messaging portion, where the chat feature is made using Flutter Chat UI rather than Get Streams. Flutter Chat UI provides an in-app chat implementation and has an optional Firebase BaaS, which was part of the reason for switching to this library because it did not require an extensive back-end supporting software to use. Another thing was that the messaging view also includes a list of messages in addition to the actual chatting because most dating apps will include that as a view.
Another change was that instead of using the UserFront library for login, we used already made logins through YouTube tutorials and source code from (https://codingwitht.com/flutter-signup-page-ui-example-flutter-ui-2022/) and https://github.com/otabekinha/login-ui-flutter/tree/maint), as this provided a more in depth understanding of how the login works without the restrictions and necessary required documentations with UserFront. 


# Running the App
Our app should be run on a mobile phone simulator (using the iPhone 16 Pro Max) through Visual Studio Code. Once it is running, 
If the user has an account already, they will login with their username and password
Test data:
Username: daisy
Password: test
After clicking login, it will direct them to the homescreen with the Profile Matches View as the next view. The Messaging and Account Views can be accessed from the bottom navigation bar.
If the user does not have an account, they will click on the “Create Profile” button at the bottom
They will be prompted to create a profile by filing in their information like name, age, bio, and Big Three signs. 
After creating a profile, they will be directed to fill out an initial survey. 
Note: the Submit button currently does not do anything. However, we plan for it to direct to a page that states “Thank you for your interest in our app. We will review your answers to ensure you are a good match.”
Once logged in, the screen should take the user to their matches page and has a navigation bottom bar to edit their profile and the chat feature.
In the messaging tab, the user is able to click and drag (to scroll through) horizontally on the top section of the screen with the profile pictures, which represent their recent chats. They can also click and drag vertically on the bottom section that shows any other chats. If they click on a chat from this bottom section, they will be taken to a chat UI where they can send messages. 