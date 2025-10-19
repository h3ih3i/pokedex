<template>
  <div class="pokemon-container">
    <h1>Pokédex</h1>
      <div class="pokemon-list">
        <PokemonListItem
          v-for="pokemon in pokemons"
          :key="pokemon.id"
          :pokemon="pokemon"
          @open-modal="openModal"
        />
      </div>

      <PokemonModal
        v-if="selectedPokemon"
        :pokemon="selectedPokemon"
        @close="closeModal"
      />
  </div>
</template>

<script>
import PokemonService from '@/services/PokemonService.js'
import PokemonListItem from '@/components/Pokemon/PokemonListItem.vue'
import PokemonModal from './Pokemon/PokemonModal.vue';

export default {
  name: 'PokemonList',

  components: {
    PokemonListItem,
    PokemonModal
  },

  data() {
    return {
      pokemons: [],
      selectedPokemon: null
    }
  },

  mounted() {
    PokemonService.getPokemons().then((response) => {
      this.pokemons = response.data
    })
  },

  methods: {
    openModal(pokemon) {
      this.selectedPokemon = pokemon;
    },

    closeModal() {
      this.selectedPokemon = null;
    }
  }
}
</script>

<style scoped>
.pokedex-container {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.pokemon-container h1 {
  font-size: 48px;
  color: #ccc;
  margin-bottom: 20px;
  text-align: center;
}

.pokemon-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 12px;
}
</style>
