require 'rails_helper'

RSpec.describe "Pokemon", type: :request do
  describe "GET" do
    before :each do
      Pokemon.create(name: 'Sword', poke_index: 6000)
      Pokemon.create(name: 'Sword2', poke_index: 6000)
      Pokemon.create(name: 'Sword3', poke_index: 6000)
    end
    it 'get all pokemons' do
      get pokemons_path(format: :json)

      expect(JSON.parse(response.body).length).to eq(3)
    end

    it 'get pokemon by name' do
      get pokemons_path(format: :json),
        params: {
          name: 'sword'
        }
      expect(JSON.parse(response.body).length).to eq(1)
    end
  end

  describe "CREATE" do
    it 'create a new pokemon' do
      post pokemons_path(format: :json),
        params: {
            name: 'sheld',
            poke_index: 1000
        }

      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)
      expect(json['name']).to eq('sheld')
    end

    it 'create a new pokemon with same name' do
      Pokemon.create(name: 'sheld', poke_index: 6000)
      post pokemons_path(format: :json),
        params: {
          name: 'sheld',
          poke_index: 1000
        }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "UPDATE" do
    it 'change pokeman index' do
      pokemon = Pokemon.create(name: 'sheld', poke_index: 6000)

      put pokemon_path(pokemon, format: :json),
        params: {
            poke_index: 100
        }
      pokemon.reload
      expect(pokemon.poke_index).to eq(100)
    end
  end

  describe "DELETE" do
    it 'delete the pokemon' do
      pokemon = Pokemon.create(name: 'sheld', poke_index: 6000)

      expect {
        delete pokemon_path(pokemon, format: :json)
      }.to change(Pokemon, :count).by(-1)
    end
  end
end