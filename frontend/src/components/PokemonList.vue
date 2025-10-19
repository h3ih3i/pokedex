<template>
  <div class="pokemon-container">
    <h1>Pokédex</h1>
      <div class="pokemon-list">
        <PokemonListItem
        v-for="pokemon in pokemons"
        :key="pokemon.id"
        :pokemon="pokemon"
        class="pokemon-item"
      />
      </div>
  </div>
</template>

<script>
import PokemonService from '@/services/PokemonService.js'
import PokemonListItem from '@/components/Pokemon/PokemonListItem.vue'

export default {
  name: 'PokemonList',

  components: {
    PokemonListItem
  },

  data() {
    return {
      pokemons: [],
    }
  },

  mounted() {
    PokemonService.getPokemons().then((response) => {
      this.pokemons = response.data
    })
  },
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

.pokemon-item {
  flex: 0 0 calc(10% - 12px);
}
</style>
