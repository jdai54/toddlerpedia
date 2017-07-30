# Toddlerpedia
## An online resource on toddlers

Toddlerpedia is a Ruby on Rails application for everything you want to know about those crazy toddlers. There is plenty of stuff online for infants but what about toddlers?? This application allows users to create public and private Markdown-based wikis.  Users can upgrade to premium membership which will allow them to create private wikis and collaborate with other users. This feature is designed for users who want to be able to maintain some privacy, but still be able to discuss topics with those who they trust.

This app is deployed on Heroku: https://toddlerpedia.herokuapp.com/

The source code is available, here, on github: https://github.com/jdai54/toddlerpedia

## Features
- Users can sign up for an account (via the Devise gem), receive a confirmation email, retrieve and change their passwords.
- Users can view, edit and create public wikis using markdown syntax (via the RedCarpet gem).
- Users can upgrade to premium membership (via the Stripe gem).
- Premium members can create an unlimited number of private wikis.
- Premium members can add collaborators, both standard and premium users, to a wiki.
- Premium members can downgrade their account to standard.

## Setup and Configuration
**Ruby v. 2.3.3**
**Rails v. 4.2.5**
**Databases:** SQLite (Test, Development), PostgreSQL (Production)

**Gems Used:**
- Devise, User Authentication
- Faker, Seed Database
- Factory Girl, Development
- Bootstrap, styling
- Bcrypt, data encryption
- Figaro, environmental variables
- Devise, User management
- Pundit, authorization
- Stripe, payment processing
- RedCarpet, Markdown syntax

**Set-up:**
- Environmental variables were secured using Figaro and are stored in config/application.yml (ignored by github)
- The config/application.example.yml illustrates the formatting for environmental variables.

**To run Toddlerpedia locally:**
- Clone the repository
- Run bundle install
- Create and migrate the SQLite database with rake db:create and rake db:migrate
- Start the server using rails s
- Run the app on localhost:3000
