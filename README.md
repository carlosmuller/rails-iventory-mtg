# Ruby version 2.3.3

# Rails version 5.0.2

# Database (Postgresql 9.6.1)
Don't forget to change config/database.yml to match your system configurations,
then to create and run migrations for the first time:
  
``` rails db:setup```

If  you created a migration and want to run it:
  
``` rails db:migrate```

#First run
 1. Access  ```localhost:3000/firstseed``` - to poupulate the database 
 
#Update database
 1. To add a new set access ```localhost/add/set/[JSON name]``` 
 
 ..* the json name can be obtained on the mtgjson and will be on the link like: https://mtgjson.com/json/MM3-x.json, the name of the set is MM3-x  

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
