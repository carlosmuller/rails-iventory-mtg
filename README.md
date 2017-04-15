# Ruby version 2.3.3

# Rails version 5.0.2

# Database (Postgresql 9.6.1)
Don't forget to change config/database.yml to match your system configurations,
then to create and run migrations for the first time:
  
```rake db:setup```

If  you created a migration and want to run it:
  
``` rake db:migrate```

# Third party libraries or sites
To populate the database we used [mtgjson](https://mtgjson.com/)

# TODO
  * Seed all cards from mtgjson, and explain setup
  * Create docs of the model Cards and how to use it
  * Search cards
  * Create model user
  * Create user inventory
  * Heroku deploy
  * (MAYBE) Show prices
  * (MAYBE) Deck list
