import axios from 'axios'

export default {
  getPokemons() {
    return axios.get('http://localhost:3000/pokemons.json')
  },

  createPokemon(pokemon) {
    console.log(pokemon)
    return axios.post('http://localhost:3000/pokemons', { pokemon })
  }
}