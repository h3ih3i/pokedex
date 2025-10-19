<template>
  <div class="pokemon-list-item" @click="openModal">
    <img :src="pokemon.image_url" :alt="pokemon.name"/>
  </div>
</template>

<script>
export default {
  name: 'PokemonListItem',

  props: {
    pokemon: {
      type: Object,
      required: true
    }
  },

  methods: {
    openModal() {
      // Logic to open modal goes here
      alert(`Open modal for ${this.pokemon.name}`);
    }
  },

}
</script>

<style scoped>
.pokemon-list-item img {
  width: 100%;
  height: auto;
  transition: transform 0.2s ease;
}

.pokemon-list-item img:hover {
  transform: scale(1.5);
  cursor: pointer
}
</style>