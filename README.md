# ImageApp -- A simple image sharing application

## Getting Started
This is all the work I did in a day, please provide your feedback, it will be resourceful to me.

1. Install required Gems

        $ cd path_to_ImageApp && bundle install

2. create database.yml and .env

        $ cp config/database.yml.example config/database.yml

        $ cp .env.example .env

3. Create and migrate database.

        
        $ rails db:create && rails db:migrate 

        $ rails s