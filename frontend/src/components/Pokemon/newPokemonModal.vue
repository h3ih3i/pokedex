<template>
  <div class="modal-overlay" @click.self="close">
    <div class="modal-content">
      <div class="pokemon-form">
        <h2>Add a new Pokémon</h2>

        <form @submit.prevent="submitForm">
          <div class="form-group">
            <label for="name">Name</label>
            <input v-model="pokemonData.name" type="text" required />
          </div>
          <div class="form-group">
            <label for="name">Type 1</label>
            <input v-model="pokemonData.type_1" type="text" required />
          </div>
          <div class="form-group">
            <label for="name">Type 2</label>
            <input v-model="pokemonData.type_2" type="text" />
          </div>
          <div class="form-group">
            <label for="name">hp</label>
            <input v-model="pokemonData.hp" type="number" required />
          </div>
          <div class="form-group">
            <label for="name">Attack</label>
            <input v-model="pokemonData.attack" type="number" required />
          </div>
          <div class="form-group">
            <label for="name">Defence</label>
            <input v-model="pokemonData.defense" type="number" required />
          </div>
          <div class="form-group">
            <label for="name">Speed</label>
            <input v-model="pokemonData.speed" type="number" required />
          </div>
          <div class="form-group">
            <label for="name">Speed Attack</label>
            <input v-model="pokemonData.speed_attack" type="number" required />
          </div>
          <div class="form-group">
            <label for="name">Speed Defence</label>
            <input v-model="pokemonData.speed_defense" type="number" required />
          </div>
          <div class="form-group">
            <label for="name">Generation</label>
            <select v-model="pokemonData.generation">
              <option>1</option>
              <option>2</option>
              <option>3</option>
            </select>
          </div>
          <div class="form-group">
            <label for="name">Legendary</label>
              <input type="checkbox" id="checkbox" v-model="pokemonData.legendary" />
          </div>

          <div class="form-group">
            <label for="image">Image</label>
            <input
              type="file"
              id="image"
              @change="onFileChange"
              accept="image/*"
              required
            />
          </div>

          <div v-if="preview" class="preview">
            <img :src="preview" alt="Preview" />
          </div>

          <button type="submit">Add Pokémon</button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import PokemonService from "@/services/PokemonService";

export default {
  name: "NewPokemonModal",

  data() {
    return {
      name: "",
      preview: null,
      pokemonData: {
        name: "",
        type_1: "",
        type_2: "",
        hp: null,
        attack: null,
        defense: null,
        speed: null,
        speed_attack: null,
        speed_defense: null,
        generation: 1,
        legendary: false,
        image: null,
      }
    };
  },

  methods: {
    close() {
      this.$emit("close");
    },

    setTypeClass(type) {
      return type.toLowerCase();
    },

    onFileChange(event) {
      console.log(event)
      const file = event.target.files[0];
      this.pokemonData.image = file;

      if (file) {
        this.preview = URL.createObjectURL(file);
      }
    },

    submitForm() {
      PokemonService.createPokemon(this.pokemonData)
        .then(() => {
          this.close();
        })
        .catch((error) => {
          console.error("Error adding Pokémon:", error);
        });
    }
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

</style>
