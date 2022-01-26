
```
    ____                  __         ____        __    
   / __ \____ _____  ____/ /___ _   / __ )____  / /_   
  / /_/ / __ `/ __ \/ __  / __ `/  / __  / __ \/ __ \
 / ____/ /_/ / / / / /_/ / /_/ /  / /_/ / / / / /_/ /
/_/    \__,_/_/ /_/\__,_/\__,_/  /_____/_/ /_/_.___/ 
                                                                                             
```
**PandaBnb** was made in collaboration as part of our training with Makers. It is built so a user can create an account, list various properties ("spaces"), view all listed spaces and manage their listings.

## Set-up 
This project was developed using `Ruby 3.1.0` and the following dependencies: 
* BCrypt
* Capybara
* PG
* Puma
* Rspec
* Sinatra
* WEBrick


### To set up the database
Connect to `psql` and create the `makersbnb` database:
```
CREATE DATABASE makersbnb;
```
To set up appropriate tables, connect to the databse in `psql` and run the SQL scripts in the 'db/migrations' folder in the given order.

To set up the **test environment**, repeat the above steps with the database name `makersbnb_test` instead.

## User Stories

### User Story One
```
As a user
So that I can use MakersBnB
I'd like to be able to sign up
```
**Diagram for user story one:**

<img src="https://user-images.githubusercontent.com/24737738/150827976-332adfc0-d6fe-4118-a516-7c024ee0537d.png" width="70%">

The following shows the user pathing for creating an account vs logging in to an existing account - demonstrating how both paths end up at the same page in the end. When a user creates a new account they are automatically logged in after that.
![A screenshot of the user experience for logging in](./assets/img/log_in.png)

### User Story Two
```
As a user
So that I can rent a space
I'd like to view all spaces
```
**Diagram for this user story**
![A domain diagram explaining how we got listing all spaces to work](./assets/img/all_spaces.png)
### User Story Three
```
As a user
So that I can rent out my spaces
I'd like to be able to list a new space
```

### User Story Four
```
As a user
So that I can give more information on a space
I'd like to give my spaces a name, description and price
```

### User Story Five
```
As a user
So that I can show when my space is available
I'd like to specify the dates it's available
```