import axios from 'axios'

export default {
  getPokemons() {
    return axios.get('http://localhost:3000/pokemons.json')
  },

  createPokemon(pokemon) {
    return axios.post('http://localhost:3000/pokemons', { pokemon })
  },

  updatePokemon(pokemonId, updatedData) {
    return axios.put(`http://localhost:3000/pokemons/${pokemonId}`, { pokemon: updatedData })
  },

  deletePokemon(pokemonId) {
    return axios.delete(`http://localhost:3000/pokemons/${pokemonId}`)
  }
}