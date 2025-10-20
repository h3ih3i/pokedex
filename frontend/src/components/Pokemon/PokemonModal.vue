<template>
  <div class="modal-overlay" @click.self="close">
    <div class="modal-content">
      <div class="modal-header">
        <h2>{{ pokemon.name }}</h2>
        <button class="update-pokemon type-badge" @click="updatePokemon">Update</button>
        <button class="delete-pokemon type-badge" @click="deletePokemon">Delete</button>
      </div>
      <img :src="pokemon.image_url" :alt="pokemon.name" />
      <div class="types">
        <span v-for="type in pokemon.types" :key="type" class="type-badge" :class="setTypeClass(type)">
          {{ type }}
        </span>
      </div>
      <div class="stats">
        <p><strong>HP:</strong> {{ pokemon.stats.hp }}</p>
        <p><strong>Attack:</strong> {{ pokemon.stats.attack }}</p>
        <p><strong>Defense:</strong> {{ pokemon.stats.defense }}</p>
        <p><strong>Speed:</strong> {{ pokemon.stats.speed }}</p>
        <p><strong>Speed Attack:</strong> {{ pokemon.stats.speed_attack }}</p>
        <p><strong>Speed Defense:</strong> {{ pokemon.stats.speed_defense }}</p>
      </div>
    </div>
  </div>
</template>

<script>
import PokemonService from '@/services/PokemonService.js';

export default {
  name: "PokemonModal",
  props: {
    pokemon: {
      type: Object,
      required: true,
    },
  },

  methods: {
    close() {
      this.$emit("close");
    },

    setTypeClass(type) {
      return type.toLowerCase();
    },

    updatePokemon() {
      // Logic to update the Pokemon
      alert(`Update functionality for ${this.pokemon.name} is not implemented yet.`);
    },

    deletePokemon() {
      PokemonService.deletePokemon(this.pokemon.id)
        .then(() => {
          this.$emit("close");
        })
        .catch((error) => {
          console.error("Error deleting Pokemon:", error);
        });
    },
  },
};
</script>

<style scoped>

.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.7);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
}

.modal-content {
  background: #222;
  color: #fff;
  border-radius: 12px;
  padding: 20px;
  text-align: center;
  max-width: 400px;
  box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
}

.modal-content img {
  width: 200px;
  height: auto;
  margin-bottom: 12px;
}

.modal-content h2 {
  margin-bottom: 10px;
}

.type-badge {
  display: inline-block;
  background-color: #444;
  color: #fff;
  border-radius: 8px;
  padding: 6px 12px;
  margin: 4px;
  font-size: 14px;
}

.stats p {
  margin: 6px 0;
}

.update-pokemon {
  background-color: #4CAF50;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.delete-pokemon {
  background-color: #c72e1d;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

</style>
