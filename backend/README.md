Pokédex Backend
A simple RESTFul API of CRUD

## Built With

- PostgreSql
- RSpec

## Installation

- bundle install
- rails db:seed
- rails serve

## Documentation

- Database config infomation is saved in database.yml.
- If database not created use command `rails db:create`.
- Have 6 request tests. `rspec spec/request/pokemon_spec.rb`
- Pokemons.csv is saved in `lib/seed/pokemon.csv.
- `rails db:seed` is used to populate the database.
