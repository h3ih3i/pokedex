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
      this.$emit('open-modal', this.pokemon);
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

.pokemon-list-item {
  flex: 0 0 calc(10% - 12px);
}
</style>