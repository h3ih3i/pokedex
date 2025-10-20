<template>
  <div class="pokemon-container">
    <h1>Pokédex</h1>
    <button class="add-new-pokemon" @click="addPokemon">add New Pokemon</button>
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

      <NewPokemonModal
        v-if="addingPokemon"
        @close="doneAddingPokemon"
      />
  </div>
</template>

<script>
import PokemonService from '@/services/PokemonService.js'
import PokemonListItem from '@/components/Pokemon/PokemonListItem.vue'
import PokemonModal from './Pokemon/PokemonModal.vue';
import NewPokemonModal from './Pokemon/newPokemonModal.vue';

export default {
  name: 'PokemonList',

  components: {
    PokemonListItem,
    PokemonModal,
    NewPokemonModal
  },

  data() {
    return {
      pokemons: [],
      selectedPokemon: null,
      addingPokemon: false
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
    },

    addPokemon() {
      this.addingPokemon = true;
    },

    doneAddingPokemon() {
      this.addingPokemon = false;
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

.add-new-pokemon {
  background-color: #4CAF50;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-bottom: 20px;
}
</style>
