json.extract! pokemon, :id, :name, :poke_index, :generation, :legendary
json.total pokemon.calculate_total
json.type [pokemon.type_1, pokemon.type_2].compact
json.stats do
  json.hp pokemon.hp
  json.attack pokemon.attack
  json.defense pokemon.defense
  json.speed pokemon.speed
  json.speed_attack pokemon.speed_attack
  json.speed_defense pokemon.speed_defense
end