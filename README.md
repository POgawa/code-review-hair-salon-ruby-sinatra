# Hair Salon Code Review

## Contributor(s):
1. Paul Ogawa (https://github.com/Pogawa)

##Date:
May 7, 2015
## Installation


Retrieve the included Gemfile and Run the following command
```
bundle install
```
##Database setup
username=# CREATE DATABASE hair_salon;
username=# \c hair_salon;
hair_salon=# CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
hair_salon=# CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
hair_salon=# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

## Usage

To use the app run
```
ruby app.rb
```
Navigate in your browser to localhost:4567 and enjoy!!

### Bug reports

If you discover any bugs, feel free to create an issue on GitHub. Please add as much information as
possible to help us fixing the possible bug. We also encourage you to help even more by forking and
sending us a pull request.


## License

MIT License. Copyright 2015
