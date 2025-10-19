import axios from 'axios'

export default {
  getPokemons() {
    return axios.get('http://localhost:3000/pokemons.json')
  },
}