Pokédex Backend
A simple RESTFul API of CRUD

## Built With

- Rails 8.0.3
- PostgreSql
- RSpec
- ActiveStorage

## How to start the backend

```bash
bundle install
rails db:create
rails db:migrate
rails db:seed
rails serve
```

## Documentation

- Database config infomation is saved in database.yml.
- Have 6 request tests. `rspec spec/request/pokemon_spec.rb`
- Pokemons.csv is saved in `pokemon.csv.
- `rails db:seed` is used to populate the database.

## Nice to hace

- Cache to store Pokemons list.
- Sentry, CI/CD.
