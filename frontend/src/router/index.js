import { createRouter, createWebHistory } from 'vue-router'
import PokemonList from '@/components/PokemonList.vue'

const routes = [
  {
    path: '/',
    name: 'Pokedex',
    component: PokemonList
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
